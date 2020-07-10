require 'colorize'
class GPFile
  attr_accessor :index, :name, :extension, :created_at, :modified_at, :accessed_at, :attributes
  def  initialize(filename)
    @index       = /\d+/.match(filename).to_s.to_i #Matchdata to string to integer
    @name        = File.basename(filename, ".*").sub(index.to_s, '')
    @extension   = File.extname(filename).sub(".", '')
    @created_at  = File.birthtime(filename)
    @modified_at = File.mtime(filename)
    @accessed_at = File.atime(filename)
    @interested  = filename.include?('##') ? true : false
     @name.sub!('##', '')
    @attributes  = filename.scan(/\(([^\)]+)\)/).last
     @name.sub!(/\(.*?\)/, '')
     @name.strip!
  end

  def display
    puts "- - - - - - - - - - - - - - - - - - - -"
    puts "#{@index}:"
    puts "    #{@name}".yellow
    puts "    #{@extension}"
    puts "    Created at: #{@created_at} /// Modified at: #{@modified_at}"
    puts "    #{@attributes.first unless @attributes.nil?}".cyan
  end

  def interested?
    #Returns true if filename contains'##' meaning ' You maybe look for it'
    @interested
  end

  def contain?(instring, options={})
    if @attributes.nil?
      return false
    else
      return @attributes.include?(instring) ? true : false
    end
  end

end