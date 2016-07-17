shinyUI(
  pageWithSidebar(
    headerPanel("Diamond Price Prediction"),
    
    sidebarPanel(
      h3("Select the attributes of your desired diamond"),
      sliderInput("carat","Carat:", .2, 5.01, 2.5, step=.01),
      selectInput("cut", "Cut:",
                  c("Fair","Good","Very Good","Premium","Ideal")),
      selectInput("color", "Color:",
                  c("D","E","F","G","H","I","J")),
      
      selectInput("clarity", "Clarity:",
                  c("I1","SI2","SI1","VS2","VS1","VVS2","VVS1","IF")),
      submitButton("Predict!")
    ),
    
    mainPanel(
      fluidRow(
        column(1, offset =1,
               h3('Carat:'),
               h4(textOutput('carat'))
        ),
        column(1,
              h3('Cut:'),
              h4(textOutput('cut'))
        ),
        column(1,
               h3('Color:'),
               h4(textOutput('color'))
        ),
        column(1,
               h3('Clarity:'),
               h4(textOutput('clarity'))
        )
        
      ),
      fluidRow(
        column(4, offset =1,
          h3('The predicted price is:'),
          h2(textOutput('predictedPrice'))
        )
      )
      
      
    )
  )
)