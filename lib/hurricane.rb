require 'cancan/ability_helpers'
require 'helper/ui_component_helper'
require 'hurricane/controllers/login_required_controller'

module Hurricane
  ActionView::Base.send :include, UiComponentHelper
end
