library(shiny)
library(stringr)
library(dplyr)
library(ggplot2)
library(stats)
library(DT)
library(ggpmisc)

df <- read.csv('CompressedAgreementData.csv')
colnames(df)[1] <- 'Agreement'
df2 <- read.csv('CompressedAgreementDataTrunc.csv')
colnames(df2)[1] <- 'AgreementDuration'

shinyUI(fluidPage(
    titlePanel('National Economics and the Length of Power-Sharing Agreements'),
    sidebarLayout(
        sidebarPanel(
            varSelectInput(inputId = 'var1', df2[-1], label = 'Variable', selected = 'PoliticalPS',
                        multiple = F),
            h5('The above dropdown menu gives you the possible national level economic indicators which the researcher deemed
            relevant to the length of Power-Sharing Agreements. Please select one and see the regression graph to the right
            which will show the correlations.'),
            h5('The table on the right is the list of all the Power-Sharing agreements in the dataset with their
               respective years, country, duration of the agreement, and whether or not it failed.')
        ),
    mainPanel(
        plotOutput('plot'),
        textOutput('regression'),
        dataTableOutput('table')

    )
     )
    ))
    
