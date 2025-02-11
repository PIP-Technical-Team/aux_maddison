library(data.table)

# path1 <- "https://www.rug.nl/ggdc/historicaldevelopment/maddison/data/mpd2020.dta"
# mpd1 <- haven::read_dta(path1)
# setDT(mpd1)
# mpd1 <- mpd1[year >= 1960] # Historical data is not needed

path2 <- "https://dataverse.nl/api/access/datafile/421303"
mpd2 <- haven::read_dta(path2)
setDT(mpd2)
mpd2 <- mpd2[year >= 1960] # Historical data is not needed

# waldo::compare(mpd1[countrycode == "COL" & year < 2019, .(year, gdppc)],
#                mpd2[countrycode == "COL" & year < 2019, .(year, gdppc)])

# Recode names
setnames(mpd2,
         old = c("countrycode", "country", "gdppc"),
         new = c("country_code", "country_name", "mpd_gdp")
)
# Keep relevant variables
mpd <- mpd2[,.(country_code, year, mpd_gdp)]

readr::write_csv(mpd, "maddison.csv")
