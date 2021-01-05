require "pry"

INITIAL_MARKER = " "
PLAYER_MARKER = "X"
COMPUTER_MARKER = "O"
PLAYERS = { 1 => "player", 2 => "computer" }

FIRST_MOVE = "choose"

LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
        [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
        [[1, 5, 9], [3, 5, 7]]

def prompt(message)
  puts "=> #{message}"
end

def display_board(board, player_score, computer_score)
  system("clear")

  puts ""
  puts ""
  puts "+-------------------------------------+"
  puts "| Player Score: #{player_score} - Computer Score: #{computer_score} |"
  puts "+-------------------------------------+"
  puts ""
  puts "(Player: #{PLAYER_MARKER} - Computer: #{COMPUTER_MARKER})"
  puts ""
  puts "     |     |"
  puts "  #{board[1]}  |  #{board[2]}  |  #{board[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board[4]}  |  #{board[5]}  |  #{board[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board[7]}  |  #{board[8]}  |  #{board[9]}"
  puts "     |     |"
  puts ""
end

def initialize_board
  new_board = {}

  (1..9).each { |num| new_board[num] = INITIAL_MARKER }

  new_board
end

def joinor(array, delimiter = ", ", join_word = "or")
  joinable_elements = array.slice(0..-2)
  last_element = array.slice(-1)

  return last_element if joinable_elements.empty?

  joined_elements = joinable_elements.join(delimiter)

  "#{joined_elements} #{join_word} #{last_element}"
end

def empty_squares(board)
  board.keys.select { |num| board[num] == INITIAL_MARKER }
end

def player_places_piece!(board)
  square = loop do
    prompt("Choose a square (#{joinor(empty_squares(board))}):")
    square = gets.chomp.to_i

    break square if empty_squares(board).include?(square)

    prompt("Sorry, that's not a valid choice!")
  end

  board[square] = PLAYER_MARKER
end

def computer_places_piece!(board)
  square = 5 if board[5] == INITIAL_MARKER

  square = find_winning_square(board) unless square

  square = find_at_risk_square(board) unless square

  square = empty_squares(board).sample unless square

  board[square] = COMPUTER_MARKER
end

def find_winning_square(board)
  LINES.each do |line|
    computer_squares, other_squares = line.partition { |square| board[square] === COMPUTER_MARKER }

    computer_has_two_squares = computer_squares.length == 2
    other_square_is_empty = board[other_squares.first] == INITIAL_MARKER

    if computer_has_two_squares && other_square_is_empty
      return other_squares.first
    end
  end

  nil
end

def find_at_risk_square(board)
  LINES.each do |line|
    player_squares, other_squares = line.partition { |square| board[square] === PLAYER_MARKER }

    player_has_two_squares = player_squares.length == 2
    other_square_is_empty = board[other_squares.first] == INITIAL_MARKER

    if player_has_two_squares && other_square_is_empty
      return other_squares.first
    end
  end

  nil
end

def detect_winner(board)
  LINES.each do |line|
    if line.all? { |square| board[square] == PLAYER_MARKER }
      return "Player"
    elsif line.all? { |square| board[square] == COMPUTER_MARKER }
      return "Computer"
    end
  end

  nil
end

def board_full?(board)
  empty_squares(board).empty?
end

def someone_won?(board)
  !!detect_winner(board)
end

def place_piece!(board, current_player)
  if current_player == "player"
    player_places_piece!(board)
  else
    computer_places_piece!(board)
  end
end

def get_starting_player
  starting_player = loop do
    prompt("Which player should have the first move? (1: player - 2: computer)")

    input = gets.chomp.to_i

    if input == 1 || input == 2
      break PLAYERS[input]
    end

    prompt("That doesn't seem like a valid input!")
  end

  starting_player
end

def alternate_player(current_player)
  current_player == "player" ? "computer" : "player"
end

player_score = 0
computer_score = 0
current_player = nil

loop do
  if FIRST_MOVE == "choose"
    current_player = get_starting_player
  else
    current_player = FIRST_MOVE
  end

  board = initialize_board

  display_board(board, player_score, computer_score)

  loop do
    display_board(board, player_score, computer_score)

    place_piece!(board, current_player)

    current_player = alternate_player(current_player)

    break if someone_won?(board) || board_full?(board)
  end

  display_board(board, player_score, computer_score)

  if someone_won?(board)
    winner = detect_winner(board)

    case winner
    when "Computer" then computer_score += 1
    when "Player" then player_score += 1
    end

    display_board(board, player_score, computer_score)

    prompt("#{winner} won!")

    if computer_score === 5 || player_score === 5
      prompt("And #{winner} was the first to get 5 wins!")
      break
    end
  else
    prompt("It's a tie!")
  end

  prompt("Do you want to play again? (y or n)")
  answer = gets.chomp

  break unless answer.downcase.start_with?("y")
end

prompt("Thank you for playing Tic Tac Toe!")
