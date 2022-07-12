library(data.table)
path <- "https://www.rug.nl/ggdc/historicaldevelopment/maddison/data/mpd2020.dta"
mpd <- haven::read_dta(path)
mpd <- mpd[mpd$year >= 1960, ] # Historical data is not needed

setDT(mpd)

# Recode names
setnames(mpd,
         old = c("countrycode", "country", "gdppc"),
         new = c("country_code", "country_name", "mpd_gdp")
)
# Keep relevant variables
mpd <- mpd[
  ,
  .(country_code, year, mpd_gdp)
]

readr::write_csv(mpd, "maddison.csv")
