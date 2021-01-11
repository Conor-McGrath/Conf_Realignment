library(leaflet)

shinyUI(function(request){(fluidPage(setBackgroundImage(
  src = "ncaa_background.png"
), tags$style(HTML('
body > div > div.shinysky-busy-indicator {
  background-color: #ffffff;
}
body > div > div.shinysky-busy-indicator > img {
  height: 60px;
  width: 60px;
  z-index: 1000;
}
body > div > div.shinysky-busy-indicator > p {
  font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
  font-size: 15px;
  font-weight: 600;
  color: #0C2340;
}'
)),
  (navbarPage("NCAA Division 1 Conference Realignment", id = "myNavbarPage", theme = shinytheme("yeti"),
              tabPanel("Home", 
                       mainPanel(
                         includeHTML("home_html/home.Rhtml")
                       )),
                 tabPanel("Data", 
                 tags$style(HTML(".dataTables_wrapper .dataTables_info {
            color: #ffffff !important;
        }")), 
                 div(DTOutput("colleges"))),
                 tabPanel("Realignment", 
                          tags$head(tags$style(HTML('
   textArea {
     background-color: #517fb9 !important;
     color: #ffffff !important;
     border: none;
     text-align: center;
     font-weight: bold;
   }'))),
                          fluidRow(column(3, fluidRow(column(3,
                                                             textAreaInput(inputId = "conf_title1", 
                                                                       label = "", 
                                                                       width = "149px",
                                                                       height = "80px",
                                                                       placeholder = "Change Conference Name",
                                                                       value = names(confs)[1])),
                                                      column(3,
                                                             textAreaInput(inputId = "conf_title2", 
                                                                       label = "", 
                                                                       width = "149px",
                                                                       height = "80px",
                                                                       placeholder = "Change Conference Name",
                                                                       value = names(confs)[2])),
                                                      column(3,
                                                             textAreaInput(inputId = "conf_title3", 
                                                                       label = "",
                                                                       width = "149px",
                                                                       height = "80px",
                                                                       placeholder = "Change Conference Name",
                                                                       value = names(confs)[3])),
                                                      column(3,
                                                             textAreaInput(inputId = "conf_title4", 
                                                                       label = "", 
                                                                       width = "149px",
                                                                       height = "80px",
                                                                       placeholder = "Change Conference Name",
                                                                       value = names(confs)[4])))),
                                   column(3, fluidRow(column(3,
                                                             textAreaInput(inputId = "conf_title5", 
                                                                       label = "", 
                                                                       width = "149px",
                                                                       height = "80px",
                                                                       placeholder = "Change Conference Name",
                                                                       value = names(confs)[5])),
                                                      column(3,
                                                             textAreaInput(inputId = "conf_title6", 
                                                                       label = "", 
                                                                       width = "149px",
                                                                       height = "80px",
                                                                       placeholder = "Change Conference Name",
                                                                       value = names(confs)[6])),
                                                      column(3,
                                                             textAreaInput(inputId = "conf_title7", 
                                                                       label = "", 
                                                                       width = "149px",
                                                                       height = "80px",
                                                                       placeholder = "Change Conference Name",
                                                                       value = names(confs)[7])),
                                                      column(3,
                                                             textAreaInput(inputId = "conf_title8", 
                                                                       label = "", 
                                                                       width = "149px",
                                                                       height = "80px",
                                                                       placeholder = "Change Conference Name",
                                                                       value = names(confs)[8])))),
                                   column(3, fluidRow(column(3,
                                                             textAreaInput(inputId = "conf_title9", 
                                                                       label = "", 
                                                                       width = "149px",
                                                                       height = "80px",
                                                                       placeholder = "Change Conference Name",
                                                                       value = names(confs)[9])),
                                                      column(3,
                                                             textAreaInput(inputId = "conf_title10", 
                                                                       label = "", 
                                                                       width = "149px",
                                                                       height = "80px",
                                                                       placeholder = "Change Conference Name",
                                                                       value = names(confs)[10])),
                                                      column(3,
                                                             textAreaInput(inputId = "conf_title11", 
                                                                       label = "", 
                                                                       width = "149px",
                                                                       height = "80px",
                                                                       placeholder = "Change Conference Name",
                                                                       value = names(confs)[11])),
                                                      column(3,
                                                             textAreaInput(inputId = "conf_title12", 
                                                                       label = "", 
                                                                       width = "149px",
                                                                       height = "80px",
                                                                       placeholder = "Change Conference Name",
                                                                       value = names(confs)[12])))),
                                   column(3, fluidRow(column(3,
                                                             textAreaInput(inputId = "conf_title13", 
                                                                       label = "", 
                                                                       width = "149px",
                                                                       height = "80px",
                                                                       placeholder = "Change Conference Name",
                                                                       value = names(confs)[13])),
                                                      column(3,
                                                             textAreaInput(inputId = "conf_title14", 
                                                                       label = "", 
                                                                       width = "149px",
                                                                       height = "80px",
                                                                       placeholder = "Change Conference Name",
                                                                       value = names(confs)[14])),
                                                      column(3,
                                                             textAreaInput(inputId = "conf_title15", 
                                                                       label = "", 
                                                                       width = "149px",
                                                                       height = "80px",
                                                                       placeholder = "Change Conference Name",
                                                                       value = names(confs)[15])),
                                                      column(3,
                                                             textAreaInput(inputId = "conf_title16", 
                                                                       label = "", 
                                                                       width = "149px",
                                                                       height = "80px",
                                                                       placeholder = "Change Conference Name",
                                                                       value = names(confs)[16]))))),
                          fluidRow(column(3,fluidRow(column(3,
                                                            rank_list(text = "",
                                                                      labels = confs[[1]][!is.na(confs[[1]])],
                                                                      input_id = "rank_list_1", options = sortable_options(group = "mygroup", multiDrag = TRUE), class = c("default-sortable", "custom-sortable") )),
                                                     column(3,
                                                            rank_list(text = "",
                                                                      labels = confs[[2]][!is.na(confs[[2]])],
                                                                      input_id = "rank_list_2", options = sortable_options(group = "mygroup", multiDrag = TRUE), class = c("default-sortable", "custom-sortable") )),
                                                     column(3,
                                                            rank_list(text = "",
                                                                      labels = confs[[3]][!is.na(confs[[3]])],
                                                                      input_id = "rank_list_3", options = sortable_options(group = "mygroup", multiDrag = TRUE), class = c("default-sortable", "custom-sortable") )),
                                                     column(3,
                                                            rank_list(text = "",
                                                                      labels = confs[[4]][!is.na(confs[[4]])],
                                                                      input_id = "rank_list_4", options = sortable_options(group = "mygroup", multiDrag = TRUE), class = c("default-sortable", "custom-sortable") )))),
                                   column(3,fluidRow(column(3,
                                                            rank_list(text = "",
                                                                      labels = confs[[5]][!is.na(confs[[5]])],
                                                                      input_id = "rank_list_5", options = sortable_options(group = "mygroup", multiDrag = TRUE), class = c("default-sortable", "custom-sortable") )),
                                                     column(3,
                                                            rank_list(text = "",
                                                                      labels = confs[[6]][!is.na(confs[[6]])],
                                                                      input_id = "rank_list_6", options = sortable_options(group = "mygroup", multiDrag = TRUE), class = c("default-sortable", "custom-sortable") )),
                                                     column(3,
                                                            rank_list(text = "",
                                                                      labels = confs[[7]][!is.na(confs[[7]])],
                                                                      input_id = "rank_list_7", options = sortable_options(group = "mygroup", multiDrag = TRUE), class = c("default-sortable", "custom-sortable") )),
                                                     column(3,
                                                            rank_list(text = "",
                                                                      labels = confs[[8]][!is.na(confs[[8]])],
                                                                      input_id = "rank_list_8", options = sortable_options(group = "mygroup", multiDrag = TRUE), class = c("default-sortable", "custom-sortable") )))),
                                   column(3, fluidRow(column(3, 
                                                             rank_list(text = "",
                                                                       labels = confs[[9]][!is.na(confs[[9]])],
                                                                       input_id = "rank_list_9", options = sortable_options(group = "mygroup", multiDrag = TRUE), class = c("default-sortable", "custom-sortable") )),
                                                      column(3,
                                                             rank_list(text = "",
                                                                       labels = confs[[10]][!is.na(confs[[10]])],
                                                                       input_id = "rank_list_10", options = sortable_options(group = "mygroup", multiDrag = TRUE), class = c("default-sortable", "custom-sortable") )),
                                                      column(3,
                                                             rank_list(text = "",
                                                                       labels = confs[[11]][!is.na(confs[[11]])],
                                                                       input_id = "rank_list_11", options = sortable_options(group = "mygroup", multiDrag = TRUE), class = c("default-sortable", "custom-sortable") )),
                                                      column(3,
                                                             rank_list(text = "",
                                                                       labels = confs[[12]][!is.na(confs[[12]])],
                                                                       input_id = "rank_list_12", options = sortable_options(group = "mygroup", multiDrag = TRUE), class = c("default-sortable", "custom-sortable") )))),
                                   column(3, fluidRow(column(3, 
                                                             rank_list(text = "",
                                                                       labels = confs[[13]][!is.na(confs[[13]])],
                                                                       input_id = "rank_list_13", options = sortable_options(group = "mygroup", multiDrag = TRUE), class = c("default-sortable", "custom-sortable") )),
                                                      column(3,
                                                             rank_list(text = "",
                                                                       labels = confs[[14]][!is.na(confs[[14]])],
                                                                       input_id = "rank_list_14", options = sortable_options(group = "mygroup", multiDrag = TRUE), class = c("default-sortable", "custom-sortable") )),
                                                      column(3,
                                                             rank_list(text = "",
                                                                       labels = confs[[15]][!is.na(confs[[15]])],
                                                                       input_id = "rank_list_15", options = sortable_options(group = "mygroup", multiDrag = TRUE), class = c("default-sortable", "custom-sortable") )),
                                                      column(3,
                                                             rank_list(text = "",
                                                                       labels = confs[[16]][!is.na(confs[[16]])],
                                                                       input_id = "rank_list_16", options = sortable_options(group = "mygroup", multiDrag = TRUE), class = c("default-sortable", "custom-sortable") ))))),
                          fluidRow(column(3, fluidRow(column(3,
                                                             textAreaInput(inputId = "conf_title17", 
                                                                       label = "", 
                                                                       width = "149px",
                                                                       height = "80px",
                                                                       placeholder = "Change Conference Name",
                                                                       value = names(confs)[17])),
                                                      column(3,
                                                             textAreaInput(inputId = "conf_title18", 
                                                                       label = "", 
                                                                       width = "149px",
                                                                       height = "80px",
                                                                       placeholder = "Change Conference Name",
                                                                       value = names(confs)[18])),
                                                      column(3,
                                                             textAreaInput(inputId = "conf_title19", 
                                                                       label = "", 
                                                                       width = "149px",
                                                                       height = "80px",
                                                                       placeholder = "Change Conference Name",
                                                                       value = names(confs)[19])),
                                                      column(3,
                                                             textAreaInput(inputId = "conf_title20", 
                                                                       label = "", 
                                                                       width = "149px",
                                                                       height = "80px",
                                                                       placeholder = "Change Conference Name",
                                                                       value = names(confs)[20])))),
                                   column(3, fluidRow(column(3,
                                                             textAreaInput(inputId = "conf_title21", 
                                                                       label = "", 
                                                                       width = "149px",
                                                                       height = "80px",
                                                                       placeholder = "Change Conference Name",
                                                                       value = names(confs)[21])),
                                                      column(3,
                                                             textAreaInput(inputId = "conf_title22", 
                                                                       label = "", 
                                                                       width = "149px",
                                                                       height = "80px",
                                                                       placeholder = "Change Conference Name",
                                                                       value = names(confs)[22])),
                                                      column(3,
                                                             textAreaInput(inputId = "conf_title23", 
                                                                       label = "", 
                                                                       width = "149px",
                                                                       height = "80px",
                                                                       placeholder = "Change Conference Name",
                                                                       value = names(confs)[23])),
                                                      column(3,
                                                             textAreaInput(inputId = "conf_title24", 
                                                                       label = "", 
                                                                       width = "149px",
                                                                       height = "80px",
                                                                       placeholder = "Change Conference Name",
                                                                       value = names(confs)[24])))),
                                   column(3, fluidRow(column(3,
                                                             textAreaInput(inputId = "conf_title25", 
                                                                       label = "", 
                                                                       width = "149px",
                                                                       height = "80px",
                                                                       placeholder = "Change Conference Name",
                                                                       value = names(confs)[25])),
                                                      column(3,
                                                             textAreaInput(inputId = "conf_title26", 
                                                                       label = "", 
                                                                       width = "149px",
                                                                       height = "80px",
                                                                       placeholder = "Change Conference Name",
                                                                       value = names(confs)[26])),
                                                      column(3,
                                                             textAreaInput(inputId = "conf_title27", 
                                                                       label = "", 
                                                                       width = "149px",
                                                                       height = "80px",
                                                                       placeholder = "Change Conference Name",
                                                                       value = names(confs)[27])),
                                                      column(3,
                                                             textAreaInput(inputId = "conf_title28", 
                                                                       label = "", 
                                                                       width = "149px",
                                                                       height = "80px",
                                                                       placeholder = "Change Conference Name",
                                                                       value = names(confs)[28])))),
                                   column(3, fluidRow(column(3, 
                                                             textAreaInput(inputId = "conf_title29", 
                                                                       label = "", 
                                                                       width = "149px",
                                                                       height = "80px",
                                                                       placeholder = "Change Conference Name",
                                                                       value = names(confs)[29])),
                                                      column(3,
                                                             textAreaInput(inputId = "conf_title30", 
                                                                       label = "", 
                                                                       width = "149px",
                                                                       height = "80px",
                                                                       placeholder = "Change Conference Name",
                                                                       value = names(confs)[30])),
                                                      column(3,
                                                             textAreaInput(inputId = "conf_title31",
                                                                       label = "", 
                                                                       width = "149px",
                                                                       height = "80px",
                                                                       placeholder = "Change Conference Name",
                                                                       value = names(confs)[31])),
                                                      column(3,
                                                             textAreaInput(inputId = "conf_title32", 
                                                                       label = "", 
                                                                       width = "149px",
                                                                       height = "80px",
                                                                       placeholder = "Change Conference Name",
                                                                       value = names(confs)[32]))))),
                          fluidRow(column(3,fluidRow(column(3,
                                                            rank_list(text = "",
                                                                      labels = confs[[17]][!is.na(confs[[17]])],
                                                                      input_id = "rank_list_17", options = sortable_options(group = "mygroup", multiDrag = TRUE), class = c("default-sortable", "custom-sortable") )),
                                                     column(3,
                                                            rank_list(text = "",
                                                                      labels = confs[[18]][!is.na(confs[[18]])],
                                                                      input_id = "rank_list_18", options = sortable_options(group = "mygroup", multiDrag = TRUE), class = c("default-sortable", "custom-sortable") )),
                                                     column(3,
                                                            rank_list(text = "",
                                                                      labels = confs[[19]][!is.na(confs[[19]])],
                                                                      input_id = "rank_list_19", options = sortable_options(group = "mygroup", multiDrag = TRUE), class = c("default-sortable", "custom-sortable") )),
                                                     column(3,
                                                            rank_list(text = "",
                                                                      labels = confs[[20]][!is.na(confs[[20]])],
                                                                      input_id = "rank_list_20", options = sortable_options(group = "mygroup", multiDrag = TRUE), class = c("default-sortable", "custom-sortable") )))),
                                   column(3,fluidRow(column(3,
                                                            rank_list(text = "",
                                                                      labels = confs[[21]][!is.na(confs[[21]])],
                                                                      input_id = "rank_list_21", options = sortable_options(group = "mygroup", multiDrag = TRUE), class = c("default-sortable", "custom-sortable") )),
                                                     column(3,
                                                            rank_list(text = "",
                                                                      labels = confs[[22]][!is.na(confs[[22]])],
                                                                      input_id = "rank_list_22", options = sortable_options(group = "mygroup", multiDrag = TRUE), class = c("default-sortable", "custom-sortable") )),
                                                     column(3,
                                                            rank_list(text = "",
                                                                      labels = confs[[23]][!is.na(confs[[23]])],
                                                                      input_id = "rank_list_23", options = sortable_options(group = "mygroup", multiDrag = TRUE), class = c("default-sortable", "custom-sortable") )),
                                                     column(3,
                                                            rank_list(text = "",
                                                                      labels = confs[[24]][!is.na(confs[[24]])],
                                                                      input_id = "rank_list_24", options = sortable_options(group = "mygroup", multiDrag = TRUE), class = c("default-sortable", "custom-sortable") )))),
                                   column(3, fluidRow(column(3, 
                                                             rank_list(text = "",
                                                                       labels = confs[[25]][!is.na(confs[[25]])],
                                                                       input_id = "rank_list_25", options = sortable_options(group = "mygroup", multiDrag = TRUE), class = c("default-sortable", "custom-sortable") )),
                                                      column(3,
                                                             rank_list(text = "",
                                                                       labels = confs[[26]][!is.na(confs[[26]])],
                                                                       input_id = "rank_list_26", options = sortable_options(group = "mygroup", multiDrag = TRUE), class = c("default-sortable", "custom-sortable") )),
                                                      column(3,
                                                             rank_list(text = "",
                                                                       labels = confs[[27]][!is.na(confs[[27]])],
                                                                       input_id = "rank_list_27", options = sortable_options(group = "mygroup", multiDrag = TRUE), class = c("default-sortable", "custom-sortable") )),
                                                      column(3,
                                                             rank_list(text = "",
                                                                       labels = confs[[28]][!is.na(confs[[28]])],
                                                                       input_id = "rank_list_28", options = sortable_options(group = "mygroup", multiDrag = TRUE), class = c("default-sortable", "custom-sortable") )))),
                                   column(3, fluidRow(column(3, 
                                                             rank_list(text = "",
                                                                       labels = confs[[29]][!is.na(confs[[29]])],
                                                                       input_id = "rank_list_29", options = sortable_options(group = "mygroup", multiDrag = TRUE), class = c("default-sortable", "custom-sortable") )),
                                                      column(3,
                                                             rank_list(text = "",
                                                                       labels = confs[[30]][!is.na(confs[[30]])],
                                                                       input_id = "rank_list_30", options = sortable_options(group = "mygroup", multiDrag = TRUE), class = c("default-sortable", "custom-sortable") )),
                                                      column(3,
                                                             rank_list(text = "",
                                                                       labels = confs[[31]][!is.na(confs[[31]])],
                                                                       input_id = "rank_list_31", options = sortable_options(group = "mygroup", multiDrag = TRUE), class = c("default-sortable", "custom-sortable") )),
                                                      column(3,
                                                             rank_list(text = "",
                                                                       labels = confs[[32]][!is.na(confs[[32]])],
                                                                       input_id = "rank_list_32", options = sortable_options(group = "mygroup", multiDrag = TRUE), class = c("default-sortable", "custom-sortable") )))))
                          
                          
                          
                          
                          
                          
                          , style = 'width:2350px;', 
                          tags$style(
                            HTML("
          .rank-list-container.custom-sortable {
            width: 150px;
            border: none;
      
          }"))),
                 tabPanel("Output",   align = "center",
                          tags$style(HTML('
                            #conf1 {
                            background-color: #517fb9 !important;
                            color: #ffffff !important;
                            opacity: 0.9;
                              font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            font-size: 24px;
                            font-weight: bold;
                            }
                            #conf2 {
                            background-color: #517fb9 !important;
                            color: #ffffff !important;
                            opacity: 0.9;
                              font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            font-size: 24px;
                            font-weight: bold;
                            }
                            #conf3 {
                            background-color: #517fb9 !important;
                            color: #ffffff !important;
                            opacity: 0.9;
                              font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            font-size: 24px;
                            font-weight: bold;
                            }
                            #conf4 {
                            background-color: #517fb9 !important;
                            color: #ffffff !important;
                            opacity: 0.9;
                              font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            font-size: 24px;
                            font-weight: bold;
                            }
                            #conf5 {
                            background-color: #517fb9 !important;
                            color: #ffffff !important;
                            opacity: 0.9;
                              font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            font-size: 24px;
                            font-weight: bold;
                            }
                            #conf6 {
                            background-color: #517fb9 !important;
                            color: #ffffff !important;
                            opacity: 0.9;
                              font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            font-size: 24px;
                            font-weight: bold;
                            }
                            #conf7 {
                            background-color: #517fb9 !important;
                            color: #ffffff !important;
                            opacity: 0.9;
                              font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            font-size: 24px;
                            font-weight: bold;
                            }
                            #conf8 {
                            background-color: #517fb9 !important;
                            color: #ffffff !important;
                            opacity: 0.9;
                              font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            font-size: 24px;
                            font-weight: bold;
                            }
                            #conf9 {
                            background-color: #517fb9 !important;
                            color: #ffffff !important;
                            opacity: 0.9;
                              font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            font-size: 24px;
                            font-weight: bold;
                            }
                            #conf10 {
                            background-color: #517fb9 !important;
                            color: #ffffff !important;
                            opacity: 0.9;
                              font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            font-size: 24px;
                            font-weight: bold;
                            }
                            #conf11 {
                            background-color: #517fb9 !important;
                            color: #ffffff !important;
                            opacity: 0.9;
                              font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            font-size: 24px;
                            font-weight: bold;
                            }
                            #conf12 {
                            background-color: #517fb9 !important;
                            color: #ffffff !important;
                            opacity: 0.9;
                              font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            font-size: 24px;
                            font-weight: bold;
                            }
                            #conf13 {
                            background-color: #517fb9 !important;
                            color: #ffffff !important;
                            opacity: 0.9;
                              font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            font-size: 24px;
                            font-weight: bold;
                            }
                            #conf14 {
                            background-color: #517fb9 !important;
                            color: #ffffff !important;
                            opacity: 0.9;
                              font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            font-size: 24px;
                            font-weight: bold;
                            }
                            #conf15 {
                            background-color: #517fb9 !important;
                            color: #ffffff !important;
                            opacity: 0.9;
                              font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            font-size: 24px;
                            font-weight: bold;
                            }
                            #conf16 {
                            background-color: #517fb9 !important;
                            color: #ffffff !important;
                            opacity: 0.9;
                              font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            font-size: 24px;
                            font-weight: bold;
                            }
                            #conf17 {
                            background-color: #517fb9 !important;
                            color: #ffffff !important;
                            opacity: 0.9;
                              font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            font-size: 24px;
                            font-weight: bold;
                            }
                            #conf18 {
                            background-color: #517fb9 !important;
                            color: #ffffff !important;
                            opacity: 0.9;
                              font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            font-size: 24px;
                            font-weight: bold;
                            }
                            #conf19 {
                            background-color: #517fb9 !important;
                            color: #ffffff !important;
                            opacity: 0.9;
                              font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            font-size: 24px;
                            font-weight: bold;
                            }
                            #conf20 {
                            background-color: #517fb9 !important;
                            color: #ffffff !important;
                            opacity: 0.9;
                              font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            font-size: 24px;
                            font-weight: bold;
                            }
                            #conf21 {
                            background-color: #517fb9 !important;
                            color: #ffffff !important;
                            opacity: 0.9;
                              font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            font-size: 24px;
                            font-weight: bold;
                            }
                            #conf22 {
                            background-color: #517fb9 !important;
                            color: #ffffff !important;
                            opacity: 0.9;
                              font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            font-size: 24px;
                            font-weight: bold;
                            }
                            #conf23 {
                            background-color: #517fb9 !important;
                            color: #ffffff !important;
                            opacity: 0.9;
                              font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            font-size: 24px;
                            font-weight: bold;
                            }
                            #conf24 {
                            background-color: #517fb9 !important;
                            color: #ffffff !important;
                            opacity: 0.9;
                              font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            font-size: 24px;
                            font-weight: bold;
                            }
                            #conf25 {
                            background-color: #517fb9 !important;
                            color: #ffffff !important;
                            opacity: 0.9;
                              font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            font-size: 24px;
                            font-weight: bold;
                            }
                            #conf26 {
                            background-color: #517fb9 !important;
                            color: #ffffff !important;
                            opacity: 0.9;
                              font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            font-size: 24px;
                            font-weight: bold;
                            }
                            #conf27 {
                            background-color: #517fb9 !important;
                            color: #ffffff !important;
                            opacity: 0.9;
                              font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            font-size: 24px;
                            font-weight: bold;
                            }
                            #conf28 {
                            background-color: #517fb9 !important;
                            color: #ffffff !important;
                            opacity: 0.9;
                              font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            font-size: 24px;
                            font-weight: bold;
                            }
                            #conf29 {
                            background-color: #517fb9 !important;
                            color: #ffffff !important;
                            opacity: 0.9;
                              font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            font-size: 24px;
                            font-weight: bold;
                            }
                            #conf30 {
                            background-color: #517fb9 !important;
                            color: #ffffff !important;
                            opacity: 0.9;
                              font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            font-size: 24px;
                            font-weight: bold;
                            }
                            #conf31 {
                            background-color: #517fb9 !important;
                            color: #ffffff !important;
                            opacity: 0.9;
                              font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            font-size: 24px;
                            font-weight: bold;
                            }
                            #conf32 {
                            background-color: #517fb9 !important;
                            color: #ffffff !important;
                            opacity: 0.9;
                              font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            font-size: 24px;
                            font-weight: bold;
                            }
                            #results_1 {
                            background-color #000000;
                            opacity: 0.9;
                            color: #000000;
                            font-weight: bold;
                            font-size: 18px;
                            white-space: pre-wrap;
                            word-break: keep-all;
                            height: 100%;
                            text-align: center;
                            font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                          
                            }
                             #results_2 {
                            background-color #000000;
                            opacity: 0.9;
                            color: #000000;
                            font-weight: bold;
                            font-size: 18px;
                            white-space: pre-wrap;
                            word-break: keep-all;
                            height: 100%;
                            text-align: center;
                            font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            
                             }
                             #results_3 {
                            background-color #000000;
                            opacity: 0.9;
                            color: #000000;
                            font-weight: bold;
                            font-size: 18px;
                            white-space: pre-wrap;
                            word-break: keep-all;
                            height: 100%;
                            text-align: center;
                            font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            
                             }
                             #results_4 {
                            background-color #000000;
                            opacity: 0.9;
                            color: #000000;
                            font-weight: bold;
                            font-size: 18px;
                            white-space: pre-wrap;
                            word-break: keep-all;
                            height: 100%;
                            text-align: center;
                            font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            
                             }
                             #results_5 {
                            background-color #000000;
                            opacity: 0.9;
                            color: #000000;
                            font-weight: bold;
                            font-size: 18px;
                            white-space: pre-wrap;
                            word-break: keep-all;
                            height: 100%;
                            text-align: center;
                            font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            
                             }
                             #results_6 {
                            background-color #000000;
                            opacity: 0.9;
                            color: #000000;
                            font-weight: bold;
                            font-size: 18px;
                            white-space: pre-wrap;
                            word-break: keep-all;
                            height: 100%;
                            text-align: center;
                            font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            
                             }
                             #results_7 {
                            background-color #000000;
                            opacity: 0.9;
                            color: #000000;
                            font-weight: bold;
                            font-size: 18px;
                            white-space: pre-wrap;
                            word-break: keep-all;
                            height: 100%;
                            text-align: center;
                            font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            
                             }
                             #results_8 {
                            background-color #000000;
                            opacity: 0.9;
                            color: #000000;
                            font-weight: bold;
                            font-size: 18px;
                            white-space: pre-wrap;
                            word-break: keep-all;
                            height: 100%;
                            text-align: center;
                            font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            
                             }
                             #results_9 {
                            background-color #000000;
                            opacity: 0.9;
                            color: #000000;
                            font-weight: bold;
                            font-size: 18px;
                            white-space: pre-wrap;
                            word-break: keep-all;
                            height: 100%;
                            text-align: center;
                            font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            
                             }
                             #results_10 {
                            background-color #000000;
                            opacity: 0.9;
                            color: #000000;
                            font-weight: bold;
                            font-size: 18px;
                            white-space: pre-wrap;
                            word-break: keep-all;
                            height: 100%;
                            text-align: center;
                            font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            
                             }
                             #results_11 {
                            background-color #000000;
                            opacity: 0.9;
                            color: #000000;
                            font-weight: bold;
                            font-size: 18px;
                            white-space: pre-wrap;
                            word-break: keep-all;
                            height: 100%;
                            text-align: center;
                            font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            
                             }
                             #results_12 {
                            background-color #000000;
                            opacity: 0.9;
                            color: #000000;
                            font-weight: bold;
                            font-size: 18px;
                            white-space: pre-wrap;
                            word-break: keep-all;
                            height: 100%;
                            text-align: center;
                            font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            
                             }
                             #results_13 {
                            background-color #000000;
                            opacity: 0.9;
                            color: #000000;
                            font-weight: bold;
                            font-size: 18px;
                            white-space: pre-wrap;
                            word-break: keep-all;
                            height: 100%;
                            text-align: center;
                            font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            
                             }
                             #results_14 {
                            background-color #000000;
                            opacity: 0.9;
                            color: #000000;
                            font-weight: bold;
                            font-size: 18px;
                            white-space: pre-wrap;
                            word-break: keep-all;
                            height: 100%;
                            text-align: center;
                            font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            
                             }
                             #results_15 {
                            background-color #000000;
                            opacity: 0.9;
                            color: #000000;
                            font-weight: bold;
                            font-size: 18px;
                            white-space: pre-wrap;
                            word-break: keep-all;
                            height: 100%;
                            text-align: center;
                            font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            
                             }
                             #results_16 {
                            background-color #000000;
                            opacity: 0.9;
                            color: #000000;
                            font-weight: bold;
                            font-size: 18px;
                            white-space: pre-wrap;
                            word-break: keep-all;
                            height: 100%;
                            text-align: center;
                            font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            
                             }
                             #results_17 {
                            background-color #000000;
                            opacity: 0.9;
                            color: #000000;
                            font-weight: bold;
                            font-size: 18px;
                            white-space: pre-wrap;
                            word-break: keep-all;
                            height: 100%;
                            text-align: center;
                            font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            
                             }
                             #results_18 {
                            background-color #000000;
                            opacity: 0.9;
                            color: #000000;
                            font-weight: bold;
                            font-size: 18px;
                            white-space: pre-wrap;
                            word-break: keep-all;
                            height: 100%;
                            text-align: center;
                            font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            
                             }
                             #results_19 {
                            background-color #000000;
                            opacity: 0.9;
                            color: #000000;
                            font-weight: bold;
                            font-size: 18px;
                            white-space: pre-wrap;
                            word-break: keep-all;
                            height: 100%;
                            text-align: center;
                            font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            
                             }
                             #results_20 {
                            background-color #000000;
                            opacity: 0.9;
                            color: #000000;
                            font-weight: bold;
                            font-size: 18px;
                            white-space: pre-wrap;
                            word-break: keep-all;
                            height: 100%;
                            text-align: center;
                            font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            
                             }
                             #results_21 {
                            background-color #000000;
                            opacity: 0.9;
                            color: #000000;
                            font-weight: bold;
                            font-size: 18px;
                            white-space: pre-wrap;
                            word-break: keep-all;
                            height: 100%;
                            text-align: center;
                            font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            
                             }
                             #results_22 {
                            background-color #000000;
                            opacity: 0.9;
                            color: #000000;
                            font-weight: bold;
                            font-size: 18px;
                            white-space: pre-wrap;
                            word-break: keep-all;
                            height: 100%;
                            text-align: center;
                            font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            
                             }
                             #results_23 {
                            background-color #000000;
                            opacity: 0.9;
                            color: #000000;
                            font-weight: bold;
                            font-size: 18px;
                            white-space: pre-wrap;
                            word-break: keep-all;
                            height: 100%;
                            text-align: center;
                            font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            
                             }
                             #results_24 {
                            background-color #000000;
                            opacity: 0.9;
                            color: #000000;
                            font-weight: bold;
                            font-size: 18px;
                            white-space: pre-wrap;
                            word-break: keep-all;
                            height: 100%;
                            text-align: center;
                            font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            
                             }
                             #results_25 {
                            background-color #000000;
                            opacity: 0.9;
                            color: #000000;
                            font-weight: bold;
                            font-size: 18px;
                            white-space: pre-wrap;
                            word-break: keep-all;
                            height: 100%;
                            text-align: center;
                            font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            
                             }
                             #results_26 {
                            background-color #000000;
                            opacity: 0.9;
                            color: #000000;
                            font-weight: bold;
                            font-size: 18px;
                            white-space: pre-wrap;
                            word-break: keep-all;
                            height: 100%;
                            text-align: center;
                            font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            
                             }
                             #results_27 {
                            background-color #000000;
                            opacity: 0.9;
                            color: #000000;
                            font-weight: bold;
                            font-size: 18px;
                            white-space: pre-wrap;
                            word-break: keep-all;
                            height: 100%;
                            text-align: center;
                            font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            
                             }
                             #results_28 {
                            background-color #000000;
                            opacity: 0.9;
                            color: #000000;
                            font-weight: bold;
                            font-size: 18px;
                            white-space: pre-wrap;
                            word-break: keep-all;
                            height: 100%;
                            text-align: center;
                            font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            
                             }
                             #results_29 {
                            background-color #000000;
                            opacity: 0.9;
                            color: #000000;
                            font-weight: bold;
                            font-size: 18px;
                            white-space: pre-wrap;
                            word-break: keep-all;
                            height: 100%;
                            text-align: center;
                            font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            
                             }
                             #results_30 {
                            background-color #000000;
                            opacity: 0.9;
                            color: #000000;
                            font-weight: bold;
                            font-size: 18px;
                            white-space: pre-wrap;
                            word-break: keep-all;
                            height: 100%;
                            text-align: center;
                            font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            
                             }
                             #results_31 {
                            background-color #000000;
                            opacity: 0.9;
                            color: #000000;
                            font-weight: bold;
                            font-size: 18px;
                            white-space: pre-wrap;
                            word-break: keep-all;
                            height: 100%;
                            text-align: center;
                            font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            
                             }
                             #results_32 {
                            background-color #000000;
                            opacity: 0.9;
                            color: #000000;
                            font-weight: bold;
                            font-size: 18px;
                            white-space: pre-wrap;
                            word-break: keep-all;
                            height: 100%;
                            text-align: center;
                            font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif;
                            
                            }
                                          
                                          
                          
                                          '
                          )),
                          fluidRow(
                     h1(strong("Conferences"), align = "center", style="color: #ffffff;")),
                     br(),
                     fluidRow(
                  
                       
                       verbatimTextOutput("conf1")),
                       verbatimTextOutput("results_1"),
                       plotOutput("scatterplot1"),
                       
                       verbatimTextOutput("conf2"),
                       verbatimTextOutput("results_2"),
                       plotOutput("scatterplot2"),
                       
                       verbatimTextOutput("conf3"),
                       verbatimTextOutput("results_3"),
                       plotOutput("scatterplot3"),
                       
                       verbatimTextOutput("conf4"),
                       verbatimTextOutput("results_4"),
                       plotOutput("scatterplot4"),
                       
                       verbatimTextOutput("conf5"),
                       verbatimTextOutput("results_5"),
                       plotOutput("scatterplot5"),
                       
                       verbatimTextOutput("conf6"),
                       verbatimTextOutput("results_6"),
                       plotOutput("scatterplot6"),
                       
                       verbatimTextOutput("conf7"),
                       verbatimTextOutput("results_7"),
                       plotOutput("scatterplot7"),
                       
                       verbatimTextOutput("conf8"),
                       verbatimTextOutput("results_8"),
                       plotOutput("scatterplot8"),
                       
                       verbatimTextOutput("conf9"),
                       verbatimTextOutput("results_9"),
                       plotOutput("scatterplot9"),
                       
                       verbatimTextOutput("conf10"),
                       verbatimTextOutput("results_10"),
                       plotOutput("scatterplot10"),
                       
                       verbatimTextOutput("conf11"),
                       verbatimTextOutput("results_11"),
                       plotOutput("scatterplot11"),
                       
                       verbatimTextOutput("conf12"),
                       verbatimTextOutput("results_12"),
                       plotOutput("scatterplot12"),
                       
                       verbatimTextOutput("conf13"),
                       verbatimTextOutput("results_13"),
                       plotOutput("scatterplot13"),
                       
                       verbatimTextOutput("conf14"),
                       verbatimTextOutput("results_14"),
                       plotOutput("scatterplot14"),
                       
                       verbatimTextOutput("conf15"),
                       verbatimTextOutput("results_15"),
                       plotOutput("scatterplot15"),
                       
                       verbatimTextOutput("conf16"),
                       verbatimTextOutput("results_16"),
                       plotOutput("scatterplot16"),
                       
                       verbatimTextOutput("conf17"),
                       verbatimTextOutput("results_17"),
                       plotOutput("scatterplot17"),
                       
                       verbatimTextOutput("conf18"),
                       verbatimTextOutput("results_18"),
                       plotOutput("scatterplot18"),
                       
                       verbatimTextOutput("conf19"),
                       verbatimTextOutput("results_19"),
                       plotOutput("scatterplot19"),
                       
                       verbatimTextOutput("conf20"),
                       verbatimTextOutput("results_20"),
                       plotOutput("scatterplot20"),
                       
                       verbatimTextOutput("conf21"),
                       verbatimTextOutput("results_21"),
                       plotOutput("scatterplot21"),
                       
                       verbatimTextOutput("conf22"),
                       verbatimTextOutput("results_22"),
                       plotOutput("scatterplot22"),
                       
                       verbatimTextOutput("conf23"),
                       verbatimTextOutput("results_23"),
                       plotOutput("scatterplot23"),
                       
                       verbatimTextOutput("conf24"),
                       verbatimTextOutput("results_24"),
                       plotOutput("scatterplot24"),
                       
                       verbatimTextOutput("conf25"),
                       verbatimTextOutput("results_25"),
                       plotOutput("scatterplot25"),
                       
                       verbatimTextOutput("conf26"),
                       verbatimTextOutput("results_26"),
                       plotOutput("scatterplot26"),
                       
                       verbatimTextOutput("conf27"),
                       verbatimTextOutput("results_27"),
                       plotOutput("scatterplot27"),
                       
                       verbatimTextOutput("conf28"),
                       verbatimTextOutput("results_28"),
                       plotOutput("scatterplot28"),
                       
                       verbatimTextOutput("conf29"),
                       verbatimTextOutput("results_29"),
                       plotOutput("scatterplot29"),
                       
                       verbatimTextOutput("conf30"),
                       verbatimTextOutput("results_30"),
                       plotOutput("scatterplot30"),
                       
                       verbatimTextOutput("conf31"),
                       verbatimTextOutput("results_31"),
                       plotOutput("scatterplot31"),
                       
                       verbatimTextOutput("conf32"),
                       verbatimTextOutput("results_32"),
                       plotOutput("scatterplot32")
                       
                     ),
                 tabPanel("Map", tags$style(HTML('
                            #filter {
                            background: none !important;
                            color: #ffffff !important;
                            font-size: 20px !important;
                            font-weight: bold !important;
                            
                              font-family: "Galaxie Polaris", "Avenir Next", "Arial",sans-serif !important;
                            
                            }')),
                          tags$style(type = "text/css", "#map {height: calc(100vh - 150px) !important;}"),
                          fluidRow(
                            uiOutput("filter")
                          ),
                          fluidRow(
                   leafletOutput(outputId = "map")
                 )
                ),
            tabPanel("Summary Table", 
                     
                     fluidRow(div(DTOutput('dtable'))),
                       fluidRow(
                         downloadButton("download", "Download Your Conference Realignment Results"))
                    ),
                 tags$head(tags$style(type="text/css", ".container-fluid {  max-width: 2000px; /* or 2000px */}"))
)),
busyIndicator(text = "Calculation in progress ...", 
                img = "https://media.giphy.com/media/hzHmk2qWuTUWIJGJmd/giphy.gif", 
                wait = 0)
))})