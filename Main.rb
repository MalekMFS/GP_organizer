require './gp_file'
require './tracks'
# require 'colorize'
Dir.chdir("C:/Users/MalekMFS/Documents/@My Music/Tab/0My Tab0")
#puts Dir.pwd
# track = tracks[469]
#  puts track.display
# puts track.interested?
# puts tracks[215].name.empty?

tracks = Tracks.new#Initialize

loop do
  puts "Menu:\n 0:Exit\n 1:Display all\n 2:Find by key".cyan
  puts "Whats your answer?"
  input = gets.chomp
  case input
    when "1" #Display all
      tracks.display_all
    when "2"
      puts "Enter string to find:"
      key = gets.chomp
      tracks.search(key, {attributes: true, name: true})
    when "0"
      puts "Goodbye!"
      break
    else
      puts "Wrong Input! Try again."
  end
end