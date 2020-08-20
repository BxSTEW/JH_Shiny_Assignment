library(shiny)
library(stringr)
library(dplyr)
library(ggplot2)
library(stats)
library(ggpmisc)

shinyServer(function(input, output, session) {
    
    output$table <- renderDataTable({
        df[1:5] 
        })
    
    updateVarSelectInput(session, 'var1')
    
        output$plot <- renderPlot({
            my_formula <- y ~ x
            ggplot(df, aes(AgreementDuration, .data[[input$var1]])) + geom_point() + 
                    geom_smooth(method = 'lm') + 
                    stat_poly_eq(formula = my_formula, 
                                 eq.with.lhs = "italic(hat(y))~`=`~",
                                 aes(label = paste(..eq.label.., ..rr.label.., sep = "~~~")),
                                 parse = TRUE, size = 5, color = 'red')

        })
        
})