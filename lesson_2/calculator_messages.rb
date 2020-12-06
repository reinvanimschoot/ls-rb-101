def prompt_messages(lang, key, *message_variables)
  messages = {
    en: {
      ask_name: "Welcome to Calculator! Enter your name: ",
      greeting: "Hi #{message_variables[0]}! Let's get calculating!",
      valid_name_warning: "Make sure to use a valid name.",
      first_number_question: "What's the first number?",
      second_number_question: "What's the second number?",
      valid_number_warning: "Hm... That doesn't look like a valid number!",
      operator_question: "What operation would you like to perform? \n" \
      "1) add \n" \
      "2) subtract \n" \
      "3) multiply \n" \
      "4) divide \n",
      adding: "Adding",
      subtracting: "Subtracting",
      multiplying: "Multiplying",
      dividing: "Dividing",
      calculating: "#{message_variables[0]} the two numbers...",
      valid_operator_warning: "You must choose 1, 2, 3 or 4.",
      result: "The result is #{message_variables[0]}!",
      calculate_again: "Do you want to perform another calculation? (Y to calculate again)",
      goodbye: "Thank you for using the calculator. Goodbye!",
    },
    nl: {
      ask_name: "Welkom bij de rekenmachine! Wat is je naam? ",
      greeting: "Hallo #{message_variables[0]}! Laten we iets berekenen!",
      valid_name_warning: "Zorg dat je een correcte naam invult.",
      first_number_question: "Wat is het eerste nummer?",
      second_number_question: "What is het tweede nummer?",
      valid_number_warning: "Hm.. Dat lijkt me geen valide nummer te zijn!",
      operator_question: "Welke berekening zou je graag uitvoeren? \n" \
      "1) optellen \n" \
      "2) aftrekken \n" \
      "3) vermenigvuldigen \n" \
      "4) delen \n",
      adding: "op te tellen",
      subtracting: "af te trekken",
      multiplying: "te vermenigvuldigen",
      dividing: "te delen",
      calculating: "Biep boep, bezig met de nummers #{message_variables[0]}...",
      valid_operator_warning: "Kies alstublieft 1, 2, 3 of 4.",
      result: "Het resultaat is #{message_variables[0]}!",
      calculate_again: "Wil je een nieuwe berekening uitvoeren? (Druk J om opnieuw te berekenen)",
      goodbye: "Bedankt om de rekenmachine te gebruiken! Tot de volgende keer!",
    },
  }

  messages[lang.to_sym][key]
end
