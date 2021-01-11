library(shiny)
library(rvest)
library(tidyverse)
library(sortable)
library(DT)
library(stringr)
library(shinydashboard)
library(DT)
library(feather)
library(ggplot2)
library(ggimage)
library(plotly)
library(maps)
library(ggmap)
library(viridis)
library(shinythemes)
library(shinyWidgets)
library(scales)
library(shinysky)
library(rsconnect)


webpage <- read_html("https://en.wikipedia.org/wiki/List_of_NCAA_Division_I_institutions")
table <- html_nodes(webpage, xpath = '//*[@id="mw-content-text"]/div[1]/table[1]')
colleges <- html_table(table[[1]], fill=TRUE)
colleges$`Primary conference` <- gsub("\\s*\\[[^\\)]+\\]","",as.character(colleges$`Primary conference`))
colleges$`Common name` <- gsub("\\s*\\[[^\\)]+\\]","",as.character(colleges$`Common name`))
webpage2 <- read_html("https://en.wikipedia.org/wiki/List_of_NCAA_Division_I_FBS_football_programs")
table2 <- html_nodes(webpage2, xpath = '//*[@id="mw-content-text"]/div[1]/table[1]')
FBS <- html_table(table2[[1]], fill=TRUE)
colleges <- left_join(colleges, FBS, by = c("Common name" = "Team"))%>%
    select(1:8,13)
webpage3 <- read_html('https://en.wikipedia.org/wiki/List_of_NCAA_Division_I_FCS_football_programs')
table3 <- html_nodes(webpage3, xpath = '//*[@id="mw-content-text"]/div[1]/table[1]')
FCS <- html_table(table3[[1]], fill=TRUE)
colleges <- left_join(colleges, FCS, by = c("Common name" = "Team")) %>%
    select(1:9, 15) %>%
    rename(City = City.x) %>%
    rename(State = State.x)%>%
    rename(Enrollment = Enrollment.x) %>%
    mutate(FootballDivision = ifelse(!is.na(CurrentConference), 
                                     "FBS",
                                     ifelse(!is.na(Conference),
                                            "FCS",
                                            "No D1 football")
                                     )) %>%
    mutate(FootballConference = ifelse(!is.na(CurrentConference),
                                       CurrentConference,
                                       ifelse(!is.na(Conference),
                                              Conference,
                                              "No D1 football")))%>%
    rename(School = School.x) %>%
    select(-CurrentConference, -Conference)
colleges$Team <- gsub("\\s*\\[[^\\)]+\\]","",as.character(colleges$Team))
colleges$FootballConference <- gsub("\\s*\\[[^\\)]+\\]","",as.character(colleges$FootballConference))

#####colleges1 <- left_join(colleges, Logos, by = c("Common name" = "school"))
colleges <- colleges %>%
    mutate(`Common name` = str_replace_all(`Common name`, "–", "-"))%>%
    mutate(images = paste0("www/", tolower(`Common name`), ".gif")) %>%
    mutate(images = str_replace_all(images, fixed(" "), "")) %>%
    mutate(dummy = 0)


college_geocodes <- readxl::read_excel("./EDGE_GEOCODE_POSTSEC_1920.xlsx") %>%
    select(NAME, LAT, LON, CITY) %>%
    mutate(NAME = str_replace(NAME, "Main Campus", "")) %>%
    mutate(NAME = str_replace(NAME, "The ", ""))

colleges1 <- left_join(colleges, college_geocodes, by = c("School" = "NAME"))


college_geocodes_edit <- college_geocodes %>%
    mutate(joincol = paste0(NAME, " ", CITY))

colleges_edit <- colleges1 %>%
    mutate(joincol = paste0(School, " ", City))

colleges2 <- fuzzyjoin::stringdist_left_join(colleges_edit[is.na(colleges_edit$LON),], college_geocodes_edit, by = "joincol", method = "lcs", max_dist=11, distance_col = "dist") %>%
    arrange(dist)

colleges2 <- colleges2[!duplicated(colleges2$School),]

colleges2 <- colleges2 %>%
    select(-LAT.x,-LON.x, -CITY.x, -joincol.x, -NAME, -CITY.y, -joincol.y, -dist)

colleges3 <- left_join(colleges1, colleges2, by="School")

colleges3 <- colleges3 %>%
    mutate(LAT = ifelse(is.na(LAT), LAT.y, LAT))%>%
    mutate(LON = ifelse(is.na(LON), LON.y, LON))

colleges3 <- colleges3 %>%
    select(-(15:28))

colleges3$LAT[colleges3$`Common name.x` == "Florida A&M"] <- college_geocodes$LAT[college_geocodes$NAME == "Florida Agricultural and Mechanical University"]
colleges3$LON[colleges3$`Common name.x` == "Florida A&M"] <- college_geocodes$LON[college_geocodes$NAME == "Florida Agricultural and Mechanical University"]
colleges3$LAT[colleges3$`Common name.x` == "Tulane"] <- college_geocodes$LAT[college_geocodes$NAME == "Tulane University of Louisiana"]
colleges3$LON[colleges3$`Common name.x` == "Tulane"] <- college_geocodes$LON[college_geocodes$NAME == "Tulane University of Louisiana"]

college_locs2 <- read_csv("./stadiums-geocoded.csv")

college_locs2 <- college_locs2 %>%
    select(4,10,11)

colleges4 <- left_join(colleges3[is.na(colleges3$LAT),], college_locs2, by = c("Common name.x" = "team"))

colleges5 <- left_join(colleges3, colleges4, by = "Common name.x")%>%
    select(-School.y, -Team.x.y, - City.x.y, -State.x.y, -Type.x.y, -Enrollment.x.y, -`Primary conference.x.y`, -FootballDivision.x.y, -FootballConference.x.y, -images.x.y, -dummy.x.y, -LAT.y, -LON.y)

colleges5 <- colleges5 %>%
    mutate(LAT.x = ifelse(is.na(LAT.x), latitude, LAT.x)) %>%
    mutate(LON.x = ifelse(is.na(LON.x), longitude, LON.x))

colleges5 <- colleges5 %>%
    select(-latitude, -longitude)

colnames(colleges5) <- c("School", "Common name", "Team", "City", "State", "Type", "Enrollment", "Primary conference", "FootballDivision", "FootballConference", "images", "dummy", "lat", "lon")

colleges5$lat[colleges5$`Common name` == "Alabama A&M"] <- college_geocodes$LAT[college_geocodes$NAME == "Alabama A & M University"]
colleges5$lon[colleges5$`Common name` == "Alabama A&M"] <- college_geocodes$LON[college_geocodes$NAME == "Alabama A & M University"]
colleges5$lat[colleges5$`Common name` == "Albany"] <- college_geocodes$LAT[college_geocodes$NAME == "SUNY at Albany"]
colleges5$lon[colleges5$`Common name` == "Albany"] <- college_geocodes$LON[college_geocodes$NAME == "SUNY at Albany"]
colleges5$lat[colleges5$`Common name` == "Cal Poly"] <- college_geocodes$LAT[college_geocodes$NAME == "California Polytechnic State University-San Luis Obispo"]
colleges5$lon[colleges5$`Common name` == "Cal Poly"] <- college_geocodes$LON[college_geocodes$NAME == "California Polytechnic State University-San Luis Obispo"]
colleges5$lat[colleges5$`Common name` == "The Citadel"] <- college_geocodes$LAT[college_geocodes$NAME == "Citadel Military College of South Carolina"]
colleges5$lon[colleges5$`Common name` == "The Citadel"] <- college_geocodes$LON[college_geocodes$NAME == "Citadel Military College of South Carolina"]
colleges5$lat[colleges5$`Common name` == "Columbia"] <- college_geocodes$LAT[college_geocodes$NAME == "Columbia University in the City of New York"]
colleges5$lon[colleges5$`Common name` == "Columbia"] <- college_geocodes$LON[college_geocodes$NAME == "Columbia University in the City of New York"]
colleges5$lat[colleges5$`Common name` == "Fairleigh Dickinson"] <- college_geocodes$LAT[college_geocodes$NAME == "Fairleigh Dickinson University-Metropolitan Campus"]
colleges5$lon[colleges5$`Common name` == "Fairleigh Dickinson"] <- college_geocodes$LON[college_geocodes$NAME == "Fairleigh Dickinson University-Metropolitan Campus"]
colleges5$lat[colleges5$`Common name` == "UMBC"] <- college_geocodes$LAT[college_geocodes$NAME == "University of Maryland-Baltimore County"]
colleges5$lon[colleges5$`Common name` == "UMBC"] <- college_geocodes$LON[college_geocodes$NAME == "University of Maryland-Baltimore County"]
colleges5$lat[colleges5$`Common name` == "Missouri State"] <- college_geocodes$LAT[college_geocodes$NAME == "Missouri State University-Springfield"]
colleges5$lon[colleges5$`Common name` == "Missouri State"] <- college_geocodes$LON[college_geocodes$NAME == "Missouri State University-Springfield"]
colleges5$lat[colleges5$`Common name` == "North Carolina A&T"] <- college_geocodes$LAT[college_geocodes$NAME == "North Carolina A & T State University"]
colleges5$lon[colleges5$`Common name` == "North Carolina A&T"] <- college_geocodes$LON[college_geocodes$NAME == "North Carolina A & T State University"]
colleges5$lat[colleges5$`Common name` == "Northwestern State"] <- college_geocodes$LAT[college_geocodes$NAME == "Northwestern State University of Louisiana"]
colleges5$lon[colleges5$`Common name` == "Northwestern State"] <- college_geocodes$LON[college_geocodes$NAME == "Northwestern State University of Louisiana"]
colleges5$lat[colleges5$`Common name` == "St. John's"] <- college_geocodes$LAT[college_geocodes$NAME == "St John's University-New York"]
colleges5$lon[colleges5$`Common name` == "St. John's"] <- college_geocodes$LON[college_geocodes$NAME == "St John's University-New York"]


colleges <- colleges5 %>%
    mutate(State = as.factor(State))%>%
    mutate(Type = as.factor(Type))%>%
    mutate(Enrollment = (as.numeric(gsub(",","",as.character(Enrollment)))))%>%
    mutate(`Primary conference` = as.factor(`Primary conference`))%>%
    mutate(FootballDivision = as.factor(FootballDivision))%>%
    mutate(FootballConference = as.factor(FootballConference))


uniq_confs <- unique(gsub("\\s*\\[[^\\)]+\\]","",as.character(colleges$`Primary conference`)))
confs <- colleges %>%
    group_by(`Primary conference`) %>%
    select(`Primary conference`,`Common name`)%>%
    rename(conference = `Primary conference`)%>%
    rename(name = `Common name`) %>%
    group_by(conference) %>%
    mutate(row = row_number()) %>%
    tidyr::pivot_wider(names_from = conference, values_from = name) %>%
    select(-row)%>%
    select(14, 32, 3, 11, 9, 19, 24, 13, 16, 29, 8, 5, 2, 10, 20, 30,
           15, 17, 28, 1, 4, 6, 7, 12, 18, 21, 22, 23, 25, 26, 27, 31)
