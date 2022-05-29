# @param {Integer[]} nums
# @return {Integer}
def sub_array_ranges(nums)
    total = 0

    nums.each_with_index do |num, i|
       smallest = num
       largest = num

       nums[i..].each do |j|
           smallest = [smallest, j].min
           largest = [largest, j].max
           total += largest - smallest
       end
    end

    total
end
