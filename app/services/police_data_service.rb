class PoliceDataService
  def street_level_crimes_data(json_data)
    crimes_hash=to_hash(json_data)
    # manipulate hash data
    # exp: {antisocial: 221, violent: 35 }
    total_crimes_per_categaory = crimes_hash.each_with_object(Hash.new(0)) { |h1, h2| h2[h1["category"]] += 1 }
    # sort by number of crimes in desending order
    total_crimes_per_categaory = total_crimes_per_categaory.sort_by {|_key, value| value}.reverse.to_h
    # total crimes 
    total_crimes_committed = crimes_hash.count
    # convert hash to array of hashes
    # exp: [{category: "antisocial", total: 221},{category: "violent", total: 35}]
    statistics = total_crimes_per_categaory.collect {|key,value| {category: key,total: value}}
    # return array of hashes
    hash = {total: total_crimes_committed, statistics: statistics}
    hash_array = []
    hash_array.push(hash)
  end
  
  def to_hash(json)
    JSON.parse(json)
  end
end