require 'stringio'
require_relative('deck')
require_relative('hand')

WINNING_SCORE = 21
DEALER_THRESHOLD = 17

class BlackJack 
    def initialize

        puts "Welcome to BlackJack, Please enter your name..."
        @name = gets.chomp.capitalize

        @input = nil
        @gone_bust = false
        @current_deck = Deck.new
        @players_hand = Hand.new(@name, @current_deck)
        @dealers_hand = Hand.new("Dealer", @current_deck)

        # the game will stay in players_turn until they Stay or until the game is over
        players_turn

        if @gone_bust == false
            dealers_turn
        end
    end

    def players_turn
        until @input == "S"
            if [@players_hand.score, @dealers_hand.score].include?(WINNING_SCORE)

                message = @players_hand.score == WINNING_SCORE ? 
                    "You scored #{WINNING_SCORE}, #{player_won}" : 
                    "The Dealer scored #{WINNING_SCORE}, #{player_lost}"

                puts message
                break
            end

            puts "#{@name} - Hit (H) or Stay (S)?"
            @input = gets.chomp.capitalize

            if @input == "H"
                @players_hand.deal_card(@current_deck)
            elsif @input != "S"
                puts "Invalid input"
            end

            if @players_hand.score > WINNING_SCORE
                puts "Bust, #{player_lost}"
                @input = "S"
            end     
        end
    end

    def dealers_turn

        until @dealers_hand.score > @players_hand.score || @dealers_hand.score >= DEALER_THRESHOLD
            @dealers_hand.deal_card(@current_deck)
        end

        if @dealers_hand.score <= WINNING_SCORE
            puts "Dealer stays" 
            puts @dealers_hand.score > @players_hand.score ? player_lost : player_won
        else
            puts "Dealer is bust, #{player_won}"
        end
    end

    def player_won
        @gone_bust = nil
        "You win!"
    end

    def player_lost
        @gone_bust = true
        "You lost :("
    end
end

# Run the game
BlackJack.new
