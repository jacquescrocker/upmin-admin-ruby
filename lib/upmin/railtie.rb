module Upmin
  require 'rails'
  class Railtie < Rails::Railtie
    initializer('upmin.insert_into_active_record') do
      if defined?(::ActiveRecord)
        ActiveSupport.on_load(:active_record) do
          ::ActiveRecord::Base.send(:include, Upmin::Railties::ActiveRecord)
          # ::ActiveRecord::Relation.send(:include, Upmin::ActiveRecordRelation)
        end
      end

      ActiveSupport.on_load(:action_controller) do
        ::ActionController::Base.send(:include, Upmin::Railties::Render)
      end

      ActiveSupport.on_load(:action_view) do
        ::ActionView::Base.send(:include, Upmin::Railties::Render)
      end
    end
  end
end
