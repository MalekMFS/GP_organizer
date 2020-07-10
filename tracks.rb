require './gp_file'
require 'colorize'
class Tracks
  def initialize
    @tracks = []
    puts "Started reading files...".yellow
    Dir.glob("*.g*") do |filename|
      #FIXME missing v2-v3 files!
      @tracks[GPFile.new(filename).index] = GPFile.new(filename)
      #tracks<< GPFile.new(filename)
    end
    puts "Finished reading files!".yellow
  end


  def display_all
    @tracks.each do |track|
      track.display
    end
  end

  def search(instring, options={})
    selected = []
    count = 0
    @tracks.each do |track|
      if !track.nil? && track.in_attributes?(instring, options)
        selected << track
        count += 1
      end
    end
     selected.each do |s|
       s.display
     end
     puts "\nFound #{count} tabs."
  end

end
