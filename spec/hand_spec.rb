require './app/hand'
require './app/deck'

describe "calculate_score" do
  it "correctly calculates score from two numbers" do
    deck = Deck.new
    allow(deck).to receive(:draw_hand).and_return(['6♦', '5♥'])
    current_hand = Hand.new('Player 1', deck)

    score = current_hand.calculate_score
    expect(score).to eq(11)
  end

  it "correctly calculates score from two numbers and an Ace" do
    deck = Deck.new
    allow(deck).to receive(:draw_hand).and_return(['5♦', '6♥'])
    allow(deck).to receive(:draw_card).and_return('A♥')
    current_hand = Hand.new('Player 1', deck)

    #hit 1
    current_hand.deal_card(deck)

    score = current_hand.calculate_score
    expect(score).to eq(12)
  end

  it "correctly calculates score from two numbers and two Aces" do
    deck = Deck.new
    allow(deck).to receive(:draw_hand).and_return(['4♦', '5♥'])
    allow(deck).to receive(:draw_card).and_return('A♥')
    allow(deck).to receive(:draw_card).and_return('A♦')

    current_hand = Hand.new('Player 1', deck)

    #hit 1
    current_hand.deal_card(deck)
    #hit 2
    current_hand.deal_card(deck)

    score = current_hand.calculate_score
    expect(score).to eq(21)
  end

end