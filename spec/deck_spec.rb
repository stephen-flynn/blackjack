require './app/deck'

describe "A deck" do
  it "contains 52 cards" do
    deck = Deck.new
    expect(deck.deck.size).to eq(52)
  end

  it "draws two cards when draw_hand is called" do
    deck = Deck.new
    cards = deck.draw_hand
    expect(cards.size).to eq(2)
  end

  it "draws one card when hit is called" do
    deck = Deck.new
    card = deck.draw_card
    expect(card).to be_a(String)
    expect(card.length).to be(2)   
  end

end