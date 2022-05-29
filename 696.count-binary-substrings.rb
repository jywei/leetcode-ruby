# @param {String} s
# @return {Integer}
# Time exceed
def count_binary_substrings(s)
   string_size = s.length
    binary_multiplier = string_size / 2
    patterns = []

    binary_multiplier.times.with_index(1) do |_time, index|
      patterns << "1" * index + "0" * index
      patterns << "0" * index + "1" * index
    end

    counter = 0
    patterns.each do |pattern|
      if (count = s.scan(/(?=#{pattern})/).length)
          counter += count
      end
    end

    counter
end


def count_binary_substrings(s)
  count = 0
  previous = 0
  current = 1

  # "11000110"
  (1..s.length).each do |chr|
    if s[chr - 1] != s[chr]
      count += [previous, current].min
      previous = current
      current = 1
    else
      current += 1
    end
  end

  count + [previous, current].min
end
# count_binary_substrings("00110011")
# count_binary_substrings("10101")