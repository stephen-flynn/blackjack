class Hand
    attr_reader :score, :hand
  
    def initialize(player = 'Player', current_deck = [])
        @hand = current_deck.draw_hand
        @score = calculate_score
        @player = player

        puts_deal_card(@hand[0])
        puts_deal_card(@hand[1])
        puts_score
    end

    def deal_card(current_deck = [])
        card = current_deck.draw_card
        puts_deal_card(card)

        @hand << card
        puts "#{@player}'s hand is: #{@hand.join(' ')}"

        @score = calculate_score
        puts_score
    end

    def calculate_score
        # sub in 10 for J, Q or K characters
        mapped_counts = @hand.map { |card| card.gsub(/[JQK]/, '10')}

        # convert array of strings to integers and sum them to get the score total
        score = mapped_counts.map(&:to_i).inject(:+)

        # get count of aces by searching and counting the character 'A'
        aces_count = @hand.join('').count('A')

        # to calculate the ace, if the score total is < 11 then an ace is 11 otherwise it is 1
        aces_count.times { score += score < 11 ? 11 : 1 }

        score
    end

    private

    def puts_deal_card(card)
        puts "#{@player} was dealt #{card}"
    end

    def puts_score
        puts "#{@player}'s score: #{@score}" 
    end
end