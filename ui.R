# Install / Load relevant packages
library(shiny)
library(rvest)
library(dplyr)
library(tidyr)
library(stringr)
library(DT)

shinyUI(fluidPage(
  
  title = "Amazon Reviews Scraper",
  titlePanel(title=div(img(src="logo.png",align='right'),"Amazon Reviews Scraper")),
  sidebarPanel(
    conditionalPanel(condition="input.tabselected==1",
                     textInput("base_url","Enter Base URL"),
                     # selectInput("sel_base",
                     #             "Select website",
                     #             choices = list("Amazon.com"="az_com",
                     #                            "Amazon.in"="az_in")),
                     numericInput("n_pgs","No of pages to scrape",
                                  min = 1,
                                  max=10,
                                  value = 1),
                     actionButton("scrape","Scrape")
    )
    
  ),
  mainPanel(
    # recommend review the syntax for tabsetPanel() & tabPanel() for better understanding
    # id argument is important in the tabsetPanel()
    # value argument is important in the tabPanle()
    tabsetPanel(
      tabPanel("Overview", value=1, 
               h3('Overview'),

              p('Amazon scraper app helps you to download reviews of listed product on any Amazon site.'),

              h3('How to use this App'),
p('- Go to amazon site of your choice for ex. amazon.com, amazon.co.uk, amazon.in etc.'),br(),

p('- Go to product page as shown below and click on ratings'),br(),

  

p('- Scroll down to bottom and click on see all reviews'),br(),

  p('- Now, copy URL (base URL) from browser and paste it to sidebar panel'),br(),

  p('- Select number of pages (restricted to Max. 5) to scrape and click scrape'),br(),
p('Note: Please ensure number of pages you selected on app are available on amazon.')
      ),
      tabPanel("Scraped Data", value=1,
               h5("Scraped Data Summary"),
               verbatimTextOutput("sc_sum"),
               hr(),
               h5("Download"),
               downloadButton("dwnld"),
               hr(),
               h5("Sample Scraped Data"),
               DT::dataTableOutput("ssd")
               
      ),
      id = "tabselected"
    )
  )
))
