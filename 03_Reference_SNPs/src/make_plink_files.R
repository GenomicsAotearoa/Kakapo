#!/usr/bin/env Rscript

library(tidyverse)


###########
# GLOBALS #
###########
# Inputs
files <- commandArgs(trailingOnly = TRUE)

bird_details_wiki <-  files[1]
seq_birds_file <- files[2]
contig_list <- files[3]
contigs_map <- files[4]
names_file <- files[5]
ids_file <- files[6]
parents_file <- files[7]
update_sex_file <- files[8]




# 
# print(bird_details_wiki)
# print(seq_birds_file)
# print(contig_list)

# write_tsv(bird_details_wiki,contigs_map)
# print(vcf_file)
# vcf_file <- "~/projects/kakapo-genomics/output/02_assess_vcfs/tidy_vcfs/simple_36_dedup.vcf"

# bird_details_wiki <- "~/projects/kakapo-genomics/old_files/formatted_bird_list_manual.csv"
# seq_birds_file <- "~/projects/kakapo-genomics/output/02_assess_vcfs/tidy_vcfs/seq_indiv.txt"
# contig_list <-  "~/Downloads/contigs.txt"
# 
# # Outputs
# contigs_map <-  "~/projects/kakapo-genomics/output/02_assess_vcfs/mendelian_errors/chrom_map.txt"
# names_file <- "~/projects/kakapo-genomics/output/02_assess_vcfs/mendelian_errors/all_trio_names.txt"
# ids_file <-  "~/projects/kakapo-genomics/output/02_assess_vcfs/mendelian_errors/all_trio_id.txt"
# parents_file <-  "~/projects/kakapo-genomics/output/02_assess_vcfs/mendelian_errors/all_trio_id_parents.txt"
# update_sex_file <- "~/projects/kakapo-genomics/output/02_assess_vcfs/mendelian_errors/all_trio_id_sex.txt"
# 
# Import details about all birds I have info for (some are not sequenced)
all_wiki <- read_csv(bird_details_wiki) %>%
  mutate(ID = str_replace_all(ID, " ", "_")) %>%
  mutate(mother =  str_replace_all(mother, " ", "_")) %>%
  mutate(father = str_replace_all(father, " ", "_"))

# Import the vcf file and extract just the individual names
seq_birds <-read_delim(seq_birds_file, delim = '\t', col_names = FALSE) %>% 
  gather() %>% 
  select(value)




# Add info to the sequenced bird names
all_trio <- inner_join(all_wiki, seq_birds, by = c("ID" = "value"))


# Check to see if there are any individuals in the vcf that are not in the wiki list (probably because of different spellings etc)
missed_indivs <- anti_join(seq_birds, all_wiki, by = c("value" = "ID"))
print("Number of missed individuals:")
print(nrow(missed_indivs))



# Check to see if any of the individuals are parents of other individuals in the list
print("Is this individual a parent of another in the list?")
for(i in 1:36){
  are_parents <- all_trio$ID[i] %in% all_trio$mother | all_trio$ID[i] %in% all_trio$father
  print(are_parents)
}


# Extract all individuals that are part of at least one trio
trio_f1 <- vector()
trio_mother <- vector()
trio_father <- vector()

for(i in 1:36){
  parents_present <- all_trio$mother[i] %in% all_trio$ID & all_trio$father[i] %in% all_trio$ID
  if (parents_present == TRUE) {
    trio_f1 <- append(trio_f1, all_trio$ID[i])
    trio_mother <- append(trio_mother, all_trio$mother[i])
    trio_father <-  append(trio_father, all_trio$father[i])
  }

}

all_trios <- append(trio_f1, trio_mother) %>%
  append(trio_father) %>%
  unique()


# Make a file with individuals relevant to the mendelian errors testing
names <-  as_tibble(all_trios)
write_tsv(x = names, path = names_file, col_names = FALSE)

# Make a file to update the IDs of individuals to what plink needs for --update-ids (old FID, old IID, new FID, new IID)
updated_ids <-  names %>%
  mutate(oIID = value, nFID = "kakapo_trios", nIID = value)

write_tsv(x = updated_ids, path = ids_file, col_names = FALSE)


# Make a file with what plink needs for --update-parents (FID, IID, PAT, MAT)
parents <-  inner_join(names, all_wiki, by = c("value" = "ID")) %>%
  mutate(FID = "kakapo_trios") %>%
  select(FID, value, father, mother)

write_tsv(x = parents, path = parents_file, col_names = FALSE)

# Make a file with what plink needs for --update-sex (FID, IID, SEX: coded 1/2/0 for M/F/missing)
update_sex <- inner_join(names, all_wiki, by = c("value" = "ID")) %>%
  mutate(FID = "kakapo_trios", sex_code = case_when(sex == "M" ~ 1,
                                                    sex == "F" ~ 2 )) %>%
  select(FID, value, sex_code)

write_tsv(x = update_sex, path = update_sex_file, col_names = FALSE)


# Make the "chromosome map" for vcf to ped recoding
contigs <-  read_tsv(contig_list, col_names = FALSE)

chrom_map <- contigs %>%
  mutate(contig_names = str_extract(X1, "(?<==<ID=).+(?=,length*)")) %>%
  mutate(ped_name = 1:nrow(contigs)) %>%
  select(contig_names, ped_name)

write_tsv(x = chrom_map, path = contigs_map, col_names = FALSE)
