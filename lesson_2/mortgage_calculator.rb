=begin

-- Informal pseudo code --

- Get loan amount from user
- Check if loan amount is a valid number
  - if so, continue
  - if not, ask again

- Get annual percentage rate from user
- Check annual percentage rate is a valid number
  - if so, continue
  - if not, ask again

- Get loan duration from user
- Check loan duration is a valid number
  - if so, continue
  - if not, ask again


- Calculate the monthly interest rate
- Calculate the loan duration in Months
- Calculate the monthly payment

- Print monthly interest rate, loan duration/month, monthly payment

- Ask the user to perform another calculation
  - if so, go to step 1
  - if not, quit the program

-- Formal pseudo code --

START

WHILE loan_amount != valid_number
  GET "loan amount"
  SET loan_amount

  SUBPROCESS "check if loan_amount is valid_number"

WHILE annual_percentage_rate != valid_number
  GET "annual percentage rate"
  SET annual_percentage_rate

  SUBPROCESS "check if annual_percentage_rate is valid_number"

WHILE loan_duration != valid_number
  GET "loan duration"
  SET loan_duration

  SUBPROCESS "check if loan_duration is valid_number"

SET monthly_interest_rate = SUBPROCESS "calculate the monthly interest rate"
SET loan_duration_in_months = SUBPROCESS "calculate the loan duration in Months"
SET monthly_payment = SUBPROCESS "calculate the monthly payment"

PRINT monthly_interest_rate
PRINT loan_duration_in_months
PRINT monthly_payment

END

=end

def prompt(message)
  puts ">> #{message}"
end

def valid_number?(user_input)
  user_input != "0" && user_input.to_i.to_s == user_input
end

def calculate_monthly_interest_rate(annual_percentage_rate)
  annual_percentage_rate_decimal = annual_percentage_rate / 100.0

  monthly_interest_rate = annual_percentage_rate_decimal / 12
  monthly_interest_rate.round(3)
end

def calculate_loan_duration_in_months(loan_duration_in_years)
  loan_duration_in_years * 12
end

def calculate_monthly_payment(loan_amount, monthly_interest_rate, loan_duration_in_months)
  monthly_payment = loan_amount * (monthly_interest_rate / (1 - (1 + monthly_interest_rate) ** (-loan_duration_in_months)))
  monthly_payment.round(2)
end

def calculate_total_loaned_amount(monthly_payment, loan_duration_in_months)
  total_loaned_amount = monthly_payment * loan_duration_in_months
  total_loaned_amount.round(2)
end

def calculate_total_interest(loan_amount_without_interest, loan_amount_with_interest)
  total_interest = loan_amount_with_interest - loan_amount_without_interest
  total_interest.round(2)
end

prompt("Welcome to the Mortgage Calculator!")
prompt("Press any key to get started...")
gets.chomp

loop do
  loan_amount_without_interest = loop do
    prompt("Can you provide us with the loan amount?")
    loan_amount_input = gets.chomp

    if valid_number?(loan_amount_input)
      break loan_amount_input.to_i
    else
      prompt("That doesn't seem to be a valid loan amount...")
    end
  end

  loan_duration_in_years = loop do
    prompt("Can you provide us with the loan term?")
    loan_duration_in_years_input = gets.chomp

    if valid_number?(loan_duration_in_years_input)
      break loan_duration_in_years_input.to_i
    else
      prompt("That doesn't seem to be a valid loan term...")
    end
  end

  annual_percentage_rate = loop do
    prompt("Can you provide us with the annual percentage rate (APR)?")
    annual_percentage_rate_input = gets.chomp

    if valid_number?(annual_percentage_rate_input)
      break annual_percentage_rate_input.to_i
    else
      prompt("That doesn't seem to be a valid annual percentage rate...")
    end
  end

  monthly_interest_rate = calculate_monthly_interest_rate(annual_percentage_rate)
  loan_duration_in_months = calculate_loan_duration_in_months(loan_duration_in_years)
  monthly_payment = calculate_monthly_payment(loan_amount_without_interest, monthly_interest_rate, loan_duration_in_months)
  loan_amount_with_interest = calculate_total_loaned_amount(monthly_payment, loan_duration_in_months)
  total_interest = calculate_total_interest(loan_amount_without_interest, loan_amount_with_interest)

  prompt("This is what we came up with:")
  prompt("Your monthly interest rate is #{monthly_interest_rate}%")
  prompt("It would take you #{loan_duration_in_months} months to pay the loan.")
  prompt("Your monthly payment would be #{monthly_payment} dollar.")
  prompt("The total amount loaned would come down to #{loan_amount_with_interest} dollar.")
  prompt("The total interest comes down to #{total_interest} dollar.")

  puts
  prompt("Do you want to perform another simulation? (Y to continue)")
  input = gets.chomp

  break if input.downcase != "y"
end
