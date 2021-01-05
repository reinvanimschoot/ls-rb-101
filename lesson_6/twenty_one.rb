BUST_TRESHOLD = 21
DEALER_STAY_TRESHOLD = 17

def join_and(array)
  joinable_elements = array.slice(0..-2)
  last_element = array.slice(-1)

  return last_element if joinable_elements.empty?

  joined_elements = joinable_elements.join(", ")

  "#{joined_elements} and #{last_element}"
end

def prompt(message)
  puts "=> #{message}"
end

def initialize_deck
  deck = []
  suit = (2..10).to_a + ["Jack", "Queen", "King", "Ace"]

  4.times do
    deck.concat(suit)
  end

  deck
end

def deal_cards_to_hand!(hand, deck, amount)
  cards = deck.shift(amount)

  hand.concat(cards)
end

def display_hands(player_hand, dealer_hand, turn = "player")
  system("clear")

  formatted_dealer_hand = turn == "player" ? [dealer_hand[0], "unknown card"] : dealer_hand

  puts ""
  prompt("Dealer has: #{join_and(formatted_dealer_hand)}")
  prompt("You have: #{join_and(player_hand)}")
  puts ""
end

def display_grand_total(dealer_card_value, player_card_value)
  prompt("Dealer has a total card value of #{dealer_card_value}.")
  prompt("Player has a total card value of #{player_card_value}.")
end

def calculate_card_value(hand)
  special_cards, base_cards = hand.partition { |card| ["Jack", "Queen", "King", "Ace"].include?(card) }

  face_card_count = special_cards.count { |card| card != "Ace" }
  aces_count = special_cards.count { |card| card == "Ace" }

  total_card_value = base_cards.sum

  face_card_count.times { total_card_value += 10 }

  aces_count.times do
    if total_card_value + 11 <= BUST_TRESHOLD
      total_card_value += 11
    else
      total_card_value += 1
    end
  end

  total_card_value
end

def card_value_exceeds_treshold(card_value)
  card_value > BUST_TRESHOLD
end

def ask_player_for_choice
  loop do
    prompt("What would you like to do?")
    prompt("D - Draw")
    prompt("S - Stay")

    choice = gets.chomp.strip.downcase

    break choice if choice == "d" || choice == "s"

    prompt("That doesn't seem like a valid option!")
  end
end

def play_again?
  prompt("Do you want to play again? (y or n)")

  answer = gets.chomp
  answer.downcase.start_with?("y")
end

def display_intro
  system("clear")
  prompt("Welcome To Twenty One!")
  prompt("Press any key to continue...")
  gets
end

# Game Loop

player_grand_score = 0
dealer_grand_score = 0

loop do
  deck = initialize_deck

  player_hand = []
  dealer_hand = []

  player_card_value = 0
  dealer_card_value = 0

  display_intro

  deck.shuffle!

  deal_cards_to_hand!(player_hand, deck, 2)
  deal_cards_to_hand!(dealer_hand, deck, 2)

  # Player Turn

  loop do
    display_hands(player_hand, dealer_hand)

    player_card_value = calculate_card_value(player_hand)

    break if player_card_value > BUST_TRESHOLD

    choice = ask_player_for_choice

    break if choice == "s"

    if choice == "d"
      deal_cards_to_hand!(player_hand, deck, 1)
    end
  end

  if card_value_exceeds_treshold(player_card_value)
    display_grand_total(dealer_card_value, player_card_value)

    prompt("You busted! The dealer wins!")
    dealer_grand_score += 1
    play_again? ? next : break
  end

  # Dealer Turn

  loop do
    display_hands(player_hand, dealer_hand, "dealer")

    dealer_card_value = calculate_card_value(dealer_hand)

    if dealer_card_value >= DEALER_STAY_TRESHOLD
      prompt("Dealer stays.")
      break
    end

    prompt("Dealer draws... Press any key to continue")
    gets

    deal_cards_to_hand!(dealer_hand, deck, 1)
  end

  if card_value_exceeds_treshold(dealer_card_value)
    display_grand_total(dealer_card_value, player_card_value)

    prompt("Dealer busted! The player wins!")
    player_grand_score += 1

    play_again? ? next : break
  end

  # Comparison Turn

  display_grand_total(dealer_card_value, player_card_value)

  if dealer_card_value < player_card_value
    player_grand_score += 1
    prompt("Player wins!")
  elsif player_card_value < dealer_card_value
    dealer_grand_score += 1
    prompt("Dealer wins!")
  else
    prompt("It's a tie!")
  end

  if dealer_grand_score == 5
    prompt("The dealer reached a grand total of 5 wins!")
    prompt("The house always wins...")
    break
  end

  if player_grand_score == 5
    prompt("The player reached a grand total of 5 wins!")
    prompt("The player bankrupted the house...")
    break
  end

  break unless play_again?
end

prompt("Thank you for playing Twenty One!")
