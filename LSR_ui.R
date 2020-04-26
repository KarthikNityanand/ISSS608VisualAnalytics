# PACKAGES


packages = c(
  'rsconnect',
  'plogr',
  'sys',
  'shiny',
  'shinydashboard',
  'tidyverse',
  'aggregation',
  'plotly',
  'plyr',
  'reshape2',
  'HH',
  'dplyr',
  'cowplot',
  'gridExtra',
  'ggthemes',
  'stringr',
  'ggplot2',
  'RColorBrewer',
  'shinyHeatmaply',
  'heatmaply',
  'dendextend',
  'ggalt',
  'crosstalk',
  'FactoMineR',
  'Factoshiny',
  'devtools',
  'ggbiplot',
  'factoextra',
  'corrplot',
  'gridExtra',
  'd3r',
  'sunburstR',
  'UpSetR',
  'ggstatsplot',
  'ggpubr',
  'rstatix',
  'viridis',
  'hrbrthemes'
)

for (p in packages) {
  if (!require(p, character.only = T))
    install.packages(p, dependencies = T)
  library(p, character.only = T)
}

# Data Load
lib_data<- read_csv("data/Raw Data LSR.csv")
ItemCategories <- read_csv("data/ItemCategories.csv")


# UI
p00 = fluidRow(# Overview of Ratings for Factors by Respondents
  fluidRow(
    column(
      width = 12,
      box(
        title = 'OVERVIEW OF THE SMU LIBRARY SURVEY ANALYSIS',
        status = 'primary',
        width = 15,
        solidHeader = T,
        #plotOutput('plot_intro', height = 700),
              img(src='pic3.png', align = "center",height='700px',width='1500px')
      )
    )
  )
)

p0 = fluidRow(# Overview of Ratings for Factors by Respondents
  fluidRow(
    column(
      width = 12,
      box(
        title = 'SETTINGS',
        status = 'primary',
        width = 2,
        solidHeader = T,
        radioButtons(
          inputId = 'selectS0',
          label = 'Study Area',
          choices = c(
            'All',
            'Accountancy',
            'Business',
            'Economics',
            'Information Systems',
            'Law',
            'Social Sciences'
          #  'Others'
          ),
          selected = 'All'
        )
      ),

      box(
        title = 'SUNBURST CHART: DEMOGRAPHICS OF SMU LIBRARY SURVEY RESPONDENTS',
        status = 'primary',
        width = 8,
        solidHeader = T,
        sunburstOutput('plot_sunburst', height = 700)
      ),
      box(
        title = 'GUIDE',
        status = 'primary',
        width = 2,
        solidHeader = T,
               h3("Help text"),
               helpText("Note: Hover over the chart to see the split of respondents.", 
                        "Select the study area to slice and dice the demography.",
                        "For more details refer to the user guide."),
      )
    )
  )
)

p01 = fluidRow(# Overview of LKS/KGCL Respondents and International/Non-International Respondents
  fluidRow(
    column(
      width = 12,
      box(
        title = 'DONUT CHART: LKS VS KGCL',
        status = 'primary',
        width = 5,
        solidHeader = T,
        plotlyOutput('plot_grouppie1', height = 700)
      ),
      box(
        title = 'DONUT CHART: NON-INTERNATIONAL VS INTERNATIONAL',
        status = 'primary',
        width = 5,
        solidHeader = T,
        plotlyOutput('plot_grouppie2', height = 700)
      ),
      box(
        title = 'GUIDE',
        status = 'primary',
        width = 2,
        solidHeader = T,
        h3("Help text"),
        helpText("Note: Hover over the chart to see the values.", 
                 "To download the plot, hover over the top right portion of each chart",
                 "For more details refer to the user guide."),
      )
    )
  )
)

p02 = fluidRow(# Overview of frequency of visits by Respondents
  fluidRow(
    column(
      width = 12,
      box(
        title = 'SETTINGS',
        status = 'primary',
        width = 2,
        solidHeader = T,
        radioButtons(
          inputId = 'selectG0',
          label = 'Study Area',
          choices = c(
            'All',
            'Accountancy',
            'Business',
            'Economics',
            'Information Systems',
            'Law',
            'Social Sciences'
            #  'Others'
          ),
          selected = 'All'
        )
      ),
      box(
        title = 'GROUPED BAR CHART: FREQUENCY OF VISITORS',
        status = 'primary',
        width = 8,
        solidHeader = T,
        plotlyOutput('plot_groupbar', height = 700)
      ),
      box(
        title = 'GUIDE',
        status = 'primary',
        width = 2,
        solidHeader = T,
        h3("Help text"),
        helpText("Note: Hover over the chart to see the frequency of the respondents.", 
                 "Select the study area to slice and dice the demography.",
                 "Use the top right portion to zoom, pan, print etc,.",
                 "For more details refer to the user guide."),
      )
    )
  )
)

p1 = fluidRow(# Overview of Ratings for Factors by Respondents
  fluidRow(
    column(
      width = 12,
      box(
        title = 'SETTINGS',
        status = 'primary',
        width = 2,
        solidHeader = T,
        selectInput(
          inputId = 'select0',
          label = 'Rating Type',
          choices = c('Importance Ratings', 'Performance Ratings'),
          selected = 'Importance Ratings'
        ),
        hr(),
        radioButtons(
          inputId = 'select1',
          label = 'Library',
          choices = c('All Libraries','Li Ka Shing Library', 'Kwa Geok Choo Law Library'),
          selected = 'All Libraries'
        ),
        hr(),
        radioButtons(
          inputId = 'select2',
          label = 'Study Area',
          choices = c(
            'All',
            'Accountancy',
            'Business',
            'Economics',
            'Information Systems',
            'Law',
            'Social Sciences'
          ),
          selected = 'All'
        ),
        hr(),
        radioButtons(
          inputId = 'select3',
          label = 'Respondent Role',
          choices = c(
            'All Roles',
            'Undergraduate Students',
            'Postgraduate Students',
            'Faculty',
            'Non-Faculty Staff, Administrators & Others'
          ),
          selected = 'All Roles'
        )
      ),

      box(
        title = 'DIVERGING STACKED BAR CHART: RATING SPLIT',
        status = 'primary',
        width = 8,
        solidHeader = T,
        plotlyOutput('plot_map', height = 700)
      ),
      box(
        title = 'GUIDE',
        status = 'primary',
        width = 2,
        solidHeader = T,
        h3("Help text"),
        helpText("Note: Hover over the chart to see the Sentiments of the respondents.", 
                 "Select the study area to slice and dice the demography.",
                 "Use the top right portion to zoom, pan, print etc,.",
                 "For more details refer to the user guide."),
      )
    )
  )
)

p2 = fluidRow(# Overview of Mean Variation in Ratings of Factors
  fluidRow(
    column(
      width = 12,
      box(
        title = 'SETTINGS',
        status = 'primary',
        width = 2,
        solidHeader = T,
        selectInput(
          inputId = 'selectM4',
          label = 'Service Category',
          choices = c(
            'All',
            'Communication',
            'Facilities and Equipment',
            'Information Resources',
            'Service Delivery'
          ),
          selected = 'All'
        ),
        hr(),
        radioButtons(
          inputId = 'selectM1',
          label = 'Library',
          choices = c('All Libraries','Li Ka Shing Library', 'Kwa Geok Choo Law Library'),
          selected = 'All Libraries'
        ),
        hr(),
        radioButtons(
          inputId = 'selectM2',
          label = 'Study Area',
          choices = c(
            'All',
            'Accountancy',
            'Business',
            'Economics',
            'Information Systems',
            'Law',
            'Social Sciences',
            'Others'
          ),
          selected = 'All'
        ),
        hr(),
        radioButtons(
          inputId = 'selectM3',
          label = 'Respondent Role',
          choices = c(
            'All Roles',
            'Undergraduate Students',
            'Postgraduate Students',
            'Faculty',
            'Non-Faculty Staff, Administrators & Others'
          ),
          selected = 'All Roles'
        )
      ),
      
      box(
        title = 'DUMBBELL PLOT: MEAN VARIATION IN RATINGS',
        status = 'primary',
        width = 8,
        solidHeader = T,
        plotlyOutput('plot_bc_top_cnt', height = 700)
      ),
      box(
        title = 'GUIDE',
        status = 'primary',
        width = 2,
        solidHeader = T,
        h3("Help text"),
        helpText("Note: Hover over the chart to see the Mean scores of the respondents.", 
                 "Select the study area to slice and dice the demography.",
                 "Use the top right portion to zoom, pan, print etc,.",
                 "For more details refer to the user guide."),
      )
    )
  )
)


p3 = fluidRow(# Overview of Heat Map Variation in Ratings of Factors
  fluidRow(
    column(
      width = 12,
      box(
        title = 'SETTINGS',
        status = 'primary',
        width = 2,
        solidHeader = T,
        selectInput(
          inputId = 'selectH00',
          label = 'Rating Type',
          choices = c('Importance Ratings', 'Performance Ratings'),
          selected = 'Importance Ratings'
        ),
        hr(),
        radioButtons(
          inputId = 'selectH0',
          label = 'Select Rating',
          choices = c('Less than 4','4', '5','6','7'),
          selected = '7'
        ),
        hr(),
        radioButtons(
          inputId = 'selectH1',
          label = 'Library',
          choices = c('All Libraries', 'Li Ka Shing Library', 'Kwa Geok Choo Law Library'),
          selected = 'All Libraries'
        ),
        hr(),
        radioButtons(
          inputId = 'selectH3',
          label = 'Respondent Role',
          choices = c(
            'All Roles',
            'Undergraduate Students',
            'Postgraduate Students',
            'Faculty',
            'Non-Faculty Staff, Administrators & Others'
          ),
          selected = 'All Roles'
        )
      ),
      
      box(
        title = 'HEAT MAP: VARIATION IN PROPORTION OF RATINGS',
        status = 'primary',
        width = 8,
        solidHeader = T,
        plotlyOutput('plot_heat_imp', height = 700)
      ),
      box(
        title = 'GUIDE',
        status = 'primary',
        width = 2,
        solidHeader = T,
        h3("Help text"),
        helpText("Note: Hover over the chart to see the Proportion of Ratings of the respondents.", 
                 "Select the study area to slice and dice the demography.",
                 "Use the top right portion to zoom, pan, print etc,.",
                 "For more details refer to the user guide."),
      )
    )
  )
)

p4 = fluidRow(# Overview of Upset Plot Variation in Ratings of Factors
  fluidRow(
    column(
      width = 12,
      box(
        title = 'SETTINGS',
        status = 'primary',
        width = 2,
        solidHeader = T,
      #  tags$style("#myNumericInput {font-size:50px;height:50px;}"),
        sliderInput('selectU0','Select Rating',
        min = 1, max = 7, value = 1
        ),
        hr(),
        radioButtons(
          inputId = 'selectU1',
          label = 'Service Category',
          choices = c(
            'Communication',
            'Facilities and Equipment',
            'Information Resources',
            'Service Delivery'
          ),
          selected = 'Service Delivery'
        ),
      hr(),
        selectInput(
          inputId = 'selectU2',
          label = 'Rating Type',
          choices = c('Importance Ratings', 'Performance Ratings'),
          selected = 'Importance Ratings'
        )
      ),
      
      box(
        title = 'UPSET PLOT: RATING SPLIT',
        status = 'primary',
        width = 8,
        solidHeader = T,
        plotOutput('plot_upset', height = 700)
      ),
      box(
        title = 'GUIDE',
        status = 'primary',
        width = 2,
        solidHeader = T,
        h3("Help text"),
        helpText("Note: Use the slider bar to choose the ratings.", 
                 "Select the Service Category to slice and dice.",
                 "For more details refer to the user guide."),
      )
    )
  )
)


p5 = fluidRow(# Overview of Mean Variation in Ratings of Factors
  fluidRow(
    column(
      width = 12,
      box(
        title = 'SETTINGS',
        status = 'primary',
        width = 2,
        solidHeader = T,
        selectInput(
          inputId = 'selectP1',
          label = 'Rating Type',
          choices = c(
            'Importance Ratings',
            'Performance Ratings'
          ),
          selected = 'Importance Ratings'
        ),
        hr(),
        radioButtons(
          inputId = 'selectP2',
          label = 'Study Area',
          choices = c(
            'All',
            'Accountancy',
            'Business',
            'Economics',
            'Information Systems',
            'Law',
            'Social Sciences',
            'Others'
          ),
          selected = 'All'
        ),
        hr(),
        radioButtons(
          inputId = 'selectP3',
          label = 'Display Options',
          choices = c( 'Corr Plot', 'Scree Plot','Loading Plot'),
          selected = 'Loading Plot'
        ),
      hr(),
      selectInput(
        inputId = 'selectP4',
        label = 'Dimensions for Loading Plot',
        choices = c('Dim 1 vs Dim 2','Dim 2 vs Dim 3', 'Dim 3 vs Dim 4', 'Dim 4 vs Dim 5'),
        selected = 'Dim 1 vs Dim 2'
      )
    ),
      box(
        title = 'PRINCIPLE COMPONENT ANALYSIS',
        status = 'primary',
        width = 8,
        solidHeader = T,
        plotOutput('plot_pca', height = 700)
      ),
    box(
      title = 'GUIDE',
      status = 'primary',
      width = 2,
      solidHeader = T,
      h3("Help text"),
      helpText("Note: Select the Rating Type from the drop down menu.", 
               "Select the study area to slice and dice the demography.",
               "Select from the dropdown the dimenions for the Loading Plot.",
               "For more details refer to the user guide."),
    )
    )
  )
)

p6 = fluidRow(# Overview of Mean Variation in Ratings of Respondents - Anova
  fluidRow(
    column(
      width = 12,
      box(
        title = 'SETTINGS',
        status = 'primary',
        width = 2,
        solidHeader = T,
        selectInput(
          inputId = 'selectA1',
          label = 'Rating Type',
          choices = c(
            'Importance Ratings',
            'Performance Ratings'
          ),
          selected = 'Importance Ratings'
        ),
        hr(),
        radioButtons(
          inputId = 'selectA2',
          label = 'Service Category',
          choices = c(
            'Communication',
            'Facilities and Equipment',
            'Information Resources',
            'Service Delivery'
          ),
          selected = 'Service Delivery'
        ),
        hr(),
        radioButtons(
          inputId = 'selectA3',
          label = 'Display Option',
          choices = c(
            'QQ-Plot',
            'Anova Graph'
          ),
          selected = 'Anova Graph'
        )
      ),
      box(
        title = 'ANOVA: COMPARISON OF MEAN RATINGS',
        status = 'primary',
        width = 8,
        solidHeader = T,
        plotlyOutput('plot_anova', height = 350)
      ),
      box(
        title = 'ANOVA: TUKEY HSD TEST RESULTS',
        status = 'primary',
        width = 10,
        solidHeader = T,
        DT::dataTableOutput('plot_tukey', height = 300)
      )
    )
  )
)

header = dashboardHeader(
  title = textOutput('title')
# dropdownMenu(
#   type = 'messages',
#   messageItem(
#     from = 'G3 T2',
#     message = 'Hello!',
#     time = '11:30'
#   )
# )
)

sidebar = dashboardSidebar(#change to blue
  sidebarMenu(
    menuItem('INTRODUCTION', startExpanded = T,
      menuSubItem('Overview', tabName = 'introduction', icon = icon('award'))
    ),
    menuItem('DEMOGRAPHICS', startExpanded = T,
      menuSubItem('Sunburst Chart', tabName = 'sunburst', icon = icon('circle-notch')),
      menuSubItem('Donut Chart', tabName = 'grouppie', icon = icon('chart-pie')),
      menuSubItem('Grouped Bar Chart', tabName = 'groupbar', icon = icon('chart-bar'))
    ),
    menuItem('VISUALISATIONS', startExpanded = T,
      menuSubItem('Diverging Bar Chart', tabName = 'survey', icon = icon('align-left')),
      menuSubItem('Dumbbell Plot', tabName = 'mean-score', icon = icon('line-chart')),
      menuSubItem('Heat Map Plot', tabName = 'heat-map', icon = icon('braille')),
      menuSubItem('Upset Plot', tabName = 'upset', icon = icon('chart-bar'))
    ),
    menuItem('MODELLING', startExpanded = T,
      menuSubItem('Principle Component Analysis', tabName = 'pca', icon = icon('dashboard')),
      menuSubItem('Anova', tabName = 'anova', icon = icon('ellipsis-v'))
    ),
    menuItem('ABOUT', startExpanded = T,
      menuSubItem('About', tabName = 'about', icon = icon('info'))
    )
  )
)

body = dashboardBody(
  tabItems(
    tabItem(tabName = 'introduction',p00),
    tabItem(tabName = 'sunburst',p0),
    tabItem(tabName = 'grouppie',p01),
    tabItem(tabName = 'groupbar',p02),
    tabItem(tabName = 'survey', p1),
    tabItem(tabName = 'mean-score',p2),
    tabItem(tabName = 'heat-map',p3),
    tabItem(tabName = 'upset',p4),
    tabItem(tabName = 'pca',p5),
    tabItem(tabName = 'anova',p6),
    tabItem(tabName = 'about', includeMarkdown('aboutme.txt'))
  ),
  tags$head(tags$style(HTML(
          '.main-sidebar {
            background-color:   #1b4f72 !important;
          }
          main-sidebar .sidebar .sidebar-menu .active a{
                                background-color: #1b4f72;
          }
          .myClass { 
        font-size: 22px;
        line-height: 50px;
        text-align: center;
        font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
        padding: 0 50px;
        overflow: hidden;
        color: white;
      }                      
        '))
  ),
  tags$script(HTML('
      $(document).ready(function() {
        $("header").find("nav").append(\'<span class="myClass"> <b> SINGAPORE MANAGEMENT UNIVERSITY - LIBRARY SURVEY ANALYSIS </b> </span>\');
      })
     '))
)

ui = dashboardPage(
  skin = 'yellow',
  header,
  sidebar,
  body
)

shinyApp (ui=ui, server=server)
