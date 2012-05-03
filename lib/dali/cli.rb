require 'yaml'
require 'pry'
require 'dali/engine'

module Dali
  class CLI
    # should take a layout, and an input file as an argument.
    # should spit out an index.html and an images.zip at run location
    def initialize
    end

    def run(args = ARGV)
      # catch argument errors
      if args.size != 2
        puts "ARGUMENT ERROR: script takes a content.yml and a layout file. Run `dali help` for details"
        exit
      end

      # help message
      if args[0].downcase == 'help'
        puts "`email-gen` looks for a content.yml, and a layout file (mustache template) with an images folder"
        exit
      end

      content = YAML.load_file(args[0]) rescue nil || ""
      if content.empty?
        puts "can't load content file"
        exit
      end

      # process content
      # content.each do | field |
      #   if field.match /.*slug$/
      #     field = content[field.sub('slug','')].downcase.gsub(/[^a-z1-9]+/, '').chomp('_')
      #   end
      # end

      template = File.open(args[1], 'r').read rescue nil || ""
      if template.empty?
        puts "can't load template file"
        exit
      end
      # process information
      @engine = Engine.new(template)
      @engine.process(content)
      # make file
      out_file = File.new("#{content['title']}.html", 'w')
      out_file << @engine.render
      out_file.close
      puts "Success! #{content['title']}.html has been created"
    end
  end
end
