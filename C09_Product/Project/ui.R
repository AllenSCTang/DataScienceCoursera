library(shiny)
library(quantmod)
getSymbols("AAPL")

shinyUI(pageWithSidebar(
      headerPanel("Check the Stock Price of Apple"),
      sidebarPanel(
            h3("Please enter the date:"),
            h5(paste("( between",as.character(index(AAPL)[1]),"&",as.character(index(AAPL)[length(index(AAPL))]),")")),
            dateInput("CheckDate",label=NULL,value=as.character(index(AAPL)[length(index(AAPL))]),min=index(AAPL)[1],max=index(AAPL)[length(index(AAPL))]),
            actionButton("GO","Check It Out!")
      ),             
      mainPanel(
            tabsetPanel(
                  tabPanel("Main Tab",
                           plotOutput("plot"),
                           h4("The stock price on the date you input was:",textOutput("price")),
                           h4("The volume on the date you input was:",textOutput("vol"))
                  ),
                  tabPanel("Explanation",
                           h4("What does this Shiny app do?"),
                           p("This app can show you the line chart of Apple stock price, and let you check the price on certain date in recent 8 years."),
                           h4("How can I use this app?"),
                           p("Just select the date you want, click the button below and there you go!"),
                           h4("What can I get from this app?"),
                           p("You can get the price and volume of Apple stock, and the exact location of the date you input in the chart is shown by the vertical line too. ")
                  )
            )
      )
)
)