VALID_CHOICES = ["rock", "paper", "scissors", "spock", "lizard"]

SHORTHANDS = {
  r: "rock",
  p: "paper",
  l: "lizard",
  sp: "spock",
  sc: "scissors",
}

GAME_RULES = {
  "scissors": { wins_against: ["lizard", "paper"] },
  "spock": { wins_against: ["rock", "scissors"] },
  "rock": { wins_against: ["lizard", "scissors"] },
  "paper": { wins_against: ["rock", "spock"] },
  "lizard": { wins_against: ["paper", "spock"] },
}

def prompt(message)
  Kernel.puts(">> #{message}")
end

def print_options
  prompt("Choose one:")

  SHORTHANDS.each_pair do |shorthand, choice|
    prompt("#{shorthand} for #{choice}")
  end
end

def convert_shorthand_to_valid_choice(shorthand_choice)
  player_choice = SHORTHANDS[shorthand_choice.to_sym()]
end

def player_one_wins?(first_player_choice, second_player_choice)
  GAME_RULES[first_player_choice.to_sym()][:wins_against].include?(second_player_choice)
end

def display_results(player_choice, computer_choice)
  if win?(player_choice, computer_choice)
    prompt("You won!")
  elsif win?(computer_choice, player_choice)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

computer_score = 0
player_score = 0

loop do
  player_choice = loop do
    print_options
    shorthand_choice = Kernel.gets().chomp() # e.g. r for rock, sc for scissors

    player_choice = convert_shorthand_to_valid_choice(shorthand_choice)

    if VALID_CHOICES.include?(player_choice)
      break player_choice
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{player_choice} and the computer chose #{computer_choice}.")

  if player_one_wins?(player_choice, computer_choice)
    player_score += 1
    prompt("You won!")
  elsif player_one_wins?(computer_choice, player_choice)
    computer_score += 1
    prompt("The computer won!")
  else
    prompt("It's a tie!")
  end

  prompt("The score is now #{player_score} for you and #{computer_score} for the computer!")

  if computer_score === 5
    prompt("The computer is the grand winner!")
    break
  elsif player_score === 5
    prompt("You are the grand winner!")
    break
  end

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()

  break unless answer.downcase().start_with?("y")
end

prompt("Thank you for playing! Goodbye!")
