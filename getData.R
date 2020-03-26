library(readxl)
library(tidyr)
library(lubridate)

data <- read_excel("130055190609.xlsx", skip=4, col_names = c("rok", "celkem", c(1:12)))

data <- data[,-2]

data <- pivot_longer(data, -rok, names_to = "month", values_to = "y")

data$datum <- paste0(data$rok, "-", formatC(as.numeric(data$month), width=2, format="d", flag="0"), "-01")

data$x <- as.numeric(as_date(data$datum)) * 86400000
