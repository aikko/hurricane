module Hurricane
  module Generators
    class HurricaneGenerator < Rails::Generators::NamedBase
      include Rails::Generators::ResourceHelpers

      namespace "hurricane"
      source_root File.expand_path("../templates",__FILE__)

      desc "generate a model with the given NAME with hurricane"

      hook_for :orm

    end
  end
end
