require_relative "calculator_messages"

# Ask the user for two numbers
# Ask the user for the operation to perform
# Perform the operation on the two numbers
# Output the result

def prompt(message)
  Kernel.puts("=> #{message}")
end

def number?(number)
  integer?(number) || float?(number)
end

def integer?(number)
  number.to_i().to_s() == number
end

def float?(number)
  number.to_f().to_s() == number
end

def operation_to_message(lang, operation)
  message = case operation
    when "1" then prompt_messages(lang, :adding)
    when "2" then prompt_messages(lang, :subtracting)
    when "3" then prompt_messages(lang, :multiplying)
    when "4" then prompt_messages(lang, :dividing)
    end

  message
end

prompt("Select language by entering nl or en.")

lang = ""

loop do
  lang = Kernel.gets().chomp()
  valid_langs = ["en", "nl"]

  if lang.empty?() || !valid_langs.include?(lang)
    prompt("Please select a valid language.")
  else
    break
  end
end

prompt(prompt_messages(lang, :ask_name))

name = ""

loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt(prompt_messages(lang, :valid_name_warning))
  else
    break
  end
end

prompt(prompt_messages(lang, :greeting, name))

loop do # main loop
  number1 = ""

  loop do
    prompt(prompt_messages(lang, :first_number_question))
    number1 = Kernel.gets().chomp()

    if number?(number1)
      break
    else
      prompt(prompt_messages(lang, :valid_number_warning))
    end
  end

  number2 = ""

  loop do
    prompt(prompt_messages(lang, :second_number_question))
    number2 = Kernel.gets().chomp()

    if number?(number2)
      break
    else
      prompt(prompt_messages(lang, :valid_number_warning))
    end
  end

  prompt(prompt_messages(lang, :operator_question))

  operator = ""
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(prompt_messages(lang, :valid_operator_warning))
    end
  end

  operator_message = operation_to_message(lang, operator)

  prompt(prompt_messages(lang, :calculating, operator_message))

  result = case operator
    when "1" then number1.to_i() + number2.to_i()
    when "2" then number1.to_i() - number2.to_i()
    when "3" then number1.to_i() * number2.to_i()
    when "4" then number1.to_f() / number2.to_f()
    end

  prompt(prompt_messages(lang, :result, result))

  prompt(prompt_messages(lang, :calculate_again))
  answer = Kernel.gets().chomp()

  break unless answer.downcase.start_with?("y")
end

prompt(prompt_messages(lang, :goodbye))
