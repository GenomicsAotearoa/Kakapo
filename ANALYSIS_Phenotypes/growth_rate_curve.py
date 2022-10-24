from collections import defaultdict

import numpy as np
import pandas as pd
import scipy.stats
import tensorflow as tf
import tensorflow_addons as tfa
import tensorflow_probability as tfp
import os

tfkl = tf.keras.layers
tfk = tf.keras
tfd = tfp.distributions
tfb = tfp.bijectors
tfko = tf.keras.optimizers
tfpl = tfp.layers

# Ripe rimu in 2002 and 2019 on Whenua Hou, 2016 and 2019 on Anchor

characters = pd.read_csv("kakapo_characters.csv")
characters["sex"] = characters["sex"].astype("category")
characters["nestMotherName"] = characters["nestMotherName"].astype("category")
characters["layIsland"] = characters["layIsland"].astype("category")

sex_by_bird = dict()
eggLength = dict()
eggWidth = dict()
eggWeight = dict()
nestMother = dict()
layisland = dict()
handreared = dict()

for idx, row in characters.iterrows():
    sex_by_bird[row.birdName] = row.sex
    nestMother[row.birdName] = row.nestMotherName
    eggLength[row.birdName] = row["length"]
    eggWidth[row.birdName] = row["width"]
    eggWeight[row.birdName] = row["weight"]
    layisland[row.birdName] = row["layIsland"]

    hr = 0
    if row.nestMotherName == "Handraise":
        hr = 1

    handreared[row.birdName] = hr

chickid_to_name = dict()
names = pd.read_csv("2019_final_names.csv")
for idx, row in names.iterrows():
    chickid_to_name[row["Chick ID"]] = row["Name"]

weights = pd.read_csv("chick_weights_all.csv")
for idx, row in weights.iterrows():
    weights.loc[idx, "birth_year"] = row["dateHatched"][0:4]
    if row["birdName"] in chickid_to_name:
        newname = chickid_to_name[row["birdName"]]
        if newname in set(characters.birdName.to_list()):
            weights.loc[idx, "birdName"] = chickid_to_name[row["birdName"]]

for idx, row in weights.iterrows():
    bird_name = row["birdName"]
    weights.loc[idx, "lay_island"] = layisland[bird_name]
    weights.loc[idx, "handreared"] = handreared[bird_name]
    weights.loc[idx, "nestMother"] = nestMother[bird_name]

weights["island"] = [x.lower() for x in weights["island"]]
for island in weights["island"].unique():
    weights[island + "_pct"] = 0.0

weights["sex"] = [sex_by_bird[x] for x in weights["birdName"]]

weights = weights.drop(weights[weights.age < 0].index)  # And less than 0 days!
weights = weights.drop(weights[weights.age > 80].index)

to_remove = (weights["birdName"].value_counts() < 30).to_dict()
for k, v in to_remove.items():
    if v:
        weights = weights.drop(weights.loc[weights["birdName"] == k].index)

birds_island = defaultdict(lambda: defaultdict(int))
for _, row in (
    weights.groupby(by=["birdName", "island"]).agg("size").reset_index().iterrows()
):
    b = row["birdName"]
    i = row["island"]
    x = row[0]
    birds_island[b][i] += x

birds_island_pct = defaultdict(lambda: defaultdict(float))

for bird in birds_island.keys():
    total = np.sum(list(birds_island[bird].values()))

    for island in birds_island[bird].keys():
        birds_island_pct[bird][island] = birds_island[bird][island] / total

bird_island_pcts = pd.DataFrame.from_dict(birds_island_pct, orient="index").fillna(0.0)

weights = weights.drop(weights[weights["sex"] == "Unknown"].index)
weights["birdName"].nunique()

bird_count = weights.nunique()["birdName"]
bird_id = range(bird_count)
bird_to_id = dict(zip(weights["birdName"].unique(), bird_id))
id_to_bird = {y: x for x, y in bird_to_id.items()}

year_count = weights.nunique()["birth_year"]
year_id = range(year_count)
year_to_id = dict(zip(weights["birth_year"].unique(), year_id))
id_to_year = {y: x for x, y in year_to_id.items()}

layisland_count = weights.nunique()["lay_island"]
layisland_id = range(layisland_count)
layisland_to_id = dict(zip(weights["lay_island"].unique(), layisland_id))
id_to_layisland = {y: x for x, y in layisland_to_id.items()}

island_count = weights.nunique()["island"]
island_id = range(island_count)
island_to_id = dict(zip(weights["island"].unique(), island_id))
id_to_island = {y: x for x, y in island_to_id.items()}

layislandby = list()
islandby = list()

for i, d in weights[["lay_island", "dateHatched", "island"]].iterrows():
    by = d[1][0:4]
    layisland = d[0]
    island = d[2]
    layislandby.append(str(by + "_" + layisland))
    islandby.append(str(by + "_" + island))

weights["layisland_by_year"] = layislandby
weights["island_by_year"] = layislandby

layislandby_count = weights.nunique()["layisland_by_year"]
layislandby_id = range(layislandby_count)
layislandby_to_id = dict(zip(weights["layisland_by_year"].unique(), layislandby_id))
id_to_layislandby = {y: x for x, y in layisland_to_id.items()}

weights["layislandby"] = [
    layislandby_to_id[d["layisland_by_year"]] for i, d in weights.iterrows()
]

islandby_count = weights.nunique()["island_by_year"]
islandby_id = range(islandby_count)
islandby_to_id = dict(zip(weights["island_by_year"].unique(), islandby_id))
id_to_islandby = {y: x for x, y in island_to_id.items()}

weights["islandby"] = [
    islandby_to_id[d["island_by_year"]] for i, d in weights.iterrows()
]

[bird_count, year_count, layisland_count]

weights = weights.drop(weights[weights.birdName == "F2-2002"].index)

weights["age_day"] = np.floor(weights["age"])
weights["age_day"] = weights["age_day"].astype(int)
weights["island"] = weights["island"].astype("category")
weights["island_code"] = weights["island"].cat.codes

assert weights["age_day"].max() == 80

weights["id"] = [bird_to_id[x] for x in weights.birdName]
weights["handreared"] = weights["handreared"].astype("int32")
weights["island"] = [x.lower() for x in weights["island"].to_list()]
# weights.drop(weights[weights.island == "massey university"].index, inplace=True)
# weights.drop(weights[weights.island == "hauturu"].index, inplace=True)
weights["island"] = weights["island"].astype("category")
weights["island_by_year"] = weights["island_by_year"].astype("category")
weights["island_code"] = weights["island"].cat.codes.astype("int32")
weights["islandby_code"] = weights["island_by_year"].cat.codes.astype("int32")
weights["sex"] = weights["sex"].astype("category")
weights["sex_code"] = weights["sex"].cat.codes.astype("int32")
weights["day_floor"] = np.floor(weights["age"])
weights["day_floor"] = weights["day_floor"].astype("int32")


weights = weights.reset_index()

weights.head()

max_weights = (
    weights[(weights["sex"] == "Male") & (weights["age"] > 30)][["birdName", "weight"]]
    .groupby("birdName")
    .max()
)
to_drop = max_weights[max_weights["weight"] < 1.4].reset_index()["birdName"].to_list()
to_drop = set(to_drop)
for i in to_drop:
    weights.drop(weights[weights["birdName"] == i].index, inplace=True)
len(to_drop)

weights["birth_year"] = weights["birth_year"].astype("category")
weights["birth_year_code"] = weights["birth_year"].cat.codes
weights["birth_year_code"] = weights["birth_year_code"].astype("int32")

weights["nestMother"] = weights["nestMother"].astype("category")
weights["nest_mother_code"] = weights["nestMother"].cat.codes
weights["nest_mother_code"] = weights["nest_mother_code"].astype("int32")

weights[weights["island"] == "massey university"]["birdName"].unique()

weights["birdName"] = weights["birdName"].astype("str").astype("category")
weights["id"] = weights["birdName"].cat.codes.astype("int32")

# Joint Distribution
# Let's model on sex, handreared, island, and island by year

Root = tfd.JointDistributionCoroutine.Root  # Convenient alias.


def make_formula(
    age,
    sex,
    day_floor,
    handreared,
    island,
    islandby,
    birthyears,
    nestmothers,
    chicks,
    n_islands,
    n_islandby,
    n_days,
    n_birthyears,
    n_nestmothers,
    n_chicks,
):
    def model():
        b0_sex_weight = yield Root(
            tfd.Normal(loc=tf.ones(2), scale=tf.ones(2), name="b0_SexDistributionFixed")
        )
        b0_handreared_weight = yield Root(
            tfd.Normal(loc=tf.ones(2), scale=tf.ones(2), name="b0_HandRearedFixed")
        )
        b0_island_prior = yield Root(
            tfd.Normal(
                loc=tf.ones(n_islands),
                scale=tf.ones(n_islands),
                name="b0_IslandPriorRandom",
            )
        )
        b0_islandby_prior = yield Root(
            tfd.Normal(
                loc=tf.zeros((n_birthyears, n_islands)),
                scale=1e-5 + tf.zeros((n_birthyears, n_islands)),
                name="b0_IslandByPriorRandom",
            )
        )
        b0_birth_year = yield Root(
            tfd.Normal(
                loc=tf.ones(n_birthyears),
                scale=tf.ones(n_birthyears),
                name="b0_BithYear",
            )
        )
        b0_nest_mother = yield Root(
            tfd.Normal(
                loc=tf.zeros(n_nestmothers),
                scale=tf.ones(n_nestmothers),
                name="b0_NestMother",
            )
        )
        b0_chick = yield Root(
            tfd.Normal(
                loc=tf.zeros(n_chicks),
                scale=tf.ones(n_chicks),
                name="b0_Chicks",
            )
        )
        b0_intercept = yield Root(tfd.Normal(loc=2.0, scale=1.0, name="b0_intercept"))
        # b0_likelihood_scale = yield Root(tfd.HalfNormal(scale=1., name="b0_likelihood_scale_prior"))

        b1_sex_weight = yield Root(
            tfd.Normal(loc=tf.ones(2), scale=tf.ones(2), name="b1_SexDistributionFixed")
        )
        b1_handreared_weight = yield Root(
            tfd.Normal(loc=tf.ones(2), scale=tf.ones(2), name="b1_HandRearedFixed")
        )
        b1_island_prior = yield Root(
            tfd.Normal(
                loc=tf.ones(n_islands),
                scale=tf.ones(n_islands),
                name="b1_IslandPriorRandom",
            )
        )
        b1_islandby_prior = yield Root(
            tfd.Normal(
                loc=tf.zeros((n_birthyears, n_islands)),
                scale=1e-5 + tf.zeros((n_birthyears, n_islands)),
                name="b1_IslandByPriorRandom",
            )
        )
        b1_birth_year = yield Root(
            tfd.Normal(
                loc=tf.ones(n_birthyears),
                scale=tf.ones(n_birthyears),
                name="b1_BithYear",
            )
        )
        b1_nest_mother = yield Root(
            tfd.Normal(
                loc=tf.zeros(n_nestmothers),
                scale=tf.ones(n_nestmothers),
                name="b1_NestMother",
            )
        )
        b1_chick = yield Root(
            tfd.Normal(
                loc=tf.zeros(n_chicks),
                scale=tf.ones(n_chicks),
                name="b1_Chicks",
            )
        )
        b1_intercept = yield Root(tfd.Normal(loc=2.0, scale=1.0, name="b1_intercept"))
        # b1_likelihood_scale = yield Root(tfd.HalfNormal(scale=1., name="b1_likelihood_scale_prior"))

        M_sex_weight = yield Root(
            tfd.Normal(loc=tf.ones(2), scale=tf.ones(2), name="M_SexDistributionFixed")
        )
        M_handreared_weight = yield Root(
            tfd.Normal(loc=tf.ones(2), scale=tf.ones(2), name="M_HandRearedFixed")
        )
        M_island_prior = yield Root(
            tfd.Normal(
                loc=tf.ones(n_islands),
                scale=tf.ones(n_islands),
                name="M_IslandPriorRandom",
            )
        )
        M_islandby_prior = yield Root(
            tfd.Normal(
                loc=tf.ones((n_birthyears, n_islands)),
                scale=1e-5 + tf.zeros((n_birthyears, n_islands)),
                name="M_IslandByPriorRandom",
            )
        )
        M_birth_year = yield Root(
            tfd.Normal(
                loc=tf.ones(n_birthyears),
                scale=tf.ones(n_birthyears),
                name="M_BithYear",
            )
        )
        M_nest_mother = yield Root(
            tfd.Normal(
                loc=tf.zeros(n_nestmothers),
                scale=tf.ones(n_nestmothers),
                name="M_NestMother",
            )
        )
        M_chick = yield Root(
            tfd.Normal(
                loc=tf.zeros(n_chicks),
                scale=tf.ones(n_chicks),
                name="M_Chicks",
            )
        )
        M_intercept = yield Root(tfd.Normal(loc=2.0, scale=1.0, name="M_intercept"))
        # M_likelihood_scale = yield Root(tfd.HalfNormal(scale=1., name="M_likelihood_scale_prior"))

        day_scale_dist = yield Root(
            tfb.Softplus()(tfd.Normal(loc=1.0, scale=tf.ones(n_days), name="day_scale"))
        )

        # island_effects_b0 = tf.gather(b0_island_prior, island, axis=-1)
        island_effects_b0 = tf.math.reduce_sum(
            tf.math.multiply_no_nan(b0_island_prior, island), axis=-1
        )
        islandby_effects_b0 = tf.gather(b0_islandby_prior, birthyears, axis=-2)
        islandby_effects_b0 = tf.math.reduce_sum(
            tf.math.multiply_no_nan(islandby_effects_b0, island), axis=-1
        )
        nest_mother_b0 = tf.gather(b0_nest_mother, nestmothers, axis=-1)
        birth_year_effects_b0 = tf.gather(b0_birth_year, birthyears, axis=-1)
        sex_effect_b0 = tf.gather(b0_sex_weight, sex, axis=-1)
        handreared_effect_b0 = tf.gather(b0_handreared_weight, handreared, axis=-1)
        chick_effect_b0 = tf.gather(b0_chick, chicks, axis=-1)

        # print(b0_island_prior.shape)
        # print(tf.math.reduce_sum(tf.math.multiply_no_nan(b0_island_prior, island), axis=-1).shape)

        # island_effects_b1 = tf.gather(b1_island_prior, island, axis=-1)
        island_effects_b1 = tf.math.reduce_sum(
            tf.math.multiply_no_nan(b1_island_prior, island), axis=-1
        )
        islandby_effects_b1 = tf.gather(b1_islandby_prior, birthyears, axis=-2)
        islandby_effects_b1 = tf.math.reduce_sum(
            tf.math.multiply_no_nan(islandby_effects_b1, island), axis=-1
        )
        birth_year_effects_b1 = tf.gather(b1_birth_year, birthyears, axis=-1)
        nest_mother_b1 = tf.gather(b1_nest_mother, nestmothers, axis=-1)
        sex_effect_b1 = tf.gather(b1_sex_weight, sex, axis=-1)
        handreared_effect_b1 = tf.gather(b1_handreared_weight, handreared, axis=-1)
        chick_effect_b1 = tf.gather(b1_chick, chicks, axis=-1)

        # island_effects_M = tf.gather(M_island_prior, island, axis=-1)
        island_effects_M = tf.math.reduce_sum(
            tf.math.multiply_no_nan(M_island_prior, island), axis=-1
        )
        islandby_effects_M = tf.gather(M_islandby_prior, birthyears, axis=-2)
        islandby_effects_M = tf.math.reduce_sum(
            tf.math.multiply_no_nan(islandby_effects_M, island), axis=-1
        )
        birth_year_effects_M = tf.gather(M_birth_year, birthyears, axis=-1)
        nest_mother_M = tf.gather(M_nest_mother, nestmothers, axis=-1)
        sex_effect_M = tf.gather(M_sex_weight, sex, axis=-1)
        handreared_effect_M = tf.gather(M_handreared_weight, handreared, axis=-1)
        chick_effect_M = tf.gather(M_chick, chicks, axis=-1)

        fixed_effect_M = M_intercept  # + nest_mother_M
        response_M = fixed_effect_M + sex_effect_M * (
            island_effects_M
            + islandby_effects_M
            + birth_year_effects_M
            + handreared_effect_M
            + chick_effect_M
            # + nest_mother_M
        )

        fixed_effect_b0 = b0_intercept  # + nest_mother_b0
        response_b0 = fixed_effect_b0 + sex_effect_b0 * (
            island_effects_b0
            + islandby_effects_b0
            + birth_year_effects_b0
            + handreared_effect_b0
            + chick_effect_b0
            # + nest_mother_b0
        )

        fixed_effect_b1 = b1_intercept  # + nest_mother_b1
        response_b1 = fixed_effect_b1 + sex_effect_b1 * (
            island_effects_b1
            + islandby_effects_b1
            + birth_year_effects_b1
            + handreared_effect_b1
            + chick_effect_b1
            # + nest_mother_b1
        )

        day_scale = tf.gather(day_scale_dist, day_floor, axis=-1)

        M = fixed_effect_M + response_M
        b0 = fixed_effect_b0 + response_b0
        b1 = fixed_effect_b1 + response_b1
        b1 = tf.math.softplus(b1)

        # y = M/(1 + tf.math.exp(-(b0 + (b1 * age))))

        y = M * tf.math.exp(-tf.math.exp(b0 - (b1 * age)))
        # y = M + b0 + b1

        yield tfd.Normal(loc=y, scale=day_scale, name="weight", validate_args=True)

    return tfd.JointDistributionCoroutineAutoBatched(model)


island_data = list()
for b in weights["birdName"]:
    island_data.append(bird_island_pcts.loc[b].to_list())

island_data = np.asarray(island_data)

formula = make_formula(
    weights.age,
    weights.sex_code.values,
    weights.day_floor,
    weights.handreared.values,
    # weights.island_code,
    # birds_island_pct[list(weights['birdName'])],
    island_data,
    weights.islandby_code,
    weights.birth_year_code.values,
    weights.nest_mother_code.values,
    weights.id,
    weights.island.nunique(),
    weights.island_by_year.nunique(),
    weights.day_floor.nunique(),
    weights.birth_year.nunique(),
    weights.nestMother.nunique(),
    weights.birdName.nunique(),
)
# formula.sample()[-1]

# Surrogate Posterior
# Surrogate posterior

_init_loc = lambda shape=(): tf.Variable(
    tf.random.uniform(shape, minval=-2.0, maxval=2.0)
)
_init_scale = lambda shape=(): tfp.util.TransformedVariable(
    initial_value=tf.random.uniform(shape, minval=0.01, maxval=1.0),
    bijector=tfb.Softplus(),
)
n_islands = weights.island.nunique()
n_islandby = weights.islandby.nunique()
n_days = weights.day_floor.nunique()
n_birth_years = weights.birth_year.nunique()
n_birth_mothers = weights["nestMother"].nunique()
n_chicks = weights["id"].nunique()

_init_sex_prior = lambda shape=(): tfp.util.TransformedVariable(
    initial_value=tf.random.uniform(shape, minval=0.8, maxval=1.2),
    bijector=tfb.Sigmoid(low=0.75, high=2.2),
)


def gen_posterior(prefix):
    surrogate_part = {
        # tfb.Softplus()(tfd.Normal(_init_loc(), _init_scale())), # islandby_scale_priors
        prefix + "_sex": tfd.Normal(_init_loc([2]), _init_scale([2])),  # sex_prior
        prefix
        + "_hr": tfd.Normal(_init_loc([2]), _init_scale([2])),  # handreared prior
        prefix
        + "_island": tfd.Normal(
            _init_loc([n_islands]), _init_scale([n_islands])
        ),  # Island_Prior
        prefix
        + "_islandby": tfd.Normal(
            _init_loc([n_birth_years, n_islands]),
            _init_scale([n_birth_years, n_islands]),
        ),  # Islandby_Prior
        prefix
        + "_birthyear": tfd.Normal(
            _init_loc([n_birth_years]), _init_scale([n_birth_years])
        ),  # BirthYears Prior
        prefix
        + "_nestmothers": tfd.Normal(
            _init_loc([n_birth_mothers]), _init_scale([n_birth_mothers])
        ),  # nestMotherPriors
        prefix
        + "_chicks": tfd.Normal(
            _init_loc([n_chicks]), _init_scale([n_chicks])
        ),  # ChicksPriors
        prefix + "_intercept": tfd.Normal(_init_loc(), _init_scale()),  # Intercept
        # tfb.Softplus()(tfd.Normal(_init_loc(), _init_scale())), # Output-scale
    }
    return surrogate_part


surrogate_M = gen_posterior("M")
surrogate_b0 = gen_posterior("b0")
surrogate_b1 = gen_posterior("b1")

surrogate_list = dict()
# surrogate_list = {**surrogate_list, **surrogate_M, **surogate_b0, **surrogate_b1}

dayscale = {
    "_dayscale": tfb.Softplus()(tfd.Normal(_init_loc([n_days]), _init_scale([n_days])))
}

surrogate_list = {**surrogate_M, **surrogate_b0, **surrogate_b1, **dayscale}

surrogate = tfd.JointDistributionNamedAutoBatched(surrogate_list, name="Surrogate")
# np.save("growth_curve_surrogate_variables.npy", surrogate.variables)

# print(surrogate.variables)

# surrogate = tfp.experimental.vi.build_asvi_surrogate_posterior(formula[:, -1])

# surrogate = tfd.JointDistributionSequentialAutoBatched(formula, name="Surrogate")

# surrogate = tfd.JointDistributionSequentialAutoBatched([
#    surrogate_M,
#    surrogate_b0,
#    surrogate_b1,
#    tfb.Softplus()(tfd.Normal(_init_loc([n_days]), _init_scale([n_days]))), # Output-scale
#    # tfd.Normal(_init_loc(), _init_scale()), # output prior
# ])  # county_prior

# surrogate.sample()

labels = weights[["weight"]].astype(np.float32).values.flatten()

checkpoint_directory = "growth_weight_model"
checkpoint_prefix = os.path.join(checkpoint_directory, "ckpt")

optimizer = tf.optimizers.Adam(learning_rate=1e-2)

checkpoint = tf.train.Checkpoint(optimizer=optimizer, surrogate=surrogate)
checkpoint.save("untrained")

# surrogate.save_weights("./growth_curve_surrogate.ckpt")

# np.save("growth_surrogate.npy", surrogate)


def target_log_prob_fn(*args):
    return formula.log_prob(*args, weight=labels)


optimizer = tf.optimizers.Adam(learning_rate=1e-2)

losses = tfp.vi.fit_surrogate_posterior(
    target_log_prob_fn,
    surrogate,
    optimizer=optimizer,
    num_steps=8192 * 2,
    sample_size=2048,
)
print("Loss @ {}".format(losses[-1]))

optimizer = tf.optimizers.Adam(learning_rate=1e-3)

losses1 = tfp.vi.fit_surrogate_posterior(
    target_log_prob_fn,
    surrogate,
    optimizer=optimizer,
    num_steps=8192 * 2,
    sample_size=2048,
)
print("Loss @ {}".format(losses1[-1]))

optimizer = tf.optimizers.Adam(learning_rate=1e-4)

losses2 = tfp.vi.fit_surrogate_posterior(
    target_log_prob_fn,
    surrogate,
    optimizer=optimizer,
    num_steps=8192 * 2,
    sample_size=2048,
)
print("Loss @ {}".format(losses2[-1]))

optimizer = tf.optimizers.Adam(learning_rate=1e-5)

losses3 = tfp.vi.fit_surrogate_posterior(
    target_log_prob_fn,
    surrogate,
    optimizer=optimizer,
    num_steps=8192 * 2,
    sample_size=2048,
)
print("Loss @ {}".format(losses3[-1]))

losses_all = np.concatenate([losses, losses1, losses2, losses3])
np.save("growth_weight_losses_all", losses_all)

checkpoint_directory = "./growth_weight_model"
checkpoint_prefix = os.path.join(checkpoint_directory, "ckpt")

checkpoint = tf.train.Checkpoint(optimizer=optimizer, surrogate=surrogate)
# surrogate.save_weights("./growth_curve_surrogate.ckpt")

# checkpoint.save("trained")

# np.save("growth_curve_surrogate_variables.npy", surrogate.variables)
