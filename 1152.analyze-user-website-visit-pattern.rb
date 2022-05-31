# @param {String[]} username
# @param {Integer[]} timestamp
# @param {String[]} website
# @return {String[]}
def most_visited_pattern(username, timestamp, website)
    # sorted_hash = {}
    # timestamp.each_with_index do |time, index|
    #     sorted_hash[time] ||= []
    #     sorted_hash[time] << username[index]
    #     sorted_hash[time] << website[index]
    # end
    # visited_hash = {}
    # sorted_hash.sort.to_h.values.each do |pair|
    #     visited_hash[pair.first] ||= []
    #     visited_hash[pair.first] << pair.last
    # end


    visited_hash = {}
    username.each_with_index do |user, index|
        visited_hash[user] ||= []
        visited_hash[user] << website[index]
    end
    three_seq = []
    visited_hash.each do |_u, w|
        three_seq += possible_3_sets(w)
    end

    max_hash = Hash.new(0)
    max = 0
    patterns = []

    three_seq.each do |seq|
        max_hash[seq] += 1
        current = max_hash[seq]

        if current > max
            max = current
            patterns = [seq]
        elsif current == max
            patterns << seq
        end
    end

    patterns.count == 1 ? patterns.first : patterns.sort.first
end

def possible_3_sets(v)
  triplets = []
  if v.length == 3
    triplets += [v]
  elsif v.length > 3
    triplets += v.combination(3).to_a
  end
  triplets
end

username = ["h","eiy","cq","h","cq","txldsscx","cq","txldsscx","h","cq","cq"]
timestamp = [527896567,334462937,517687281,134127993,859112386,159548699,51100299,444082139,926837079,317455832,411747930]
website = ["hibympufi","hibympufi","hibympufi","hibympufi","hibympufi","hibympufi","hibympufi","hibympufi","yljmntrclw","hibympufi","yljmntrclw"]