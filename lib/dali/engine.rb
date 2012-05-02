require 'mustache'

module Dali
  module Engine
    extend self
    def render(template, content)
      output_text = Mustache.render(template, content)
      output = File.new("#{content['title']}.html", 'w')
      output << output_text
      output.close
    end
  end
end
