# Time: O(n)
# Space: O(n)
def two_sum(nums, target)
    hash = {}
    nums.each_with_index do |num, index|
      val = target - num
      if hash.key?(val)
        return [hash[val], index]
      else
        hash[num] = index
      end
    end
    return nil
end

two_sum([2,7,11,15], 9)
