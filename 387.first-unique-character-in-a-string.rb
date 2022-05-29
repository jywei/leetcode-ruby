# @param {String} s
# @return {Integer}
def first_uniq_char(s)
    log = {}
    s.each_char.each do |char|
       if log.key?(char)
           log[char] += 1
       else
           log[char] = 1
       end
    end

    s.each_char.with_index do |char, index|
        if log[char] == 1
            return index
        end
    end

    -1
end
