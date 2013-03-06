gem 'hurricane', '=0.0.1'#,:git => 'git://github.com/jgnan1981/hurricane.git'
run "bundle install"

generate 'hurricane:init'

puts <<TODOS
Hurricane initialization completed.

Please run: 
rails g hurricane MODEL [attributes]

to setup your user model and the admin functions
TODOS
