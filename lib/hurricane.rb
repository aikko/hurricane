require 'cancan/ability_helper'
require 'helper/ui_component_helper'

module Hurricane
  ActionView::Base.send :include, UiComponentHelper
end
