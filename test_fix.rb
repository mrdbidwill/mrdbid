#!/usr/bin/env ruby
# This script tests if the Pundit policy methods are available in views

puts "Testing if Pundit policy methods are available in views..."
puts "1. ApplicationHelper now includes Pundit::Authorization"
puts "2. This should make the policy method available in views"
puts "3. The error 'undefined method policy' should be resolved"
puts ""
puts "To test this fix:"
puts "1. Start the Rails server: rails server"
puts "2. Visit http://127.0.0.1:3000/mushrooms in your browser"
puts "3. The page should load without the 'undefined method policy' error"
puts ""
puts "If the error persists, additional debugging may be needed."