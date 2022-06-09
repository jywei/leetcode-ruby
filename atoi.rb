=begin
  Take a string which represents an integer, and convert it to a number.

  Notes and assumptions:
    * The input will contain only digits, optionally starting with + or -
    * The input would not exceed any integer limits
    * You cannot use any in-built functionality that achieves this *exact* task, including:
      - wrapping inside Integer()
      - to_i, to_f etc.
      - forcing implicit conversion
    * Using any Math function is fine.
=end

# @param {String} str
# @return {Integer}
def my_atoi(str)
  offset = 48

  converted_array = str.bytes.map { |ele| ele - offset }

  unless converted_array.include? -3
    converted_array.reduce do |sum, i|
      sum * 10 + i
    end
  else
    ans = converted_array.reduce(0) do |sum, i|
      if i == -3
        i = 0
      end

      sum * 10 + i
    end

    ans * -1
  end

end

# No need to edit below this line

puts "#{my_atoi("123")} should be equal to 123"
puts "#{my_atoi("-50")} should be equal to -50"
