require 'bundler/setup'
require 'minitest/autorun'
require 'minitest/unit'

Dir[File.dirname(__FILE__) + '/../lib/**/*.rb'].each do |rb_file|                                                   
   require rb_file
end
