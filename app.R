library(shiny)
library(shinyMobile)

# Define the User Interface (UI)
ui <- f7Page(
  title = "Eviction Likelihood Simulator",
  f7SingleLayout(
    navbar = f7Navbar(title = "Eviction Likelihood"),
    f7Card(
      title = "Input Your Details",
      f7Text(inputId = "income", label = "Monthly Income ($):", value = "2000"),
      f7Text(inputId = "rent", label = "Monthly Rent ($):", value = "800"),
      f7Text(inputId = "utilities", label = "Monthly Utilities Cost ($):", value = "150"),
      f7Text(inputId = "savings", label = "Total Savings ($):", value = "500"),
      f7Button(inputId = "calculate", label = "Calculate Likelihood")
    ),
    f7Card(
      title = "Results",
      verbatimTextOutput("result"), # Displays likelihood (e.g., "High Risk")
      textOutput("advice")          # Displays financial advice
    )
  )
)

# Define the Server Logic
server <- function(input, output) {
  observeEvent(input$calculate, {
    # Convert inputs from text to numeric
    income <- as.numeric(input$income)
    rent <- as.numeric(input$rent)
    utilities <- as.numeric(input$utilities)
    savings <- as.numeric(input$savings)
    
    # Validate inputs
    if (is.na(income) || income <= 0 || is.na(rent) || rent <= 0 || 
        is.na(utilities) || utilities < 0 || is.na(savings) || savings < 0) {
      output$result <- renderText("Please enter valid positive numbers for all inputs.")
      output$advice <- renderText("")
      return()
    }
    
    # Perform calculations
    rent_to_income_ratio <- rent / income
    total_expenses <- rent + utilities
    savings_to_expenses_ratio <- savings / total_expenses
    
    # Determine Eviction Likelihood with Risk Levels
    likelihood <- ifelse(
      rent_to_income_ratio > 0.5 && savings_to_expenses_ratio < 1, "High Risk",
      ifelse(rent_to_income_ratio <= 0.5 && savings_to_expenses_ratio >= 1, "Low Risk", "Moderate Risk")
    )
    
    # Display the Likelihood Result
    output$result <- renderText({
      paste("Your eviction likelihood is:", likelihood)
    })
    
    # Provide Financial Advice
    output$advice <- renderText({
      if (likelihood == "High Risk") {
        "Advice: Consider applying for rental assistance programs, increasing savings, or reducing expenses to lower your risk."
      } else if (likelihood == "Moderate Risk") {
        "Advice: You may be at some risk. Try to improve your savings or reduce expenses for better stability."
      } else {
        "Advice: You are in a relatively safe financial position. Maintain your financial discipline."
      }
    })
  })
}

# Run the App
shinyApp(ui = ui, server = server)
