require 'cancancan'

module SolidusCrm
  module Event
    class Base < AbstractController::Base
      include AbstractController::Rendering
      include AbstractController::Helpers
      include AbstractController::Translation

      def emit
        raise NotImplementedError
      end

      protected

      def view_context
        ViewContext.instance
      end

      def view_path
        Spree::Api::Engine.root.join('app', 'views')
      end

      class ViewContext
        include Singleton
        include ::Spree::Api::ApiHelpers

        mattr_reader :current_ability

        def initialize
          @current_user_roles = []
        end

        def current_ability
          Object.new.extend(CanCan::Ability)
        end
      end
    end
  end
end
