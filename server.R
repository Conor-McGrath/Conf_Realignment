shinyServer(function(input, output, session) {
  
  
  # Render DT -------------------------------------------
  output$colleges <- DT::renderDataTable({
    DT::datatable(colleges[c(-1,-(11:14))], 
                  rownames = FALSE,
                  filter = "top",
                  options = list(
      pageLength = -1,
      dom = 'ti',
      initComplete = JS(
        "function(settings, json) {",
        "$(this.api().table().header()).css({'background-color': '#517fb9', 'color': '#fff'});",
        "}"
      )
    )
    )%>%
      formatCurrency(c('Enrollment'), currency = '',
                    interval = 3, mark = ',', before = FALSE, digits = 0)
    })
  
  output$conf1 <- renderText(input$conf_title1)
  output$results_1 <- renderText(paste(input$rank_list_1, collapse = ', '))
  df_1 <- reactive({
    req(input$rank_list_1)
    plot_data <- colleges %>%
      filter(`Common name` %in% input$rank_list_1)
    plot_data$`Common name` <- factor(plot_data$`Common name`, levels = input$rank_list_1)
    return(plot_data)
  })
  output$scatterplot1 = renderPlot({
    ggplot(df_1(),aes(x=`Common name`, y=dummy, label=`Common name`)) +
      geom_image(aes(image = images),asp=4, size=.28, by = 'height') + theme(axis.line = element_blank(),
                                                                             panel.grid.major = element_blank(), 
                                                                             panel.grid.minor = element_blank(), 
                                                                             panel.border = element_blank(),
                                                                             panel.background = element_blank(),
                                                                             plot.background = element_blank(),
                                                                             axis.text.x=element_blank(),
                                                                             axis.ticks.x=element_blank(),
                                                                             axis.text.y=element_blank(),
                                                                             axis.ticks.y=element_blank()) + labs(x = "",  
                                                                                                                  y = "",
                                                                                                                  title = "",
                                                                                                                  subtitle = "") 
    
  }, width = 1000, height = 250, bg = "transparent"
  
  )
  
  output$conf2 <- renderText(input$conf_title2)
  output$results_2 <- renderText(paste(input$rank_list_2, collapse = ', '))
  df_2 <- reactive({
    req(input$rank_list_2)
    plot_data <- colleges %>%
      filter(`Common name` %in% input$rank_list_2)
    plot_data$`Common name` <- factor(plot_data$`Common name`, levels = input$rank_list_2)
    return(plot_data)
  })
  output$scatterplot2 = renderPlot({
    ggplot(df_2(), aes(x=`Common name`, y=dummy, label=`Common name`)) +
      geom_image(aes(image = images),asp=4, size=.28, by = 'height') + theme(axis.line = element_blank(), # Set axis line as black
                                                                             panel.grid.major = element_blank(), # Remove grid
                                                                             panel.grid.minor = element_blank(), # Remove grid
                                                                             panel.border = element_blank(), # Remove grid
                                                                             panel.background = element_blank(), plot.background = element_blank(),
                                                                             axis.text.x=element_blank(),
                                                                             axis.ticks.x=element_blank(),
                                                                             axis.text.y=element_blank(),
                                                                             axis.ticks.y=element_blank()) + labs(x = "",  
                                                                                                                  y = "",
                                                                                                                  title = "",
                                                                                                                  subtitle = "") 
    
  }, width = 1000, height = 250, bg = "transparent"
  
  )
  
  output$conf3 <- renderText(input$conf_title3)
  output$results_3 <- renderText(paste(input$rank_list_3, collapse = ', '))
  df_3 <- reactive({
    req(input$rank_list_3)
    plot_data <- colleges %>%
      filter(`Common name` %in% input$rank_list_3)
    plot_data$`Common name` <- factor(plot_data$`Common name`, levels = input$rank_list_3)
    return(plot_data)
  })
  output$scatterplot3 = renderPlot({
    ggplot(df_3(), aes(x=`Common name`, y=dummy, label=`Common name`)) +
      geom_image(aes(image = images),asp=4, size=.28, by = 'height') + theme(axis.line = element_blank(), # Set axis line as black
                                                                             panel.grid.major = element_blank(), # Remove grid
                                                                             panel.grid.minor = element_blank(), # Remove grid
                                                                             panel.border = element_blank(), # Remove grid
                                                                             panel.background = element_blank(), plot.background = element_blank(),
                                                                             axis.text.x=element_blank(),
                                                                             axis.ticks.x=element_blank(),
                                                                             axis.text.y=element_blank(),
                                                                             axis.ticks.y=element_blank()) + labs(x = "",  
                                                                                                                  y = "",
                                                                                                                  title = "",
                                                                                                                  subtitle = "") 
    
  }, width = 1000, height = 250, bg = "transparent"
  
  )
  
  output$conf4 <- renderText(input$conf_title4)
  output$results_4 <- renderText(paste(input$rank_list_4, collapse = ', '))
  df_4 <- reactive({
    req(input$rank_list_4)
    plot_data <- colleges %>%
      filter(`Common name` %in% input$rank_list_4)
    plot_data$`Common name` <- factor(plot_data$`Common name`, levels = input$rank_list_4)
    return(plot_data)
  })
  output$scatterplot4 = renderPlot({
    ggplot(df_4(), aes(x=`Common name`, y=dummy, label=`Common name`)) +
      geom_image(aes(image = images),asp=4, size=.28, by = 'height') + theme(axis.line = element_blank(), # Set axis line as black
                                                                             panel.grid.major = element_blank(), # Remove grid
                                                                             panel.grid.minor = element_blank(), # Remove grid
                                                                             panel.border = element_blank(), # Remove grid
                                                                             panel.background = element_blank(), plot.background = element_blank(),
                                                                             axis.text.x=element_blank(),
                                                                             axis.ticks.x=element_blank(),
                                                                             axis.text.y=element_blank(),
                                                                             axis.ticks.y=element_blank()) + labs(x = "",  
                                                                                                                  y = "",
                                                                                                                  title = "",
                                                                                                                  subtitle = "") 
    
  }, width = 1000, height = 250, bg = "transparent"
  
  )
  
  output$conf5 <- renderText(input$conf_title5)
  output$results_5 <- renderText(paste(input$rank_list_5, collapse = ', '))
  df_5 <- reactive({
    req(input$rank_list_5)
    plot_data <- colleges %>%
      filter(`Common name` %in% input$rank_list_5)
    plot_data$`Common name` <- factor(plot_data$`Common name`, levels = input$rank_list_5)
    return(plot_data)
  })
  output$scatterplot5 = renderPlot({
    ggplot(df_5(),aes(x=`Common name`, y=dummy, label=`Common name`)) +
      geom_image(aes(image = images),asp=4, size=.28, by = 'height') + theme(axis.line = element_blank(), # Set axis line as black
                                                                             panel.grid.major = element_blank(), # Remove grid
                                                                             panel.grid.minor = element_blank(), # Remove grid
                                                                             panel.border = element_blank(), # Remove grid
                                                                             panel.background = element_blank(), plot.background = element_blank(),
                                                                             axis.text.x=element_blank(),
                                                                             axis.ticks.x=element_blank(),
                                                                             axis.text.y=element_blank(),
                                                                             axis.ticks.y=element_blank()) + labs(x = "",  
                                                                                                                  y = "",
                                                                                                                  title = "",
                                                                                                                  subtitle = "") 
    
  }, width = 1000, height = 250, bg = "transparent"
  
  )
  
  output$conf6 <- renderText(input$conf_title6)
  output$results_6 <- renderText(paste(input$rank_list_6, collapse = ', '))
  df_6 <- reactive({
    req(input$rank_list_6)
    plot_data <- colleges %>%
      filter(`Common name` %in% input$rank_list_6)
    plot_data$`Common name` <- factor(plot_data$`Common name`, levels = input$rank_list_6)
    return(plot_data)
  })
  output$scatterplot6 = renderPlot({
    ggplot(df_6(), aes(x=`Common name`, y=dummy, label=`Common name`)) +
      geom_image(aes(image = images),asp=4, size=.28, by = 'height') + theme(axis.line = element_blank(), # Set axis line as black
                                                                             panel.grid.major = element_blank(), # Remove grid
                                                                             panel.grid.minor = element_blank(), # Remove grid
                                                                             panel.border = element_blank(), # Remove grid
                                                                             panel.background = element_blank(), plot.background = element_blank(),
                                                                             axis.text.x=element_blank(),
                                                                             axis.ticks.x=element_blank(),
                                                                             axis.text.y=element_blank(),
                                                                             axis.ticks.y=element_blank()) + labs(x = "",  
                                                                                                                  y = "",
                                                                                                                  title = "",
                                                                                                                  subtitle = "") 
    
  }, width = 1000, height = 250, bg = "transparent"
  
  )
  
  output$conf7 <- renderText(input$conf_title7)
  output$results_7 <- renderText(paste(input$rank_list_7, collapse = ', '))
  df_7 <- reactive({
    req(input$rank_list_7)
    plot_data <- colleges %>%
      filter(`Common name` %in% input$rank_list_7)
    plot_data$`Common name` <- factor(plot_data$`Common name`, levels = input$rank_list_7)
    return(plot_data)
  })
  output$scatterplot7 = renderPlot({
    ggplot(df_7(), aes(x=`Common name`, y=dummy, label=`Common name`)) +
      geom_image(aes(image = images),asp=4, size=.28, by = 'height') + theme(axis.line = element_blank(), # Set axis line as black
                                                                             panel.grid.major = element_blank(), # Remove grid
                                                                             panel.grid.minor = element_blank(), # Remove grid
                                                                             panel.border = element_blank(), # Remove grid
                                                                             panel.background = element_blank(), plot.background = element_blank(),
                                                                             axis.text.x=element_blank(),
                                                                             axis.ticks.x=element_blank(),
                                                                             axis.text.y=element_blank(),
                                                                             axis.ticks.y=element_blank()) + labs(x = "",  
                                                                                                                  y = "",
                                                                                                                  title = "",
                                                                                                                  subtitle = "") 
    
  }, width = 1000, height = 250, bg = "transparent"
  
  )
  
  output$conf8 <- renderText(input$conf_title8)
  output$results_8 <- renderText(paste(input$rank_list_8, collapse = ', '))
  df_8 <- reactive({
    req(input$rank_list_8)
    plot_data <- colleges %>%
      filter(`Common name` %in% input$rank_list_8)
    plot_data$`Common name` <- factor(plot_data$`Common name`, levels = input$rank_list_8)
    return(plot_data)
  })
  output$scatterplot8 = renderPlot({
    ggplot(df_8(),aes(x=`Common name`, y=dummy, label=`Common name`)) +
      geom_image(aes(image = images),asp=4, size=.28, by = 'height') + theme(axis.line = element_blank(), # Set axis line as black
                                                                             panel.grid.major = element_blank(), # Remove grid
                                                                             panel.grid.minor = element_blank(), # Remove grid
                                                                             panel.border = element_blank(), # Remove grid
                                                                             panel.background = element_blank(), plot.background = element_blank(),
                                                                             axis.text.x=element_blank(),
                                                                             axis.ticks.x=element_blank(),
                                                                             axis.text.y=element_blank(),
                                                                             axis.ticks.y=element_blank()) + labs(x = "",  
                                                                                                                  y = "",
                                                                                                                  title = "",
                                                                                                                  subtitle = "") 
    
  }, width = 1000, height = 250, bg = "transparent"
  
  )
  
  output$conf9 <- renderText(input$conf_title9)
  output$results_9 <- renderText(paste(input$rank_list_9, collapse = ', '))
  df_9 <- reactive({
    req(input$rank_list_9)
    plot_data <- colleges %>%
      filter(`Common name` %in% input$rank_list_9)
    plot_data$`Common name` <- factor(plot_data$`Common name`, levels = input$rank_list_9)
    return(plot_data)
  })
  output$scatterplot9 = renderPlot({
    ggplot(df_9(),aes(x=`Common name`, y=dummy, label=`Common name`)) +
      geom_image(aes(image = images),asp=4, size=.28, by = 'height') + theme(axis.line = element_blank(), # Set axis line as black
                                                                             panel.grid.major = element_blank(), # Remove grid
                                                                             panel.grid.minor = element_blank(), # Remove grid
                                                                             panel.border = element_blank(), # Remove grid
                                                                             panel.background = element_blank(), plot.background = element_blank(),
                                                                             axis.text.x=element_blank(),
                                                                             axis.ticks.x=element_blank(),
                                                                             axis.text.y=element_blank(),
                                                                             axis.ticks.y=element_blank()) + labs(x = "",  
                                                                                                                  y = "",
                                                                                                                  title = "",
                                                                                                                  subtitle = "") 
    
  }, width = 1000, height = 250, bg = "transparent"
  
  )
  
  output$conf10 <- renderText(input$conf_title10)
  output$results_10 <- renderText(paste(input$rank_list_10, collapse = ', '))
  df_10 <- reactive({
    req(input$rank_list_10)
    plot_data <- colleges %>%
      filter(`Common name` %in% input$rank_list_10)
    plot_data$`Common name` <- factor(plot_data$`Common name`, levels = input$rank_list_10)
    return(plot_data)
  })
  output$scatterplot10 = renderPlot({
    ggplot(df_10(),aes(x=`Common name`, y=dummy, label=`Common name`)) +
      geom_image(aes(image = images),asp=4, size=.28, by = 'height') + theme(axis.line = element_blank(), # Set axis line as black
                                                                             panel.grid.major = element_blank(), # Remove grid
                                                                             panel.grid.minor = element_blank(), # Remove grid
                                                                             panel.border = element_blank(), # Remove grid
                                                                             panel.background = element_blank(), plot.background = element_blank(),
                                                                             axis.text.x=element_blank(),
                                                                             axis.ticks.x=element_blank(),
                                                                             axis.text.y=element_blank(),
                                                                             axis.ticks.y=element_blank()) + labs(x = "",  
                                                                                                                  y = "",
                                                                                                                  title = "",
                                                                                                                  subtitle = "") 
    
  }, width = 1000, height = 250, bg = "transparent"
  
  )
  
  output$conf11 <- renderText(input$conf_title11)
  output$results_11 <- renderText(paste(input$rank_list_11, collapse = ', '))
  df_11 <- reactive({
    req(input$rank_list_11)
    plot_data <- colleges %>%
      filter(`Common name` %in% input$rank_list_11)
    plot_data$`Common name` <- factor(plot_data$`Common name`, levels = input$rank_list_11)
    return(plot_data)
  })
  output$scatterplot11 = renderPlot({
    ggplot(df_11(),aes(x=`Common name`, y=dummy, label=`Common name`)) +
      geom_image(aes(image = images),asp=4, size=.28, by = 'height') + theme(axis.line = element_blank(), # Set axis line as black
                                                                             panel.grid.major = element_blank(), # Remove grid
                                                                             panel.grid.minor = element_blank(), # Remove grid
                                                                             panel.border = element_blank(), # Remove grid
                                                                             panel.background = element_blank(), plot.background = element_blank(),
                                                                             axis.text.x=element_blank(),
                                                                             axis.ticks.x=element_blank(),
                                                                             axis.text.y=element_blank(),
                                                                             axis.ticks.y=element_blank()) + labs(x = "",  
                                                                                                                  y = "",
                                                                                                                  title = "",
                                                                                                                  subtitle = "") 
    
  }, width = 1000, height = 250, bg = "transparent"
  
  )
  
  output$conf12 <- renderText(input$conf_title12)
  output$results_12 <- renderText(paste(input$rank_list_12, collapse = ', '))
  df_12 <- reactive({
    req(input$rank_list_12)
    plot_data <- colleges %>%
      filter(`Common name` %in% input$rank_list_12)
    plot_data$`Common name` <- factor(plot_data$`Common name`, levels = input$rank_list_12)
    return(plot_data)
  })
  output$scatterplot12 = renderPlot({
    ggplot(df_12(),aes(x=`Common name`, y=dummy, label=`Common name`)) +
      geom_image(aes(image = images),asp=4, size=.28, by = 'height') + theme(axis.line = element_blank(), # Set axis line as black
                                                                             panel.grid.major = element_blank(), # Remove grid
                                                                             panel.grid.minor = element_blank(), # Remove grid
                                                                             panel.border = element_blank(), # Remove grid
                                                                             panel.background = element_blank(), plot.background = element_blank(),
                                                                             axis.text.x=element_blank(),
                                                                             axis.ticks.x=element_blank(),
                                                                             axis.text.y=element_blank(),
                                                                             axis.ticks.y=element_blank()) + labs(x = "",  
                                                                                                                  y = "",
                                                                                                                  title = "",
                                                                                                                  subtitle = "") 
    
  }, width = 1000, height = 250, bg = "transparent"
  
  )
  
  output$conf13 <- renderText(input$conf_title13)
  output$results_13 <- renderText(paste(input$rank_list_13, collapse = ', '))
  df_13 <- reactive({
    req(input$rank_list_13)
    plot_data <- colleges %>%
      filter(`Common name` %in% input$rank_list_13)
    plot_data$`Common name` <- factor(plot_data$`Common name`, levels = input$rank_list_13)
    return(plot_data)
  })
  output$scatterplot13 = renderPlot({
    ggplot(df_13(),aes(x=`Common name`, y=dummy, label=`Common name`)) +
      geom_image(aes(image = images),asp=4, size=.28, by = 'height') + theme(axis.line = element_blank(), # Set axis line as black
                                                                             panel.grid.major = element_blank(), # Remove grid
                                                                             panel.grid.minor = element_blank(), # Remove grid
                                                                             panel.border = element_blank(), # Remove grid
                                                                             panel.background = element_blank(), plot.background = element_blank(),
                                                                             axis.text.x=element_blank(),
                                                                             axis.ticks.x=element_blank(),
                                                                             axis.text.y=element_blank(),
                                                                             axis.ticks.y=element_blank()) + labs(x = "",  
                                                                                                                  y = "",
                                                                                                                  title = "",
                                                                                                                  subtitle = "") 
    
  }, width = 1000, height = 250, bg = "transparent"
  
  )
  
  output$conf14 <- renderText(input$conf_title14)
  output$results_14 <- renderText(paste(input$rank_list_14, collapse = ', '))
  df_14 <- reactive({
    req(input$rank_list_14)
    plot_data <- colleges %>%
      filter(`Common name` %in% input$rank_list_14)
    plot_data$`Common name` <- factor(plot_data$`Common name`, levels = input$rank_list_14)
    return(plot_data)
  })
  output$scatterplot14 = renderPlot({
    ggplot(df_14(),aes(x=`Common name`, y=dummy, label=`Common name`)) +
      geom_image(aes(image = images),asp=4, size=.28, by = 'height') + theme(axis.line = element_blank(), # Set axis line as black
                                                                             panel.grid.major = element_blank(), # Remove grid
                                                                             panel.grid.minor = element_blank(), # Remove grid
                                                                             panel.border = element_blank(), # Remove grid
                                                                             panel.background = element_blank(), plot.background = element_blank(),
                                                                             axis.text.x=element_blank(),
                                                                             axis.ticks.x=element_blank(),
                                                                             axis.text.y=element_blank(),
                                                                             axis.ticks.y=element_blank()) + labs(x = "",  
                                                                                                                  y = "",
                                                                                                                  title = "",
                                                                                                                  subtitle = "") 
    
  }, width = 1000, height = 250, bg = "transparent"
  
  )
  
  output$conf15 <- renderText(input$conf_title15)
  output$results_15 <- renderText(paste(input$rank_list_15, collapse = ', '))
  df_15 <- reactive({
    req(input$rank_list_15)
    plot_data <- colleges %>%
      filter(`Common name` %in% input$rank_list_15)
    plot_data$`Common name` <- factor(plot_data$`Common name`, levels = input$rank_list_15)
    return(plot_data)
  })
  output$scatterplot15 = renderPlot({
    ggplot(df_15(),aes(x=`Common name`, y=dummy, label=`Common name`)) +
      geom_image(aes(image = images),asp=4, size=.28, by = 'height') + theme(axis.line = element_blank(), # Set axis line as black
                                                                             panel.grid.major = element_blank(), # Remove grid
                                                                             panel.grid.minor = element_blank(), # Remove grid
                                                                             panel.border = element_blank(), # Remove grid
                                                                             panel.background = element_blank(), plot.background = element_blank(),
                                                                             axis.text.x=element_blank(),
                                                                             axis.ticks.x=element_blank(),
                                                                             axis.text.y=element_blank(),
                                                                             axis.ticks.y=element_blank()) + labs(x = "",  
                                                                                                                  y = "",
                                                                                                                  title = "",
                                                                                                                  subtitle = "") 
    
  }, width = 1000, height = 250, bg = "transparent"
  
  )
  
  output$conf16 <- renderText(input$conf_title16)
  output$results_16 <- renderText(paste(input$rank_list_16, collapse = ', '))
  df_16 <- reactive({
    req(input$rank_list_16)
    plot_data <- colleges %>%
      filter(`Common name` %in% input$rank_list_16)
    plot_data$`Common name` <- factor(plot_data$`Common name`, levels = input$rank_list_16)
    return(plot_data)
  })
  output$scatterplot16 = renderPlot({
    ggplot(df_16(),aes(x=`Common name`, y=dummy, label=`Common name`)) +
      geom_image(aes(image = images),asp=4, size=.28, by = 'height') + theme(axis.line = element_blank(), # Set axis line as black
                                                                             panel.grid.major = element_blank(), # Remove grid
                                                                             panel.grid.minor = element_blank(), # Remove grid
                                                                             panel.border = element_blank(), # Remove grid
                                                                             panel.background = element_blank(), plot.background = element_blank(),
                                                                             axis.text.x=element_blank(),
                                                                             axis.ticks.x=element_blank(),
                                                                             axis.text.y=element_blank(),
                                                                             axis.ticks.y=element_blank()) + labs(x = "",  
                                                                                                                  y = "",
                                                                                                                  title = "",
                                                                                                                  subtitle = "") 
    
  }, width = 1000, height = 250, bg = "transparent"
  
  )
  
  output$conf17 <- renderText(input$conf_title17)
  output$results_17 <- renderText(paste(input$rank_list_17, collapse = ', '))
  df_17 <- reactive({
    req(input$rank_list_17)
    plot_data <- colleges %>%
      filter(`Common name` %in% input$rank_list_17)
    plot_data$`Common name` <- factor(plot_data$`Common name`, levels = input$rank_list_17)
    return(plot_data)
  })
  output$scatterplot17 = renderPlot({
    ggplot(df_17(),aes(x=`Common name`, y=dummy, label=`Common name`)) +
      geom_image(aes(image = images),asp=4, size=.28, by = 'height') + theme(axis.line = element_blank(), # Set axis line as black
                                                                             panel.grid.major = element_blank(), # Remove grid
                                                                             panel.grid.minor = element_blank(), # Remove grid
                                                                             panel.border = element_blank(), # Remove grid
                                                                             panel.background = element_blank(), plot.background = element_blank(),
                                                                             axis.text.x=element_blank(),
                                                                             axis.ticks.x=element_blank(),
                                                                             axis.text.y=element_blank(),
                                                                             axis.ticks.y=element_blank()) + labs(x = "",  
                                                                                                                  y = "",
                                                                                                                  title = "",
                                                                                                                  subtitle = "") 
    
  }, width = 1000, height = 250, bg = "transparent"
  
  )
  
  output$conf18 <- renderText(input$conf_title18)
  output$results_18 <- renderText(paste(input$rank_list_18, collapse = ', '))
  df_18 <- reactive({
    req(input$rank_list_18)
    plot_data <- colleges %>%
      filter(`Common name` %in% input$rank_list_18)
    plot_data$`Common name` <- factor(plot_data$`Common name`, levels = input$rank_list_18)
    return(plot_data)
  })
  output$scatterplot18 = renderPlot({
    ggplot(df_18(),aes(x=`Common name`, y=dummy, label=`Common name`)) +
      geom_image(aes(image = images),asp=4, size=.28, by = 'height') + theme(axis.line = element_blank(), # Set axis line as black
                                                                             panel.grid.major = element_blank(), # Remove grid
                                                                             panel.grid.minor = element_blank(), # Remove grid
                                                                             panel.border = element_blank(), # Remove grid
                                                                             panel.background = element_blank(), plot.background = element_blank(),
                                                                             axis.text.x=element_blank(),
                                                                             axis.ticks.x=element_blank(),
                                                                             axis.text.y=element_blank(),
                                                                             axis.ticks.y=element_blank()) + labs(x = "",  
                                                                                                                  y = "",
                                                                                                                  title = "",
                                                                                                                  subtitle = "") 
    
  }, width = 1000, height = 250, bg = "transparent"
  
  )
  
  output$conf19 <- renderText(input$conf_title19)
  output$results_19 <- renderText(paste(input$rank_list_19, collapse = ', '))
  df_19 <- reactive({
    req(input$rank_list_19)
    plot_data <- colleges %>%
      filter(`Common name` %in% input$rank_list_19)
    plot_data$`Common name` <- factor(plot_data$`Common name`, levels = input$rank_list_19)
    return(plot_data)
  })
  output$scatterplot19 = renderPlot({
    ggplot(df_19(),aes(x=`Common name`, y=dummy, label=`Common name`)) +
      geom_image(aes(image = images),asp=4, size=.28, by = 'height') + theme(axis.line = element_blank(), # Set axis line as black
                                                                             panel.grid.major = element_blank(), # Remove grid
                                                                             panel.grid.minor = element_blank(), # Remove grid
                                                                             panel.border = element_blank(), # Remove grid
                                                                             panel.background = element_blank(), plot.background = element_blank(),
                                                                             axis.text.x=element_blank(),
                                                                             axis.ticks.x=element_blank(),
                                                                             axis.text.y=element_blank(),
                                                                             axis.ticks.y=element_blank()) + labs(x = "",  
                                                                                                                  y = "",
                                                                                                                  title = "",
                                                                                                                  subtitle = "") 
    
  }, width = 1000, height = 250, bg = "transparent"
  
  )
  
  output$conf20 <- renderText(input$conf_title20)
  output$results_20 <- renderText(paste(input$rank_list_20, collapse = ', '))
  df_20 <- reactive({
    req(input$rank_list_20)
    plot_data <- colleges %>%
      filter(`Common name` %in% input$rank_list_20)
    plot_data$`Common name` <- factor(plot_data$`Common name`, levels = input$rank_list_20)
    return(plot_data)
  })
  output$scatterplot20 = renderPlot({
    ggplot(df_20(),aes(x=`Common name`, y=dummy, label=`Common name`)) +
      geom_image(aes(image = images),asp=4, size=.28, by = 'height') + theme(axis.line = element_blank(), # Set axis line as black
                                                                             panel.grid.major = element_blank(), # Remove grid
                                                                             panel.grid.minor = element_blank(), # Remove grid
                                                                             panel.border = element_blank(), # Remove grid
                                                                             panel.background = element_blank(), plot.background = element_blank(),
                                                                             axis.text.x=element_blank(),
                                                                             axis.ticks.x=element_blank(),
                                                                             axis.text.y=element_blank(),
                                                                             axis.ticks.y=element_blank()) + labs(x = "",  
                                                                                                                  y = "",
                                                                                                                  title = "",
                                                                                                                  subtitle = "") 
    
  }, width = 1000, height = 250, bg = "transparent"
  
  )
  
  output$conf21 <- renderText(input$conf_title21)
  output$results_21 <- renderText(paste(input$rank_list_21, collapse = ', '))
  df_21 <- reactive({
    req(input$rank_list_21)
    plot_data <- colleges %>%
      filter(`Common name` %in% input$rank_list_21)
    plot_data$`Common name` <- factor(plot_data$`Common name`, levels = input$rank_list_21)
    return(plot_data)
  })
  output$scatterplot21 = renderPlot({
    ggplot(df_21(),aes(x=`Common name`, y=dummy, label=`Common name`)) +
      geom_image(aes(image = images),asp=4, size=.28, by = 'height') + theme(axis.line = element_blank(), # Set axis line as black
                                                                             panel.grid.major = element_blank(), # Remove grid
                                                                             panel.grid.minor = element_blank(), # Remove grid
                                                                             panel.border = element_blank(), # Remove grid
                                                                             panel.background = element_blank(), plot.background = element_blank(),
                                                                             axis.text.x=element_blank(),
                                                                             axis.ticks.x=element_blank(),
                                                                             axis.text.y=element_blank(),
                                                                             axis.ticks.y=element_blank()) + labs(x = "",  
                                                                                                                  y = "",
                                                                                                                  title = "",
                                                                                                                  subtitle = "") 
    
  }, width = 1000, height = 250, bg = "transparent"
  
  )
  
  output$conf22 <- renderText(input$conf_title22)
  output$results_22 <- renderText(paste(input$rank_list_22, collapse = ', '))
  df_22 <- reactive({
    req(input$rank_list_22)
    plot_data <- colleges %>%
      filter(`Common name` %in% input$rank_list_22)
    plot_data$`Common name` <- factor(plot_data$`Common name`, levels = input$rank_list_22)
    return(plot_data)
  })
  output$scatterplot22 = renderPlot({
    ggplot(df_22(),aes(x=`Common name`, y=dummy, label=`Common name`)) +
      geom_image(aes(image = images),asp=4, size=.28, by = 'height') + theme(axis.line = element_blank(), # Set axis line as black
                                                                             panel.grid.major = element_blank(), # Remove grid
                                                                             panel.grid.minor = element_blank(), # Remove grid
                                                                             panel.border = element_blank(), # Remove grid
                                                                             panel.background = element_blank(), plot.background = element_blank(),
                                                                             axis.text.x=element_blank(),
                                                                             axis.ticks.x=element_blank(),
                                                                             axis.text.y=element_blank(),
                                                                             axis.ticks.y=element_blank()) + labs(x = "",  
                                                                                                                  y = "",
                                                                                                                  title = "",
                                                                                                                  subtitle = "") 
    
  }, width = 1000, height = 250, bg = "transparent"
  
  )
  
  output$conf23 <- renderText(input$conf_title23)
  output$results_23 <- renderText(paste(input$rank_list_23, collapse = ', '))
  df_23 <- reactive({
    req(input$rank_list_23)
    plot_data <- colleges %>%
      filter(`Common name` %in% input$rank_list_23)
    plot_data$`Common name` <- factor(plot_data$`Common name`, levels = input$rank_list_23)
    return(plot_data)
  })
  output$scatterplot23 = renderPlot({
    ggplot(df_23(),aes(x=`Common name`, y=dummy, label=`Common name`)) +
      geom_image(aes(image = images),asp=4, size=.28, by = 'height') + theme(axis.line = element_blank(), # Set axis line as black
                                                                             panel.grid.major = element_blank(), # Remove grid
                                                                             panel.grid.minor = element_blank(), # Remove grid
                                                                             panel.border = element_blank(), # Remove grid
                                                                             panel.background = element_blank(), plot.background = element_blank(),
                                                                             axis.text.x=element_blank(),
                                                                             axis.ticks.x=element_blank(),
                                                                             axis.text.y=element_blank(),
                                                                             axis.ticks.y=element_blank()) + labs(x = "",  
                                                                                                                  y = "",
                                                                                                                  title = "",
                                                                                                                  subtitle = "") 
    
  }, width = 1000, height = 250, bg = "transparent"
  
  )
  
  output$conf24 <- renderText(input$conf_title24)
  output$results_24 <- renderText(paste(input$rank_list_24, collapse = ', '))
  df_24 <- reactive({
    req(input$rank_list_24)
    plot_data <- colleges %>%
      filter(`Common name` %in% input$rank_list_24)
    plot_data$`Common name` <- factor(plot_data$`Common name`, levels = input$rank_list_24)
    return(plot_data)
  })
  output$scatterplot24 = renderPlot({
    ggplot(df_24(),aes(x=`Common name`, y=dummy, label=`Common name`)) +
      geom_image(aes(image = images),asp=4, size=.28, by = 'height') + theme(axis.line = element_blank(), # Set axis line as black
                                                                             panel.grid.major = element_blank(), # Remove grid
                                                                             panel.grid.minor = element_blank(), # Remove grid
                                                                             panel.border = element_blank(), # Remove grid
                                                                             panel.background = element_blank(), plot.background = element_blank(),
                                                                             axis.text.x=element_blank(),
                                                                             axis.ticks.x=element_blank(),
                                                                             axis.text.y=element_blank(),
                                                                             axis.ticks.y=element_blank()) + labs(x = "",  
                                                                                                                  y = "",
                                                                                                                  title = "",
                                                                                                                  subtitle = "") 
    
  }, width = 1000, height = 250, bg = "transparent"
  
  )
  
  output$conf25 <- renderText(input$conf_title25)
  output$results_25 <- renderText(paste(input$rank_list_25, collapse = ', '))
  df_25 <- reactive({
    req(input$rank_list_25)
    plot_data <- colleges %>%
      filter(`Common name` %in% input$rank_list_25)
    plot_data$`Common name` <- factor(plot_data$`Common name`, levels = input$rank_list_25)
    return(plot_data)
  })
  output$scatterplot25 = renderPlot({
    ggplot(df_25(),aes(x=`Common name`, y=dummy, label=`Common name`)) +
      geom_image(aes(image = images),asp=4, size=.28, by = 'height') + theme(axis.line = element_blank(), # Set axis line as black
                                                                             panel.grid.major = element_blank(), # Remove grid
                                                                             panel.grid.minor = element_blank(), # Remove grid
                                                                             panel.border = element_blank(), # Remove grid
                                                                             panel.background = element_blank(), plot.background = element_blank(),
                                                                             axis.text.x=element_blank(),
                                                                             axis.ticks.x=element_blank(),
                                                                             axis.text.y=element_blank(),
                                                                             axis.ticks.y=element_blank()) + labs(x = "",  
                                                                                                                  y = "",
                                                                                                                  title = "",
                                                                                                                  subtitle = "") 
    
  }, width = 1000, height = 250, bg = "transparent"
  
  )
  
  output$conf26 <- renderText(input$conf_title26)
  output$results_26 <- renderText(paste(input$rank_list_26, collapse = ', '))
  df_26 <- reactive({
    req(input$rank_list_26)
    plot_data <- colleges %>%
      filter(`Common name` %in% input$rank_list_26)
    plot_data$`Common name` <- factor(plot_data$`Common name`, levels = input$rank_list_26)
    return(plot_data)
  })
  output$scatterplot26 = renderPlot({
    ggplot(df_26(),aes(x=`Common name`, y=dummy, label=`Common name`)) +
      geom_image(aes(image = images),asp=4, size=.28, by = 'height') + theme(axis.line = element_blank(), # Set axis line as black
                                                                             panel.grid.major = element_blank(), # Remove grid
                                                                             panel.grid.minor = element_blank(), # Remove grid
                                                                             panel.border = element_blank(), # Remove grid
                                                                             panel.background = element_blank(), plot.background = element_blank(),
                                                                             axis.text.x=element_blank(),
                                                                             axis.ticks.x=element_blank(),
                                                                             axis.text.y=element_blank(),
                                                                             axis.ticks.y=element_blank()) + labs(x = "",  
                                                                                                                  y = "",
                                                                                                                  title = "",
                                                                                                                  subtitle = "") 
    
  }, width = 1000, height = 250, bg = "transparent"
  
  )
  
  output$conf27 <- renderText(input$conf_title27)
  output$results_27 <- renderText(paste(input$rank_list_27, collapse = ', '))
  df_27 <- reactive({
    req(input$rank_list_27)
    plot_data <- colleges %>%
      filter(`Common name` %in% input$rank_list_27)
    plot_data$`Common name` <- factor(plot_data$`Common name`, levels = input$rank_list_27)
    return(plot_data)
  })
  output$scatterplot27 = renderPlot({
    ggplot(df_27(),aes(x=`Common name`, y=dummy, label=`Common name`)) +
      geom_image(aes(image = images),asp=4, size=.28, by = 'height') + theme(axis.line = element_blank(), # Set axis line as black
                                                                             panel.grid.major = element_blank(), # Remove grid
                                                                             panel.grid.minor = element_blank(), # Remove grid
                                                                             panel.border = element_blank(), # Remove grid
                                                                             panel.background = element_blank(), plot.background = element_blank(),
                                                                             axis.text.x=element_blank(),
                                                                             axis.ticks.x=element_blank(),
                                                                             axis.text.y=element_blank(),
                                                                             axis.ticks.y=element_blank()) + labs(x = "",  
                                                                                                                  y = "",
                                                                                                                  title = "",
                                                                                                                  subtitle = "") 
    
  }, width = 1000, height = 250, bg = "transparent"
  
  )
  
  output$conf28 <- renderText(input$conf_title28)
  output$results_28 <- renderText(paste(input$rank_list_28, collapse = ', '))
  df_28 <- reactive({
    req(input$rank_list_28)
    plot_data <- colleges %>%
      filter(`Common name` %in% input$rank_list_28)
    plot_data$`Common name` <- factor(plot_data$`Common name`, levels = input$rank_list_28)
    return(plot_data)
  })
  output$scatterplot28 = renderPlot({
    ggplot(df_28(),aes(x=`Common name`, y=dummy, label=`Common name`)) +
      geom_image(aes(image = images),asp=4, size=.28, by = 'height') + theme(axis.line = element_blank(), # Set axis line as black
                                                                             panel.grid.major = element_blank(), # Remove grid
                                                                             panel.grid.minor = element_blank(), # Remove grid
                                                                             panel.border = element_blank(), # Remove grid
                                                                             panel.background = element_blank(), plot.background = element_blank(),
                                                                             axis.text.x=element_blank(),
                                                                             axis.ticks.x=element_blank(),
                                                                             axis.text.y=element_blank(),
                                                                             axis.ticks.y=element_blank()) + labs(x = "",  
                                                                                                                  y = "",
                                                                                                                  title = "",
                                                                                                                  subtitle = "") 
    
  }, width = 1000, height = 250, bg = "transparent"
  
  )
  
  output$conf29 <- renderText(input$conf_title29)
  output$results_29 <- renderText(paste(input$rank_list_29, collapse = ', '))
  df_29 <- reactive({
    req(input$rank_list_29)
    plot_data <- colleges %>%
      filter(`Common name` %in% input$rank_list_29)
    plot_data$`Common name` <- factor(plot_data$`Common name`, levels = input$rank_list_29)
    return(plot_data)
  })
  output$scatterplot29 = renderPlot({
    ggplot(df_29(),aes(x=`Common name`, y=dummy, label=`Common name`)) +
      geom_image(aes(image = images),asp=4, size=.28, by = 'height') + theme(axis.line = element_blank(), # Set axis line as black
                                                                             panel.grid.major = element_blank(), # Remove grid
                                                                             panel.grid.minor = element_blank(), # Remove grid
                                                                             panel.border = element_blank(), # Remove grid
                                                                             panel.background = element_blank(), plot.background = element_blank(),
                                                                             axis.text.x=element_blank(),
                                                                             axis.ticks.x=element_blank(),
                                                                             axis.text.y=element_blank(),
                                                                             axis.ticks.y=element_blank()) + labs(x = "",  
                                                                                                                  y = "",
                                                                                                                  title = "",
                                                                                                                  subtitle = "") 
    
  }, width = 1000, height = 250, bg = "transparent"
  
  )
  
  output$conf30 <- renderText(input$conf_title30)
  output$results_30 <- renderText(paste(input$rank_list_30, collapse = ', '))
  df_30 <- reactive({
    req(input$rank_list_30)
    plot_data <- colleges %>%
      filter(`Common name` %in% input$rank_list_30)
    plot_data$`Common name` <- factor(plot_data$`Common name`, levels = input$rank_list_30)
    return(plot_data)
  })
  output$scatterplot30 = renderPlot({
    ggplot(df_30(),aes(x=`Common name`, y=dummy, label=`Common name`)) +
      geom_image(aes(image = images),asp=4, size=.28, by = 'height') + theme(axis.line = element_blank(), # Set axis line as black
                                                                             panel.grid.major = element_blank(), # Remove grid
                                                                             panel.grid.minor = element_blank(), # Remove grid
                                                                             panel.border = element_blank(), # Remove grid
                                                                             panel.background = element_blank(), plot.background = element_blank(),
                                                                             axis.text.x=element_blank(),
                                                                             axis.ticks.x=element_blank(),
                                                                             axis.text.y=element_blank(),
                                                                             axis.ticks.y=element_blank()) + labs(x = "",  
                                                                                                                  y = "",
                                                                                                                  title = "",
                                                                                                                  subtitle = "") 
    
  }, width = 1000, height = 250, bg = "transparent"
  
  )
  
  output$conf31 <- renderText(input$conf_title31)
  output$results_31 <- renderText(paste(input$rank_list_31, collapse = ', '))
  df_31 <- reactive({
    req(input$rank_list_31)
    plot_data <- colleges %>%
      filter(`Common name` %in% input$rank_list_31)
    plot_data$`Common name` <- factor(plot_data$`Common name`, levels = input$rank_list_31)
    return(plot_data)
  })
  output$scatterplot31 = renderPlot({
    ggplot(df_31(),aes(x=`Common name`, y=dummy, label=`Common name`)) +
      geom_image(aes(image = images),asp=4, size=.28, by = 'height') + theme(axis.line = element_blank(), # Set axis line as black
                                                                             panel.grid.major = element_blank(), # Remove grid
                                                                             panel.grid.minor = element_blank(), # Remove grid
                                                                             panel.border = element_blank(), # Remove grid
                                                                             panel.background = element_blank(), plot.background = element_blank(),
                                                                             axis.text.x=element_blank(),
                                                                             axis.ticks.x=element_blank(),
                                                                             axis.text.y=element_blank(),
                                                                             axis.ticks.y=element_blank()) + labs(x = "",  
                                                                                                                  y = "",
                                                                                                                  title = "",
                                                                                                                  subtitle = "") 
    
  }, width = 1000, height = 250, bg = "transparent"
  
  )
  
  output$conf32 <- renderText(input$conf_title32)
  output$results_32 <- renderText(paste(input$rank_list_32, collapse = ', '))
  df_32 <- reactive({
    req(input$rank_list_32)
    plot_data <- colleges %>%
      filter(`Common name` %in% input$rank_list_32)
    plot_data$`Common name` <- factor(plot_data$`Common name`, levels = input$rank_list_32)
    return(plot_data)
  })
  output$scatterplot32 = renderPlot({
    ggplot(df_32(),aes(x=`Common name`, y=dummy, label=`Common name`)) +
      geom_image(aes(image = images),asp=4, size=.28, by = 'height') + theme(axis.line = element_blank(), # Set axis line as black
                                                                             panel.grid.major = element_blank(), # Remove grid
                                                                             panel.grid.minor = element_blank(), # Remove grid
                                                                             panel.border = element_blank(), # Remove grid
                                                                             panel.background = element_blank(), plot.background = element_blank(),
                                                                             axis.text.x=element_blank(),
                                                                             axis.ticks.x=element_blank(),
                                                                             axis.text.y=element_blank(),
                                                                             axis.ticks.y=element_blank()) + labs(x = "",  
                                                                                                                  y = "",
                                                                                                                  title = "",
                                                                                                                  subtitle = "") 
    
  }, width = 1000, height = 250, bg = "transparent"
  
  )
  
  output$map <- renderLeaflet({
    labels <- sprintf(
      "<strong>%s</strong><br/>%s",
      filtered_team()$`Common name`, filtered_team()$NewConference
    ) %>% lapply(htmltools::HTML)
    palette <- colorFactor(rainbow(32), filtered_team()$NewConference)
    leafletProxy("map", data = filtered_team()) %>% 
      clearShapes() %>%
      clearMarkers()%>%
      addCircleMarkers( #color = input$radio, 
        ~lon, 
        ~lat,
        color = ~palette(NewConference),
        label = labels, 
        labelOptions = labelOptions(
          style = list("font-weight" = "normal", padding = "3px 8px"),
          textsize = "15px",
          direction = "auto"),
        radius = 10,
        opacity = 1)
    leaflet()%>%
              setView(lat = 37.5, lng = -97.5795, zoom = 4) %>%
              addProviderTiles("Stamen.TonerBackground",
                               options = providerTileOptions(noWrap = TRUE)
              )
            
  })
  
  
  final_conf_algnmnt <- reactive({
    plot_data <- colleges %>%
      mutate(NewConference = ifelse(`Common name` %in% input$rank_list_1, input$conf_title1,
                                    ifelse(`Common name` %in% input$rank_list_2, input$conf_title2,
                                           ifelse(`Common name` %in% input$rank_list_3, input$conf_title3,
                                                  ifelse(`Common name` %in% input$rank_list_4, input$conf_title4,
                                                         ifelse(`Common name` %in% input$rank_list_5, input$conf_title5,
                                                                ifelse(`Common name` %in% input$rank_list_6, input$conf_title6,
                                                                       ifelse(`Common name` %in% input$rank_list_7, input$conf_title7,
                                                                              ifelse(`Common name` %in% input$rank_list_8, input$conf_title8,
                                                                                     ifelse(`Common name` %in% input$rank_list_9, input$conf_title9,
                                                                                            ifelse(`Common name` %in% input$rank_list_10, input$conf_title10,
                                                                                                   ifelse(`Common name` %in% input$rank_list_11, input$conf_title11,
                                                                                                          ifelse(`Common name` %in% input$rank_list_12, input$conf_title12,
                                                                                                                 ifelse(`Common name` %in% input$rank_list_13, input$conf_title13,
                                                                                                                        ifelse(`Common name` %in% input$rank_list_14, input$conf_title14,
                                                                                                                               ifelse(`Common name` %in% input$rank_list_15, input$conf_title15,
                                                                                                                                      ifelse(`Common name` %in% input$rank_list_16, input$conf_title16,
                                                                                                                                             ifelse(`Common name` %in% input$rank_list_17, input$conf_title17,
                                                                                                                                                    ifelse(`Common name` %in% input$rank_list_18, input$conf_title18,
                                                                                                                                                           ifelse(`Common name` %in% input$rank_list_19, input$conf_title19,
                                                                                                                                                                  ifelse(`Common name` %in% input$rank_list_20, input$conf_title20,
                                                                                                                                                                         ifelse(`Common name` %in% input$rank_list_21, input$conf_title21,
                                                                                                                                                                                ifelse(`Common name` %in% input$rank_list_22, input$conf_title22,
                                                                                                                                                                                       ifelse(`Common name` %in% input$rank_list_23, input$conf_title23,
                                                                                                                                                                                              ifelse(`Common name` %in% input$rank_list_24, input$conf_title24,
                                                                                                                                                                                                     ifelse(`Common name` %in% input$rank_list_25, input$conf_title25,
                                                                                                                                                                                                            ifelse(`Common name` %in% input$rank_list_26, input$conf_title26,
                                                                                                                                                                                                                   ifelse(`Common name` %in% input$rank_list_27, input$conf_title27,
                                                                                                                                                                                                                          ifelse(`Common name` %in% input$rank_list_28, input$conf_title28,
                                                                                                                                                                                                                                 ifelse(`Common name` %in% input$rank_list_29, input$conf_title29,
                                                                                                                                                                                                                                        ifelse(`Common name` %in% input$rank_list_30, input$conf_title30,
                                                                                                                                                                                                                                               ifelse(`Common name` %in% input$rank_list_31, input$conf_title31,
                                                                                                                                                                                                                                                      ifelse(`Common name` %in% input$rank_list_32, input$conf_title32, `Primary conference` 
                                                                                                                                                                                                                                                      )))))))))))))))))))))))))))))))))%>%
      mutate(NewConference = as.factor(NewConference)) %>%
      group_by(NewConference) %>%
      select(NewConference, `Common name`)%>%
      rename(Conference = NewConference)%>%
      rename(Name = `Common name`) %>%
      group_by(Conference) %>%
      mutate(row = row_number()) %>%
      tidyr::pivot_wider(names_from = Conference, values_from = Name) %>%
      select(-row) 
    return(plot_data)
    
  })
  
  filtered_team0 <- reactive({
    plot_data <- colleges %>%
      mutate(NewConference = ifelse(`Common name` %in% input$rank_list_1, input$conf_title1,
                                    ifelse(`Common name` %in% input$rank_list_2, input$conf_title2,
                                           ifelse(`Common name` %in% input$rank_list_3, input$conf_title3,
                                                  ifelse(`Common name` %in% input$rank_list_4, input$conf_title4,
                                                         ifelse(`Common name` %in% input$rank_list_5, input$conf_title5,
                                                                ifelse(`Common name` %in% input$rank_list_6, input$conf_title6,
                                                                       ifelse(`Common name` %in% input$rank_list_7, input$conf_title7,
                                                                              ifelse(`Common name` %in% input$rank_list_8, input$conf_title8,
                                                                                     ifelse(`Common name` %in% input$rank_list_9, input$conf_title9,
                                                                                            ifelse(`Common name` %in% input$rank_list_10, input$conf_title10,
                                                                                                   ifelse(`Common name` %in% input$rank_list_11, input$conf_title11,
                                                                                                          ifelse(`Common name` %in% input$rank_list_12, input$conf_title12,
                                                                                                                 ifelse(`Common name` %in% input$rank_list_13, input$conf_title13,
                                                                                                                        ifelse(`Common name` %in% input$rank_list_14, input$conf_title14,
                                                                                                                               ifelse(`Common name` %in% input$rank_list_15, input$conf_title15,
                                                                                                                                      ifelse(`Common name` %in% input$rank_list_16, input$conf_title16,
                                                                                                                                             ifelse(`Common name` %in% input$rank_list_17, input$conf_title17,
                                                                                                                                                    ifelse(`Common name` %in% input$rank_list_18, input$conf_title18,
                                                                                                                                                           ifelse(`Common name` %in% input$rank_list_19, input$conf_title19,
                                                                                                                                                                  ifelse(`Common name` %in% input$rank_list_20, input$conf_title20,
                                                                                                                                                                         ifelse(`Common name` %in% input$rank_list_21, input$conf_title21,
                                                                                                                                                                                ifelse(`Common name` %in% input$rank_list_22, input$conf_title22,
                                                                                                                                                                                       ifelse(`Common name` %in% input$rank_list_23, input$conf_title23,
                                                                                                                                                                                              ifelse(`Common name` %in% input$rank_list_24, input$conf_title24,
                                                                                                                                                                                                     ifelse(`Common name` %in% input$rank_list_25, input$conf_title25,
                                                                                                                                                                                                            ifelse(`Common name` %in% input$rank_list_26, input$conf_title26,
                                                                                                                                                                                                                   ifelse(`Common name` %in% input$rank_list_27, input$conf_title27,
                                                                                                                                                                                                                          ifelse(`Common name` %in% input$rank_list_28, input$conf_title28,
                                                                                                                                                                                                                                 ifelse(`Common name` %in% input$rank_list_29, input$conf_title29,
                                                                                                                                                                                                                                        ifelse(`Common name` %in% input$rank_list_30, input$conf_title30,
                                                                                                                                                                                                                                               ifelse(`Common name` %in% input$rank_list_31, input$conf_title31,
                                                                                                                                                                                                                                                      ifelse(`Common name` %in% input$rank_list_32, input$conf_title32, `Primary conference` 
                                                                                                                                                                                                                                                      )))))))))))))))))))))))))))))))))%>%
      mutate(NewConference = as.factor(NewConference))
  })
  
  filtered_team <- reactive({
    subset(filtered_team0(), NewConference %in% input$filter)
  })
  
  output$filter = renderUI({
    selectInput("filter", shiny::HTML("<h5><b>Select Conference(s): <span style='color: white'></span></b></h5>"), choices = c(names(final_conf_algnmnt())), multiple = TRUE, selected = names(final_conf_algnmnt()[1]), width = "100%"
                
    )
  })
  
  
  output$dtable <- renderDataTable({
    DT::datatable(final_conf_algnmnt(), options = list(
      paging = FALSE,
      searching = FALSE,
      initComplete = JS(
        "function(settings, json) {",
        "$(this.api().table().header()).css({'background-color': '#517fb9', 'color': '#fff'});",
        "}"
      ),
      columnDefs = list(list(targets = 2, width = '900px')),
      scrollX = TRUE
      )
      ) %>%
      formatStyle(0, target = 'row', lineHeight = '88%')
      
    }
  )
  
  output$download <- downloadHandler(
    filename = function(){"ConferenceRealignment.csv"}, 
    content = function(fname){
      write.csv(final_conf_algnmnt(), fname)
    }
  )
  

})

