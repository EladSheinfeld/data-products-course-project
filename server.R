data(diamonds)
fit <- lm(price~carat+cut+color+clarity, data = diamonds)


shinyServer(
  function(input, output) {
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
  }
)