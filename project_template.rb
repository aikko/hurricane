gem 'hurricane', '=0.0.1'

generate 'hurricane:init'

inside Rails.root do
  run "bundle install"
end

puts <<TODOS
Hurricane initialization completed.

Please run: 
rails g hurricane MODEL [attributes]

to setup your user model and the admin functions
TODOS
