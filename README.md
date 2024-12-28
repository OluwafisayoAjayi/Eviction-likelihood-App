Methodology


The objective of the Eviction Likelihood App is to provide an intuitive tool for assessing the likelihood of eviction based on user-inputted financial data. The app uses simple calculations to categorize users into "High Risk" or "Low Risk" categories, along with actionable advice to mitigate eviction risks.

# Eviction Likelihood App

## Overview
The **Eviction Likelihood App** is an interactive Shiny application that allows users to estimate their likelihood of eviction based on financial inputs such as income, rent, utilities, and savings. The app provides a simple risk analysis and actionable advice to help users mitigate eviction risks.

---

## Features
- **User-Friendly Interface**: Built with `shinyMobile` for a responsive and intuitive experience.
- **Eviction Risk Assessment**: Calculates whether the eviction likelihood is "High Risk" or "Low Risk."
- **Actionable Advice**: Provides suggestions for improving financial security based on the risk level.
- **Customizable Inputs**: Users can input their monthly income, rent, utility costs, and savings.

---

## How to Run
To use the app locally, follow these steps:

1. Clone this repository to your local machine:
   ```bash
   git clone https://github.com/OluwafisayoAjayi/Eviction-Likelihood-App.git
   
2. Open the app.R file in RStudio.
 
 3. Ensure the required R packages are installed:

install.packages   (c("shiny", "shinyMobile"))

5. Run the app with
  shiny::runApp()
6. The app will open in your default browser at http://127.0.0.1:xxxx.
Inputs and Outputs
Inputs:
1. Monthly Income: The user’s total monthly income in USD.
2. Monthly Rent: The user’s monthly rent in USD.
3. Monthly Utility Costs: The total monthly utility expenses (e.g., electricity, water).
4. Total Savings: The user’s available savings in USD.
Outputs:
1. Eviction Likelihood: Displays "High Risk" or "Low Risk."
2. Financial Advice:

 Offers practical suggestions for reducing eviction risk.

 
Dependencies

This app requires the shiny and shinyMobile R packages:


Ensure these packages are installed before running the app.

Contributions are welcome! Feel free to submit a pull request or create an issue if you have suggestions or find any bugs.



Author:
Oluwafisayo Ajayi





