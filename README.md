Hurricane
=========
# Quick Start
begin with this command:

rails new appname -m https://raw.github.com/jgnan1981/hurricane/master/project_template.rb  --skip-bundle

# Introduction to Hurricane
Hurricane is a study project for myself. After I learned Rails 3.2 I want to build up a helper for me to make myself building manager website much faster. With set of view helpers, generators, and page structures.

This project is just a glue-up project, I join bootstrap, haml, cancan, kaminari together, which I think is helpful for improving my working efficiency. I'm not going to provide the user model in this project as it'll for my employer. I'll create another one, so if we try to use this project we need to create our user model by your own. I think this will be reasonable for most existing project so the can enjoy their own model without any limitation.

As I mentioned above, this project is mainly responsible for the following function:
1. setup a project with a given script, with the things I want (not you want by now :p, but I'll try to let you choose your favorit baby in the future )
2. provide a layout and view helper function for fast function build-up
3. generator and template supporting our manager functions ( just add one more delete all function based on the rails basic RESTful APIs)

This readme will cover the following contents

* installation guide
* hurricane:init task
* hurricane task

So enjoy it ( Sorry, I just say this to myself....)

