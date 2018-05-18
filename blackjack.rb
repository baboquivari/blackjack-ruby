# create a random deck, ignore suits, A is 1
def generateDeck()
  deck = []
  numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
  
  while deck.length < 52 do
    numbers.shuffle.each do |number|
      deck.push number
    end
  end
  
  return deck
end

# not pure but OH WELL - can refactor later
def promptPlayer(hand, playerScore, dealerHand, dealerScore)
  puts "Dealer's hand: #{dealerHand} (#{dealerScore})"
  puts "Your hand: #{hand} (#{playerScore})"
  puts "Stick or twist? Hit S or T"
  return gets.strip.downcase  
end

#######################################################

# generate a fresh deck
deck = generateDeck()

hand = []
dealerHand = []

# deal cards... I could make this cleaner and less imperative
hand.push deck.shift
hand.push deck.shift
dealerHand.push deck.shift

playerScore = hand.inject(0){|sum,x| sum + x} # sum the array
dealerScore = dealerHand.inject(0){|sum,x| sum + x}

while playerScore < 21 do
  # has dealer got a blackJack straight away??
  if dealerScore == 21
    puts 'DEALER HAS BLACKJACK - YOU LOSE, SUCKER!'
    return
  end
  
  response = promptPlayer(hand, playerScore, dealerHand, dealerScore)
  
  if response == "t"
    # pull new card off the deck and add to players hand
    hand.push deck.shift
    
    playerScore = hand.inject(0){|sum,x| sum + x}
    
    # check if player has BUST
    if playerScore > 21
      print "Final Hand: #{hand} (#{playerScore}) --- You lose, SUCKER!"
    end
    
  else # if you stuck
    puts 'You STUCK...'
    
    # draw a new card for the dealer
    dealerHand.push deck.shift
    dealerScore = dealerHand.inject(0){|sum,x| sum + x}
    
    if dealerScore > playerScore && dealerScore < 22
      puts "Dealer's hand: #{dealerHand} (#{dealerScore})"
      puts "Your hand: #{hand} (#{playerScore})"
      puts 'DEALER WINS!!!'
      return
    else
      puts "Dealer's hand: #{dealerHand} (#{dealerScore})"
      puts "Your hand: #{hand} (#{playerScore})"
      puts 'YOU WIN!'
      break
    end
    
    next
  end
end

# check for blackjack
if (playerScore == 21)
  puts "21 - BLACKJACK BABY!! You win!!"
end
