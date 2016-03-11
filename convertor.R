
## Tariffs from MXN/GJ to USD/MMBTU

tariffs <- read.csv("trans_tariffs.csv", header = TRUE)

f1 <- 1.055056 ## GJ/MMBTU
f2 <- mean_exrate("2016-03-01", "2016-03-11") ## exchange rate march 2016

## new column with tariffs in USD/MMBTU
tariffs$btuTariff <- tariffs$Tariff*f1/f2

