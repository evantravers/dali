require 'mustache'

module Dali
  module Engine
    extend self
    def render(template, content)
      return output_text = Mustache.render(template, content)
    end
  end
end
