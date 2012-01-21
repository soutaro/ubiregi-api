require 'haml'
require 'pp'
require 'optparse'
require "pathname"

$Layout = "= yield"
$Output = Pathname(".")

OptionParser.new do |opt|
  opt.on("--layout layout") {|layout| $Layout = Pathname(layout).read }
  opt.on("--output dir"){|output| $Output = Pathname(output) }
  opt.parse!(ARGV)
end

class Context 
  attr_accessor :current_path

  def link_to(name, url = nil)
    url = name unless url
    "<a href='#{url}'>#{name}</a>"
  end
end

ARGV.each do |file|
  path = Pathname(file)
  
  context = Context.new
  context.current_path = path
  
  content = Haml::Engine.new($Layout).render(context) do
    Haml::Engine.new(path.read).render(context)
  end
  
  output_path = $Output + Pathname(path.basename.to_s.gsub(/#{path.extname}$/, '.html'))
  puts output_path
  output_path.open('w') {|io| io.write(content) }
end
