#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

#Load Libraries
library(shiny)
data(mtcars)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel(" Motor Trend Car Road Tests Data Exploration"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      #Set parameters for variables
      strong('Histogram parameters'), p(''),
      sliderInput("bins", "Bins for histogram:", min = 1, max = 30, value = 15),
      selectInput('histX', 'Select variable for histogram', names(mtcars), selected = 'mpg'),
      p(''), 
      p(''), 
      p(''),
      
      #Set parameters for scatterplot
      strong('Scatter plot parameters'), p(''),
      selectInput('scatterX', 'Select x axis for scatter plot', 
                  names(mtcars), selected = 'mpg'),
      selectInput('scatterY', 'Select y axis for scatter plot', 
                  names(mtcars), selected = 'mpg'),
      selectInput('scatterCol', 'Select color for scatter plot', 
                  names(mtcars), selected = 'mpg'),
      
      
      #Describe variables
      strong("Variable Description"),
      tags$ul(
        tags$li('mpg - Miles per Gallon'),
        tags$li('cyl - # of cylinders'),
        tags$li('disp - Displacement, in cubic inches'),
        tags$li('hp - Horsepower'),
        tags$li('drat - Driveshaft ratio'),
        tags$li('wt - weight (1000 lbs)'),
        tags$li('qsec - 1/4 mile time; A measure of acceleration'),
        tags$li('vs - Engine shape; 0 = V-shaped, 1 = Straight'),
        tags$li('am - Transmission type; 0 = Automatic, 1 = Manual'),
        tags$li('gear - # of gears'),
        tags$li('carb - # of carburetors')
      )
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      p('This app explores the mtcars data from 1974 Motor Trend US magazine, 
      which comprises fuel consumption and 10 aspects of automobile design 
      and performance for 32 automobiles.'),
      p(''),
      p('This app allows the exploration of the following:'),
      p('(1) select one variable and the bin size to disply the distribution in a histogram'),
      p('(2) select three variables to display the corrleation in a scatter plot'),
      
      plotOutput('HistOneVar'),
      plotOutput('ScatThreeVar')
    )
  )
))