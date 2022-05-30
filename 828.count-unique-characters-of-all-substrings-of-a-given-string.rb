# @param {String} s
# @return {Integer}
def unique_letter_string(s)
    total = 0
    outer_hash = {}

    s.each_char.with_index do |_char, i|
      s.each_char.with_index do |_sub_char, j|
        next if (word = s[i..j]).empty?

        if outer_hash[word]
          count = outer_hash[word]
        else
          count = count_unique_chars(word)
          outer_hash[word] = count
        end

        total += count
      end
    end

    total
end

def count_unique_chars(s)
  hash = {}
  s.each_char do |char|
    if hash[char]
      hash[char] += 1
    else
      hash[char] = 1
    end
  end

  total = 0
  hash.values.each { |v| total += 1 if v == 1 }

  total
end



# "LEETCODE"
def unique_letter_string(s)
  hash = ('A'..'Z').map { |c| [c, [-1, -1]] }.to_h
  # {
  #   "A"=>[-1, -1], "B"=>[-1, -1], "C"=>[-1, -1], "D"=>[-1, -1], "E"=>[-1, -1], "F"=>[-1, -1], "G"=>[-1, -1],
  #   "H"=>[-1, -1], "I"=>[-1, -1], "J"=>[-1, -1], "K"=>[-1, -1], "L"=>[-1, -1], "M"=>[-1, -1], "N"=>[-1, -1],
  #   "O"=>[-1, -1], "P"=>[-1, -1], "Q"=>[-1, -1], "R"=>[-1, -1], "S"=>[-1, -1], "T"=>[-1, -1], "U"=>[-1, -1],
  #   "V"=>[-1, -1], "W"=>[-1, -1], "X"=>[-1, -1], "Y"=>[-1, -1], "Z"=>[-1, -1]
  # }
  sum = 0
  s.each_char.with_index do |c, i|
    k, j = hash[c]
    sum += (i - j) * (j - k)
    hash[c] = [j, i]
  end

  # {
  #   "A"=>[-1, -1], "B"=>[-1, -1], "C"=>[-1, 4], "D"=>[-1, 6], "E"=>[2, 7], "F"=>[-1, -1], "G"=>[-1, -1],
  #   "H"=>[-1, -1], "I"=>[-1, -1], "J"=>[-1, -1], "K"=>[-1, -1], "L"=>[-1, 0], "M"=>[-1, -1], "N"=>[-1, -1],
  #   "O"=>[-1, 5], "P"=>[-1, -1], "Q"=>[-1, -1], "R"=>[-1, -1], "S"=>[-1, -1], "T"=>[-1, 3], "U"=>[-1, -1],
  #   "V"=>[-1, -1], "W"=>[-1, -1], "X"=>[-1, -1], "Y"=>[-1, -1], "Z"=>[-1, -1]
  # }
  hash.each do |c, (k, j)|
    sum += (s.length - j) * (j - k)
  end
  sum
end
