class Deck
    attr_reader :deck

    def initialize
        suits = ['♥', '♦', '♠', '♣']
        numbers = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
        @deck = numbers.product(suits).map {|card| card.join('')}.shuffle
    end

    def draw_hand
        [draw_card, draw_card]
    end

    def draw_card
        @deck.shift
    end
end