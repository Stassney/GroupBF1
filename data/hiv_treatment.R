access_HAART <- read.csv("/Users/aniruddh/Desktop/GroupBF1/GroupBF1/data/by_area_hiv_treatment_est_from_1990-present.csv")

filter(HIV.treatment.data.and.estimates == "2018") %>%
  mutate(people_recieving_HAART) %>%
  summarise(sum(Number_of_children_(0-14),receiving_ART + Number_of_peple_all_ages_receiving_ART))
