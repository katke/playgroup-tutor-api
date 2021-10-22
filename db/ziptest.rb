filedata = File.open("zipcodelist.csv").readlines.map(&:chomp)
filedata.each { |line_of_data|
  array = line_of_data.split(",")
  zip_hash[array[0]] = [array[1].to_f, array[2].to_f]
  Zipcode.create!(zipcode: array[0], latitude: array[1].to_f, longitude: array[2].to_f)
}
