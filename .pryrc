# vim:ft=ruby
%w(coolline).each do |e|
  puts "Skipping coolline"
  Pry.plugins[e].disable!
end
def m o; o.methods.sort - Object.methods end
def c m
  Dir.chdir ENV['HOME']+'/pkg/ruby' do
    system 'vim', '-t', m
  end
end
