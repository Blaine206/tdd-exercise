# Part 1: Identifying Edge & Nominal Cases
# With a partner talk through the following questions and write down answers.
#     What would be two nominal cases?
#     What edge cases can you determine? Name at least 3.
#     How would you test these cases?
# When you finish talk with another pair and walk through your answers.

# Part 2: Calculating a Score
# You will write a method called: blackjack_score which take an array of card values
# and returns the blackjack score. The card values can be any of the following,
# number values 1-9, "King", "Queen", "Jack".
# If the array contains an invalid card value or the total exceeds 21,
# raise an ArgumentError.
# For example blackjack_score([1, 5, 3]) will return 19.
# You should also raise an error if the hand contains more than 5 cards.
#
# In this exercise you will complete the given tests in test/blackjack_score_test.rb
# and updating the blackjack_score method in lib/blackjack_score.rb to make it pass.
#
# Step 1: Complete the given test Step 2: Update blackjack_score to pass the test
# Step 3: Move to the next test
#

# blackjack_score.rb

VALID_CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']


def blackjack_score(hand)
  score = 0
  face_cards = ["Jack", "Queen", "King"]
  aces = 0
  hand.each do |card|
    if VALID_CARDS.include?(card)
      if face_cards.include?(card)
        card = 10
      elsif card == "Ace"
        card = 0
        aces += 1
      end
      if score + card > 21
        raise ArgumentError.new(`Yo Busta Rhymes, you played yo'self. Don't exceed 21.`)
      end
      score += card
    else
      raise ArgumentError.new("Nah Playa `#{card}` ain't the one. Stick with valid card inputs.")
    end
  end
  aces.times do
    if score + 11 <= 21
      score += 11
    elsif score >= 11 || score <= 20
      score += 1
    else
      raise ArgumentError.new(`Yo Busta Rhymes, you played yo'self. Don't exceed 21.`)
    end
  end
  return score
end


