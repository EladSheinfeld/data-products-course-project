Developing Data Products: Diamond Price Prediction
========================================================
author: Elad Sheinfeld
date: 18/07/2016

Objective
========================================================
This project aims to provide a simple yet elegant application to estimate the expected price of a diamond given 4 attributes:
* Carat
* Cut
* Color
* Clarity

The Diamond Price Model
========================================================

The diamonds dataframe has the following dimensions:

```r
dim(diamonds)
```

```
[1] 53940    11
```
In order to achieve the prediction, I've used a naive linear model fit as follows:

```r
fit <- lm(price~carat+cut+color+clarity, data = diamonds)
```

Predicting in Shiny
========================================================
As the application starts, it creates the linear model since the model calculation shouldn't change between requests or users.

```r
diamonds <- read.csv(file = "diamonds.csv", stringsAsFactors = TRUE)
fit <- lm(price~carat+cut+color+clarity, data = diamonds)
```
Predicting in Shiny
========================================================
Once a user send a request to the app, the user's input is orchestrated into a dataframe with a single line and the predicted price is sent.


```r
observe({
      output$carat <- renderText({input$carat})
      output$cut <- renderText({input$cut})
      output$color <- renderText({input$color})
      output$clarity <- renderText({input$clarity})
      
      predictedPrice <- predict(fit, newdata = data.frame(carat = {input$carat},
                                        cut = {input$cut},
                                        color = {input$color},
                                        clarity = {input$clarity}))
      
      if(predictedPrice <= 0)
        output$predictedPrice <- renderText("Cannot predict price for chosen arguments")
      else
        output$predictedPrice <- renderText(paste("$",round(predictedPrice,2),sep = ""))
    })
```
