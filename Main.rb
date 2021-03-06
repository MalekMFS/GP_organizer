require './gp_file'
require './tracks'
require 'yaml'

config = YAML.load_file('config.yml')
path = config['tabs_path']
Dir.chdir(path)
#puts Dir.pwd
# track = tracks[469]
#  puts track.display
# puts track.interested?
# puts tracks[215].name.empty?

tracks = Tracks.new#Initialize

loop do
  puts "Menu:\n 0:Exit\n 1:Display all\n 2:Search in attributes".cyan
  puts "Whats your answer?"
  input = gets.chomp
  case input
    when "1" #Display all
      tracks.display_all
    when "2"
      puts "Enter a string to find:"
      key = gets.chomp
      tracks.search(key, {attributes: true, name: true})
    when "0"
      puts "Goodbye!"
      break
    else
      puts "Wrong Input! Try again."
  end
end
