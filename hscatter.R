h <- hchart(mtcars,
       "scatter",
       hcaes(x = disp, y = mpg),
       color = 'red') 

h <- hchart(mtcars,
            "scatter",
            hcaes(x = disp, y = mpg, group = cyl)) 


fit <- lm(mpg ~ disp, mtcars)
new <- tibble::tibble(disp = 0:600)
fits <- tibble::tibble(value = predict(fit, newdata = new))

h %>% 
  hc_add_series(type = 'line', data = fits$value) %>%
  hc_plotOptions(line = list(color = 'red',
                             marker = list(lineWidth = 0.1)))
  
  hc_title(text = "Scatter Plot",
           align = 'left',
           style = list(color = 'red',
                        fontWeight = "bold",
                        fontSize = '18px')) %>%
  
  hc_subtitle(text = "Scatter Plot",
           align = 'left',
           style = list(color = 'red',
                        fontWeight = "bold",
                        fontSize = '12px')) %>%
  
  hc_xAxis(title = list(text = "Displacement",
                        align = 'left'),
           minorTickInterval = "auto",
           showFirstLabel = TRUE,
           showLastLabel = TRUE,
           min = 0, max = 600) %>%
  
  hc_yAxis(title = list(text = "Miles Per Gallon",
                        style = list(color = 'blue',
                                     fontWeight = "italic",
                                     fontSize = "18px")),
           opposite = TRUE)
