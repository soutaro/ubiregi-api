require 'haml'
require 'pp'
require 'optparse'
require "pathname"

class Context 
  attr_reader :sources
  attr_accessor :current_path

  def initialize
    @sources = []
  end

  def link_to(name, url = nil)
    url = name unless url
    "<a href='#{url}'>#{name}</a>"
  end

  def image_tag(name)
    "<img src='images/#{name}'>"
  end

  def render(name)
    current_source = self.source
    new_source = self.source.parent + Pathname(name+".haml")
    self.convert_source(new_source)
  end

  def push_source(src)
    self.sources.push(src)
  end

  def source
    self.sources.last
  end

  def pop_source
    self.sources.pop
  end

  def convert_source(path)
    begin
      self.push_source path
      Haml::Engine.new(path.read).render(self)
    ensure
      self.pop_source
    end
  end

  def readonly(x = "")
    "#{x} <span class='label notice'>Readonly</span>"
  end

  def optional(y = "")
    "#{y} <span class='label warning'>Optional</span>"
  end

  def field(name, *options)
    a = name
    b = options.map {|option|
      case option
      when :optional
        "<span class='label optional'>Optional</span>"
      when :readonly
        "<span class='label readonly'>Readonly</span>"
      when :writeonly
        "<span class='label writeonly'>Writeonly</span>"
      when :immutable
        "<span class='label immutable'>immutable</span>"
      end
    }.join(" ")
    a + " " + b
  end
end

ARGV.each do |file|
  path = Pathname(file)
  
  context = Context.new
  context.current_path = path
  
  content = Haml::Engine.new("= yield").render(context) do
    context.convert_source(path)
  end
  
  puts content
end
