hiv_treatment <- EditedHIVTreatment %>%
  filter(ID == "USA") %>%
  group_by(Percent of People all ages living with HIV receiving ART) %>%
