gem 'hurricane', '=0.0.1'#,:git => 'git://github.com/jgnan1981/hurricane.git'

puts <<TODOS
Hurricane initialization completed.

To setup your project, first run this command:
rails g hurricane:init

It'll help you to import everything that hurricane need. After doing so , you should build up your own user model before your first run:
rails g hurricane MODEL [attributes]

to setup your user model and the admin functions
TODOS
