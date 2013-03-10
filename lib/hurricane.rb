require 'hurricane/cancan/ability_helpers'
require 'hurricane/helper/ui_component_helper'

module Hurricane
  ActionView::Base.send :include, UiComponentHelper
end
