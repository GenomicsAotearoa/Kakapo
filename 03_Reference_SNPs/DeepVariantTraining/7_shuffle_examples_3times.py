import glob
import tensorflow as tf
import random

# https://gist.github.com/andres-erbsen/1307752
def itershuffle(iterable,bufsize=1000):
    """Shuffle an iterator. This works by holding `bufsize` items back
    and yielding them sometime later. This is NOT 100% random, proved or anything."""
    iterable = iter(iterable)
    buf = []
    try:
        while True:
            for i in xrange(random.randint(1, bufsize-len(buf))):
                buf.append(iterable.next())
            random.shuffle(buf)
            for i in xrange(random.randint(1, bufsize)):
                if buf:
                    yield buf.pop()
                else:
                    break
    except StopIteration:
        random.shuffle(buf)
        while buf:
            yield buf.pop()
        raise StopIteration


tf.compat.v1.enable_eager_execution(
    config=None,
    device_policy=None,
    execution_mode=None
)

shuffle_tmp_files = 10000
out_fhs = list()

examples = 0

for i in range(shuffle_tmp_files):
	filename = "./shuffle_tmp/" + str(i) + ".examples";
	fh = tf.io.TFRecordWriter(filename)
	out_fhs.append(fh)

inputs = glob.glob("./training_examples_selected/*examples");
random.shuffle(inputs);

raw_dataset = tf.data.TFRecordDataset(inputs)
for raw_record in itershuffle(raw_dataset, 10000):
  example = tf.train.Example()
  example.ParseFromString(raw_record.numpy())
  writer = random.choice(out_fhs)
  writer.write(example.SerializeToString())
  examples = examples + 1
  # print(raw_record)

print("Total examples: " + str(examples));
  
shuffle_tmp_files = 8192
out_fhs = list()

for i in range(shuffle_tmp_files):
        filename = "./shuffle_tmp2/" + str(i) + ".examples";
        fh = tf.io.TFRecordWriter(filename)
        out_fhs.append(fh)

inputs = glob.glob("./shuffle_tmp/*examples");
random.shuffle(inputs);

raw_dataset = tf.data.TFRecordDataset(inputs)
for raw_record in itershuffle(raw_dataset, 10000):
  example = tf.train.Example()
  example.ParseFromString(raw_record.numpy())
  writer = random.choice(out_fhs)
  writer.write(example.SerializeToString())
  # print(raw_record)

shuffle_tmp_files = 8192
out_fhs = list()

for i in range(shuffle_tmp_files):
        filename = "./shuffle_tmp3/" + str(i) + ".examples";
        fh = tf.io.TFRecordWriter(filename)
        out_fhs.append(fh)

inputs = glob.glob("./shuffle_tmp2/*examples");
random.shuffle(inputs);

raw_dataset = tf.data.TFRecordDataset(inputs)
for raw_record in itershuffle(raw_dataset, 20000):
  example = tf.train.Example()
  example.ParseFromString(raw_record.numpy())
  writer = random.choice(out_fhs)
  writer.write(example.SerializeToString())
  # print(raw_record)

inputs = glob.glob("./shuffle_tmp3/*examples");
random.shuffle(inputs);

out_fhs = list()
shuffle_tmp_files = 8196
out_fhs = list()

for i in range(shuffle_tmp_files):
        filename = "./training_examples_shuffled/" + str(i) + ".examples";
        fh = tf.io.TFRecordWriter(filename)
        out_fhs.append(fh)

raw_dataset = tf.data.TFRecordDataset(inputs)
for raw_record in itershuffle(raw_dataset, 25000):
  example = tf.train.Example()
  example.ParseFromString(raw_record.numpy())
  writer = random.choice(out_fhs)
  writer.write(example.SerializeToString())
  # print(raw_record)

