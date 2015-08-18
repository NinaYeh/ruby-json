require 'json'

jsonFile = File.read('data.json')
data_hash = JSON.parse(jsonFile)

data_hash.each do |data|
  data['organization'] = "#{data['location']}#{data['school']}"
  data['name'] = "#{data['organization']}管理員"
  data['account'] = "mocpopmusic@#{data['url']}"
  data.delete("location")
  data.delete("school")
  data.delete("url")
end

File.open('output.json', 'w') do |f|
  f.write(JSON.pretty_generate(data_hash))
end


