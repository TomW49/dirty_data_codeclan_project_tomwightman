# loading packages
library(tidyverse)
library(here)

# reading in dirty data, cleaning and assigning
bbcandy2015 <- janitor::clean_names(
  readxl::read_xlsx(here("raw_data/boing-boing-candy-2015.xlsx")))
bbcandy2016 <- janitor::clean_names(
  readxl::read_xlsx(here("raw_data/boing-boing-candy-2016.xlsx")))
bbcandy2017 <- janitor::clean_names(
  readxl::read_xlsx(here("raw_data/boing-boing-candy-2017.xlsx")))

# 2015 cleaning
# renaming variables 
# removing timestamp column
# adding in year column to identify when joining
pivot_prep_candy15 <- bbcandy2015 %>%
  select(-timestamp) %>% 
  rename(going_out = are_you_going_actually_going_trick_or_treating_yourself,
         age       = how_old_are_you) %>%   
  add_column(year = 2015, .before = 1) 

# 2015 cleaning
# pivotting data to enable join with others, and removing non-candy values
pivot_candy15 <- pivot_prep_candy15 %>% 
  pivot_longer(cols = 4:124, names_to = "candy", values_to = "reaction") %>% 
  filter(!candy %in% c(
    "cash_or_other_forms_of_legal_tender",
    "dental_paraphenalia",
    "generic_brand_acetaminophen",
    "glow_sticks",
    "broken_glow_stick",
    "creepy_religious_comics_chick_tracts",
    "hugs_actual_physical_hugs",
    "joy_joy_mit_iodine",
    "lapel_pins",
    "mint_leaves",
    "peterson_brand_sidewalk_chalk",
    "vicodin",
    "please_leave_any_remarks_or_comments_regarding_your_choices",
    "please_list_any_items_not_included_above_that_give_you_joy",
    "please_list_any_items_not_included_above_that_give_you_despair",
    "please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_jk_rowling",
    "please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_jj_abrams",
    "please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_beyonce",
    "please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_bieber",
    "please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_kevin_bacon",
    "please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_francis_bacon_1561_1626",
    "please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_bruce_lee",
    "please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_jk_rowling",
    "please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_malala_yousafzai",
    "please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_thom_yorke",
    "please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_jj_abrams",
    "please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_hillary_clinton",
    "please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_donald_trump",
    "please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_beyonce_knowles",
    "pencils",
    "guess_the_number_of_mints_in_my_hand",
    "betty_or_veronica",
    "check_all_that_apply_i_cried_tears_of_sadness_at_the_end_of",
    "that_dress_that_went_viral_early_this_year_when_i_first_saw_it_it_was",
    "fill_in_the_blank_imitation_is_a_form_of",
    "fill_in_the_blank_taylor_swift_is_a_force_for",
    "what_is_your_favourite_font",
    "if_you_squint_really_hard_the_words_intelligent_design_would_look_like",
    "which_day_do_you_prefer_friday_or_sunday")
   )

# 2016 cleaning
# renaming variables 
# removing timestamp column
# adding in year column to identify when joining
pivot_prep_candy16 <- bbcandy2016 %>%
  select(-timestamp) %>% 
  rename(going_out  = are_you_going_actually_going_trick_or_treating_yourself,
         age        = how_old_are_you,
         gender     = your_gender,
         country    = which_country_do_you_live_in,
         province   = which_state_province_county_do_you_live_in) %>%   
  add_column(year = 2016, .before = 1) 

# 2016 cleaning
# pivotting data to enable join with others, and removing non-candy values
pivot_candy16 <- pivot_prep_candy16 %>% 
  pivot_longer(cols = 7:123, names_to = "candy", values_to = "reaction") %>% 
  filter(!candy %in% c(
    "cash_or_other_forms_of_legal_tender",
    "dental_paraphenalia",
    "generic_brand_acetaminophen",
    "glow_sticks",
    "broken_glow_stick",
    "creepy_religious_comics_chick_tracts",
    "hugs_actual_physical_hugs",
    "joy_joy_mit_iodine",
    "lapel_pins",
    "mint_leaves",
    "peterson_brand_sidewalk_chalk",
    "vicodin",
    "please_leave_any_remarks_or_comments_regarding_your_choices",
    "please_list_any_items_not_included_above_that_give_you_joy",
    "please_list_any_items_not_included_above_that_give_you_despair",
    "please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_jk_rowling",
    "please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_jj_abrams",
    "please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_beyonce",
    "please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_bieber",
    "please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_kevin_bacon",
    "please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_francis_bacon_1561_1626",
    "please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_bruce_lee",
    "please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_jk_rowling",
    "please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_malala_yousafzai",
    "please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_thom_yorke",
    "please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_jj_abrams",
    "please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_hillary_clinton",
    "please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_donald_trump",
    "please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_beyonce_knowles",
    "pencils",
    "guess_the_number_of_mints_in_my_hand",
    "betty_or_veronica",
    "check_all_that_apply_i_cried_tears_of_sadness_at_the_end_of",
    "that_dress_that_went_viral_early_this_year_when_i_first_saw_it_it_was",
    "that_dress_that_went_viral_a_few_years_back_when_i_first_saw_it_it_was",
    "fill_in_the_blank_imitation_is_a_form_of",
    "fill_in_the_blank_taylor_swift_is_a_force_for",
    "what_is_your_favourite_font",
    "if_you_squint_really_hard_the_words_intelligent_design_would_look_like",
    "which_day_do_you_prefer_friday_or_sunday",
    "chardonnay", 
    "person_of_interest_season_3_dvd_box_set_not_including_disc_4_with_hilarious_outtakes",
    "please_leave_any_witty_snarky_or_thoughtful_remarks_or_comments_regarding_your_choices",
    "what_is_your_favourite_font",
    "do_you_eat_apples_the_correct_way_east_to_west_side_to_side_or_do_you_eat_them_like_a_freak_of_nature_south_to_north_bottom_to_top",
    "when_you_see_the_above_image_of_the_4_different_websites_which_one_would_you_most_likely_check_out_please_be_honest",
    "york_peppermint_patties_ignore")
  )

# cleaning 2017
# This strips out the "q" from the beginning of the column names
names(bbcandy2017) = gsub(pattern = "^q[0-9]*_", replacement = "", 
                          x = names(bbcandy2017))

# 2016 cleaning
# renaming variables - mary_janes in order to match other datasets
# removing internal_id column
# adding in year column to identify when joining
pivot_prep_candy17 <- bbcandy2017 %>%
  select(-c(internal_id, 110:120)) %>% 
  rename(province    = state_province_county_etc,
         mary_janes  = anonymous_brown_globs_that_come_in_black_and_orange_wrappers_a_k_a_mary_janes) %>%   
  add_column(year = 2017, .before = 1) 

# cleaning 2017
# pivotting data to enable join with others, and removing non-candy values
pivot_candy17 <- pivot_prep_candy17 %>% 
  pivot_longer(cols = 7:109, names_to = "candy", values_to = "reaction") %>% 
  filter(!candy %in% c(
    "cash_or_other_forms_of_legal_tender",
    "dental_paraphenalia",
    "generic_brand_acetaminophen",
    "glow_sticks",
    "broken_glow_stick",
    "creepy_religious_comics_chick_tracts",
    "hugs_actual_physical_hugs",
    "joy_joy_mit_iodine",
    "lapel_pins",
    "mint_leaves",
    "peterson_brand_sidewalk_chalk",
    "vicodin",
    "please_leave_any_remarks_or_comments_regarding_your_choices",
    "please_list_any_items_not_included_above_that_give_you_joy",
    "please_list_any_items_not_included_above_that_give_you_despair",
    "please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_jk_rowling",
    "please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_jj_abrams",
    "please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_beyonce",
    "please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_bieber",
    "please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_kevin_bacon",
    "please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_francis_bacon_1561_1626",
    "please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_bruce_lee",
    "please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_jk_rowling",
    "please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_malala_yousafzai",
    "please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_thom_yorke",
    "please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_jj_abrams",
    "please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_hillary_clinton",
    "please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_donald_trump",
    "please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_beyonce_knowles",
    "pencils",
    "guess_the_number_of_mints_in_my_hand",
    "betty_or_veronica",
    "check_all_that_apply_i_cried_tears_of_sadness_at_the_end_of",
    "that_dress_that_went_viral_early_this_year_when_i_first_saw_it_it_was",
    "that_dress_that_went_viral_a_few_years_back_when_i_first_saw_it_it_was",
    "fill_in_the_blank_imitation_is_a_form_of",
    "fill_in_the_blank_taylor_swift_is_a_force_for",
    "what_is_your_favourite_font",
    "if_you_squint_really_hard_the_words_intelligent_design_would_look_like",
    "which_day_do_you_prefer_friday_or_sunday",
    "chardonnay", 
    "person_of_interest_season_3_dvd_box_set_not_including_disc_4_with_hilarious_outtakes",
    "please_leave_any_witty_snarky_or_thoughtful_remarks_or_comments_regarding_your_choices",
    "what_is_your_favourite_font",
    "do_you_eat_apples_the_correct_way_east_to_west_side_to_side_or_do_you_eat_them_like_a_freak_of_nature_south_to_north_bottom_to_top",
    "when_you_see_the_above_image_of_the_4_different_websites_which_one_would_you_most_likely_check_out_please_be_honest",
    "york_peppermint_patties_ignore",
    "real_housewives_of_orange_county_season_9_blue_ray")
  )

# joining all three cleaned datasets
candy_combined <- bind_rows(pivot_candy15, 
                            pivot_candy16, 
                            pivot_candy17) %>% 
  select(1,3,6,2,7,8, everything())

# cleaning further spelling errors for standardisation 
candy_combined <- candy_combined%>% 
  mutate(candy = case_when(
    candy == "boxo_raisins" ~ "box_o_raisins",
    candy == "sweetums_a_friend_to_diabetes" ~ "sweetums",
    candy == "anonymous_brown_globs_that_come_in_black_and_orange_wrappers" ~ "mary_janes",
    TRUE ~ candy)) 

# creating pattern for usa and uk country to identify and standardise  
usa_pattern <- c("usausausa|usas|usaa|usa? hard to tell anymore..|usa!!!!!!
                 |usa! usa!|usa!|usa usa usa!!!!|usa usa usa usa|usa usa usa
                 |usa (i think but it's an election year so who can really tell)
                 |usa|usa|units states|united ststes|united      ststes|usa|us
                 |usa|united states of america|us|united states|united states|us
                 |u.s.|u.s.a.|united states of america|america|america|u.s.
                 |murica|unites states|us of a|united state|usa! usa! usa!
                 |merica|the united states|united sates|united stated|ussa
                 |'merica|ahem....amerca|n. america|the best one - usa
                 |the united states of america|the yoo ess of aaayyyyyy|u s
                 |u s a|u.s.|u.s.a.|unied states|unhinged states|unied states
                 |unite states|united  states of america|united staes
                 |united statea|united states|united states|united statss
                 |united stetes|	united ststes|united ststes|units states|usa
                 |usa
                 |usa (i think but it's an election year so who can really tell)
                 |usa usa usa|usa usa usa usa|usa usa usa!!!!|usa!|usa! usa!
                 |usa!!!!!!|usa? hard to tell anymore..|usaa|usas|usausausa
                 |murrika|north carolina|california|new jersey|new york
                 |pittsburgh")
uk_pattern <- c("endland|england|scotland|u\\.k\\.|uk|united kindom|united kingdom")

# lowering case of country, recoding uk, usa, canada and other data country data only
candy_combined <-  candy_combined %>% 
  mutate(country = str_to_lower(country)) %>% 
  mutate(country = case_when(
    str_detect(country, "not[\\s]{1,}") ~ "other",
    str_detect(country, "australia") ~ "other",
    str_detect(country, "austria") ~ "other",
    str_detect(country, "subscribe to dm4uz3 on youtube") ~ "other",
    str_detect(country, str_c(usa_pattern, collapse = "|")) ~ "usa",
    str_detect(country, str_c(uk_pattern, collapse = "|")) ~ "uk",
    str_detect(country, "^can") ~ "canada",
    is.na(country) == TRUE ~ "other",
    TRUE ~ "other")
  ) 

# cleaning age column, turning into integer for manipulation 
# using data only from 4 to 100 year olds
candy_combined <- candy_combined %>%
  mutate(age = as.integer(age)) %>% 
  mutate(age = ifelse(age <= 100, age, NA_integer_)) %>% 
  mutate(age = ifelse(age >= 4, age, NA_integer_)) %>% 
  drop_na(age) 

write_csv(candy_combined, ("clean_data/halloween_candy_2015_to_2017.csv"))

