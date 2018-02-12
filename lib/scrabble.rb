require 'pry'
class Scrabble

  def initialize
    @point_values = {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
    }
  end

  def score_letter(letter)
    @point_values[letter.upcase]
  end

  def score(word)
    return 0 if word == "" || word == nil
    word_array = word.upcase.chars.map do |word|
      @point_values[word]
    end.sum
  end

  def score_with_multipliers(word, multipliers, word_multiplier = 1)
   word_array = word.upcase.chars.map do |word|
     @point_values[word]
   end
    score = [word_array, multipliers].transpose.map {|x| x.reduce :*}
    subtotal = score.sum
    subtotal * word_multiplier
    return subtotal += 10 if word.length >= 7
  end
end
