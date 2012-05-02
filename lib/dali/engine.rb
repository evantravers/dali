require 'mustache'
require 'yaml'

module Dali
  def render (template, content)
    output_text = Mustache.render(template, content)
    output = File.new("#{content['title']}.html", 'w')
    output << output_text
    output.close
  end
end
