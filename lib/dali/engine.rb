require 'mustache'
require 'redcarpet'

module Dali
  extend self
  class Engine < Mustache
    def initialize temp
      @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
      @template = temp
    end

    def process dictionary
      # build a method for each field
      dictionary.each do | content_field |
        method_name, value = content_field.first, content_field.last
        self.class.class_eval do
          define_method method_name do
            # magic
            if method_name.match(/_markdown$/)
              @markdown.render(value)
            else
              value
            end
          end
        end
      end
    end
  end

  module HelperMethods
    def title_slug
      self[:title].downcase.gsub(/[^a-z1-9]+/, '').gsub('&','and').chomp('_')
    end
  end
end
