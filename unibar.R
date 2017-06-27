library(highcharter)
library(dplyr)
library(magrittr)

highbar <- function(data, column, title = '', name = '') {
  
  da <- data %>%
    select_(column) %>%
    pull(1) %>%
    as.factor()
  
  lev <- da %>%
    levels()
  
  tab <- da %>%
    table() %>%
    as.vector()
  
  highchart() %>%
    hc_chart(type = 'column') %>%
    hc_title(text = title) %>%
    hc_xAxis(categories = lev) %>%
    hc_add_series(data = tab,
                  name = name)
  
}

highbar(mtcars, 'cyl')
data <- mtcars
column <- 'cyl'
