library(plyr)

# Census block data via Boston Redevelopment Authority, Office of Digital Cartography and GIS 
city <- read.csv("Census2010_Blocks_districts.csv")

# Census data via http://censusreporter.org/data/table/?table=B19101&geo_ids=16000US2507000,150|16000US2507000&primary_geo_id=16000US2507000
census <- read.csv("acs_2012-blocks.csv")

# Matching Census income bracket data with Boston City Council District identification
city_census <- join(census, city, by="block", type="left", match="first")

# pulling out Boston-wide statistics
boston_only <- subset(census, name=="Boston, MA")


# subsetting data to focus on each district
district_1 <- subset(city_census, CityCouncil2012=="District 1")
district_2 <- subset(city_census, CityCouncil2012=="District 2")
district_3 <- subset(city_census, CityCouncil2012=="District 3")
district_4 <- subset(city_census, CityCouncil2012=="District 4")
district_5 <- subset(city_census, CityCouncil2012=="District 5")
district_6 <- subset(city_census, CityCouncil2012=="District 6")
district_7 <- subset(city_census, CityCouncil2012=="District 7")
district_8 <- subset(city_census, CityCouncil2012=="District 8")
district_9 <- subset(city_census, CityCouncil2012=="District 9")
district_ <- subset(city_census, CityCouncil2012=="")

# renaming the total column. just for better syntax

boston_only$total <- boston_only$B19101001...Total.
boston_only$B19101001...Total. <- NULL
district_1$total <- district_1$B19101001...Total.
district_1$B19101001...Total. <- NULL
district_2$total <- district_2$B19101001...Total.
district_2$B19101001...Total. <- NULL
district_3$total <- district_3$B19101001...Total.
district_3$B19101001...Total. <- NULL
district_4$total <- district_4$B19101001...Total.
district_4$B19101001...Total. <- NULL
district_5$total <- district_5$B19101001...Total.
district_5$B19101001...Total. <- NULL
district_6$total <- district_6$B19101001...Total.
district_6$B19101001...Total. <- NULL
district_7$total <- district_7$B19101001...Total.
district_7$B19101001...Total. <- NULL
district_8$total <- district_8$B19101001...Total.
district_8$B19101001...Total. <- NULL
district_9$total <- district_9$B19101001...Total.
district_9$B19101001...Total. <- NULL

# Determining the number of people who make less than $100k by adding up the two columns of people who make more than $100k and subtracting that from the Total column
# Adding up the number of people who make more than $100k per block group
# Also adding up the more and less margin of errors just in case

boston_only$less <- boston_only$total - boston_only$B19101017....200.000.or.more - boston_only$B19101016....150.000.to..199.999 - boston_only$B19101015....125.000.to..149.999 - boston_only$B19101014....100.000.to..124.999
boston_only$more <- boston_only$B19101017....200.000.or.more + boston_only$B19101016....150.000.to..199.999 + boston_only$B19101015....125.000.to..149.999 + boston_only$B19101014....100.000.to..124.999
boston_only$more_error <- boston_only$B19101017....200.000.or.more..Error + boston_only$B19101016....150.000.to..199.999..Error + boston_only$B19101015....125.000.to..149.999..Error + boston_only$B19101014....100.000.to..124.999..Error
boston_only$less_error <- boston_only$B19101001...Total...Error - boston_only$B19101017....200.000.or.more..Error - boston_only$B19101016....150.000.to..199.999..Error - boston_only$B19101015....125.000.to..149.999..Error - boston_only$B19101014....100.000.to..124.999..Error

district_1$less <- district_1$total - district_1$B19101017....200.000.or.more - district_1$B19101016....150.000.to..199.999 - district_1$B19101015....125.000.to..149.999 - district_1$B19101014....100.000.to..124.999
district_1$more <- district_1$B19101017....200.000.or.more + district_1$B19101016....150.000.to..199.999 + district_1$B19101015....125.000.to..149.999 + district_1$B19101014....100.000.to..124.999
district_1$more_error <- district_1$B19101017....200.000.or.more..Error + district_1$B19101016....150.000.to..199.999..Error + district_1$B19101015....125.000.to..149.999..Error + district_1$B19101014....100.000.to..124.999..Error
district_1$less_error <- district_1$B19101001...Total...Error - district_1$B19101017....200.000.or.more..Error - district_1$B19101016....150.000.to..199.999..Error - district_1$B19101015....125.000.to..149.999..Error - district_1$B19101014....100.000.to..124.999..Error

district_2$less <- district_2$total - district_2$B19101017....200.000.or.more - district_2$B19101016....150.000.to..199.999 - district_2$B19101015....125.000.to..149.999 - district_2$B19101014....100.000.to..124.999
district_2$more <- district_2$B19101017....200.000.or.more + district_2$B19101016....150.000.to..199.999 + district_2$B19101015....125.000.to..149.999 + district_2$B19101014....100.000.to..124.999
district_2$more_error <- district_2$B19101017....200.000.or.more..Error + district_2$B19101016....150.000.to..199.999..Error + district_2$B19101015....125.000.to..149.999..Error + district_2$B19101014....100.000.to..124.999..Error
district_2$less_error <- district_2$B19101001...Total...Error - district_2$B19101017....200.000.or.more..Error - district_2$B19101016....150.000.to..199.999..Error - district_2$B19101015....125.000.to..149.999..Error - district_2$B19101014....100.000.to..124.999..Error

district_3$less <- district_3$total - district_3$B19101017....200.000.or.more - district_3$B19101016....150.000.to..199.999 - district_3$B19101015....125.000.to..149.999 - district_3$B19101014....100.000.to..124.999
district_3$more <- district_3$B19101017....200.000.or.more + district_3$B19101016....150.000.to..199.999 + district_3$B19101015....125.000.to..149.999 + district_3$B19101014....100.000.to..124.999
district_3$more_error <- district_3$B19101017....200.000.or.more..Error + district_3$B19101016....150.000.to..199.999..Error + district_3$B19101015....125.000.to..149.999..Error + district_3$B19101014....100.000.to..124.999..Error
district_3$less_error <- district_3$B19101001...Total...Error - district_3$B19101017....200.000.or.more..Error - district_3$B19101016....150.000.to..199.999..Error - district_3$B19101015....125.000.to..149.999..Error - district_3$B19101014....100.000.to..124.999..Error

district_4$less <- district_4$total - district_4$B19101017....200.000.or.more - district_4$B19101016....150.000.to..199.999 - district_4$B19101015....125.000.to..149.999 - district_4$B19101014....100.000.to..124.999
district_4$more <- district_4$B19101017....200.000.or.more + district_4$B19101016....150.000.to..199.999 + district_4$B19101015....125.000.to..149.999 + district_4$B19101014....100.000.to..124.999
district_4$more_error <- district_4$B19101017....200.000.or.more..Error + district_4$B19101016....150.000.to..199.999..Error + district_4$B19101015....125.000.to..149.999..Error + district_4$B19101014....100.000.to..124.999..Error
district_4$less_error <- district_4$B19101001...Total...Error - district_4$B19101017....200.000.or.more..Error - district_4$B19101016....150.000.to..199.999..Error - district_4$B19101015....125.000.to..149.999..Error - district_4$B19101014....100.000.to..124.999..Error

district_5$less <- district_5$total - district_5$B19101017....200.000.or.more - district_5$B19101016....150.000.to..199.999 - district_5$B19101015....125.000.to..149.999 - district_5$B19101014....100.000.to..124.999
district_5$more <- district_5$B19101017....200.000.or.more + district_5$B19101016....150.000.to..199.999 + district_5$B19101015....125.000.to..149.999 + district_5$B19101014....100.000.to..124.999
district_5$more_error <- district_5$B19101017....200.000.or.more..Error + district_5$B19101016....150.000.to..199.999..Error + district_5$B19101015....125.000.to..149.999..Error + district_5$B19101014....100.000.to..124.999..Error
district_5$less_error <- district_5$B19101001...Total...Error - district_5$B19101017....200.000.or.more..Error - district_5$B19101016....150.000.to..199.999..Error - district_5$B19101015....125.000.to..149.999..Error - district_5$B19101014....100.000.to..124.999..Error

district_6$less <- district_6$total - district_6$B19101017....200.000.or.more - district_6$B19101016....150.000.to..199.999 - district_6$B19101015....125.000.to..149.999 - district_6$B19101014....100.000.to..124.999
district_6$more <- district_6$B19101017....200.000.or.more + district_6$B19101016....150.000.to..199.999 + district_6$B19101015....125.000.to..149.999 + district_6$B19101014....100.000.to..124.999
district_6$more_error <- district_6$B19101017....200.000.or.more..Error + district_6$B19101016....150.000.to..199.999..Error + district_6$B19101015....125.000.to..149.999..Error + district_6$B19101014....100.000.to..124.999..Error
district_6$less_error <- district_6$B19101001...Total...Error - district_6$B19101017....200.000.or.more..Error - district_6$B19101016....150.000.to..199.999..Error - district_6$B19101015....125.000.to..149.999..Error - district_6$B19101014....100.000.to..124.999..Error

district_7$less <- district_7$total - district_7$B19101017....200.000.or.more - district_7$B19101016....150.000.to..199.999 - district_7$B19101015....125.000.to..149.999 - district_7$B19101014....100.000.to..124.999
district_7$more <- district_7$B19101017....200.000.or.more + district_7$B19101016....150.000.to..199.999 + district_7$B19101015....125.000.to..149.999 + district_7$B19101014....100.000.to..124.999
district_7$more_error <- district_7$B19101017....200.000.or.more..Error + district_7$B19101016....150.000.to..199.999..Error + district_7$B19101015....125.000.to..149.999..Error + district_7$B19101014....100.000.to..124.999..Error
district_7$less_error <- district_7$B19101001...Total...Error - district_7$B19101017....200.000.or.more..Error - district_7$B19101016....150.000.to..199.999..Error - district_7$B19101015....125.000.to..149.999..Error - district_7$B19101014....100.000.to..124.999..Error

district_8$less <- district_8$total - district_8$B19101017....200.000.or.more - district_8$B19101016....150.000.to..199.999 - district_8$B19101015....125.000.to..149.999 - district_8$B19101014....100.000.to..124.999
district_8$more <- district_8$B19101017....200.000.or.more + district_8$B19101016....150.000.to..199.999 + district_8$B19101015....125.000.to..149.999 + district_8$B19101014....100.000.to..124.999
district_8$more_error <- district_8$B19101017....200.000.or.more..Error + district_8$B19101016....150.000.to..199.999..Error + district_8$B19101015....125.000.to..149.999..Error + district_8$B19101014....100.000.to..124.999..Error
district_8$less_error <- district_8$B19101001...Total...Error - district_8$B19101017....200.000.or.more..Error - district_8$B19101016....150.000.to..199.999..Error - district_8$B19101015....125.000.to..149.999..Error - district_8$B19101014....100.000.to..124.999..Error

district_9$less <- district_9$total - district_9$B19101017....200.000.or.more - district_9$B19101016....150.000.to..199.999 - district_9$B19101015....125.000.to..149.999 - district_9$B19101014....100.000.to..124.999
district_9$more <- district_9$B19101017....200.000.or.more + district_9$B19101016....150.000.to..199.999 + district_9$B19101015....125.000.to..149.999 + district_9$B19101014....100.000.to..124.999
district_9$more_error <- district_9$B19101017....200.000.or.more..Error + district_9$B19101016....150.000.to..199.999..Error + district_9$B19101015....125.000.to..149.999..Error + district_9$B19101014....100.000.to..124.999..Error
district_9$less_error <- district_9$B19101001...Total...Error - district_9$B19101017....200.000.or.more..Error - district_9$B19101016....150.000.to..199.999..Error - district_9$B19101015....125.000.to..149.999..Error - district_9$B19101014....100.000.to..124.999..Error

# Figuring out the percentage of each > $100k and < $100k based on total again

boston_only$less_percent <- (boston_only$less/boston_only$total)*100
boston_only$more_percent <- (boston_only$more/boston_only$total)*100

district_1$less_percent <- (district_1$less/district_1$total)*100
district_1$more_percent <- (district_1$more/district_1$total)*100

district_2$less_percent <- (district_2$less/district_2$total)*100
district_2$more_percent <- (district_2$more/district_2$total)*100

district_3$less_percent <- (district_3$less/district_3$total)*100
district_3$more_percent <- (district_3$more/district_3$total)*100

district_4$less_percent <- (district_4$less/district_4$total)*100
district_4$more_percent <- (district_4$more/district_4$total)*100

district_5$less_percent <- (district_5$less/district_5$total)*100
district_5$more_percent <- (district_5$more/district_5$total)*100

district_6$less_percent <- (district_6$less/district_6$total)*100
district_6$more_percent <- (district_6$more/district_6$total)*100

district_7$less_percent <- (district_7$less/district_7$total)*100
district_7$more_percent <- (district_7$more/district_7$total)*100

district_8$less_percent <- (district_8$less/district_8$total)*100
district_8$more_percent <- (district_8$more/district_8$total)*100

district_9$less_percent <- (district_9$less/district_9$total)*100
district_9$more_percent <- (district_9$more/district_9$total)*100

# aggregating the district data

boston_percent_less <- (sum(boston_only$less)/sum(boston_only$total))*100
boston_percent_more <- (sum(boston_only$more)/sum(boston_only$total))*100

district_1_percent_less <- (sum(district_1$less)/sum(district_1$total))*100
district_1_percent_more <- (sum(district_1$more)/sum(district_1$total))*100

district_2_percent_less <- (sum(district_2$less)/sum(district_2$total))*100
district_2_percent_more <- (sum(district_2$more)/sum(district_2$total))*100

district_3_percent_less <- (sum(district_3$less)/sum(district_3$total))*100
district_3_percent_more <- (sum(district_3$more)/sum(district_3$total))*100

district_4_percent_less <- (sum(district_4$less)/sum(district_4$total))*100
district_4_percent_more <- (sum(district_4$more)/sum(district_4$total))*100

district_5_percent_less <- (sum(district_5$less)/sum(district_5$total))*100
district_5_percent_more <- (sum(district_5$more)/sum(district_5$total))*100

district_6_percent_less <- (sum(district_6$less)/sum(district_6$total))*100
district_6_percent_more <- (sum(district_6$more)/sum(district_6$total))*100

district_7_percent_less <- (sum(district_7$less)/sum(district_7$total))*100
district_7_percent_more <- (sum(district_7$more)/sum(district_7$total))*100

district_8_percent_less <- (sum(district_8$less)/sum(district_8$total))*100
district_8_percent_more <- (sum(district_8$more)/sum(district_8$total))*100

district_9_percent_less <- (sum(district_9$less)/sum(district_9$total))*100
district_9_percent_more <- (sum(district_9$more)/sum(district_9$total))*100

# creating a dataframe to match the data with. I should've made a spreadsheet and imported it in instead of creating these columns froms scratch

representing <- c("District 1", "District 2", "District 3", "District 4", "District 5", "District 6", "District 7", "District 8", "District 9", "At-Large", "At-Large", "At-Large", "At-Large")
counsilor <- c("Salvatore LaMattina", "Bill Linehan", "Frank Baker", "Charles C. Yancey", "Timothy McCarthy", "Matt O'Malley", "Tito Jackson", "Josh Zakim", "Mark Ciommo", "Michael Flaherty", "Stephen Murphy", "Ayanna Pressley", "Michelle Wu")
voted <- c("Yes", "Yes", "Yes", "Yes", "Yes", "No", "Yes", "No", "Yes", "Yes", "Yes", "No", "No")
elected <- c(2006, 2007, 2011, 1983, 2013, 2010, 2011, 2013, 2007, 2013, 1997, 2009, 2013)
less <- c(district_1_percent_less, district_2_percent_less, district_3_percent_less, district_4_percent_less, district_5_percent_less, district_6_percent_less, district_7_percent_less, district_8_percent_less, district_9_percent_less, boston_percent_less, boston_percent_less, boston_percent_less, boston_percent_less) 
more <- c(district_1_percent_more, district_2_percent_more, district_3_percent_more, district_4_percent_more, district_5_percent_more, district_6_percent_more, district_7_percent_more, district_8_percent_more, district_9_percent_more, boston_percent_more, boston_percent_more, boston_percent_more, boston_percent_more) 

less <- format(round(less, 2), nsmall=2)
more <- format(round(more, 2), nsmall=2)

less <- paste(less,"%")
more <- paste(more, "%")

city_council <- data.frame(representing,counsilor,voted,elected,less,more)

write.csv(city_council, "city_council.csv")
