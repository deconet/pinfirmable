module Pinfirmable
  class Engine < ::Rails::Engine
    config.to_prepare do
      Rails.application.config.assets.precompile += %w(
        loader.gif
      )
    end

    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s
        config.paths["db/migrate"].expanded.each do |expanded_path|
          app.config.paths["db/migrate"] << expanded_path
        end
      end
    end
  end
end
