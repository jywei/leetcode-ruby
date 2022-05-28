# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
    hash = {}
    result = 0
    j = 1

    s.each_char.with_index do |str, index|
      if hash.key?(str)
         j = [hash[str] + 1, j].max
      end

      result = [index - j + 1, result].max
      hash[str] = index
    end

    result
end