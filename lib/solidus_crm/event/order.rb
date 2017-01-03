module SolidusCrm
  module Event
    class Order < Base
      def initialize(order, event)
        @order = order
        @event = event
      end

      def emit
        SolidusCrm::Connection.post(
          endpoint,
          Rabl::Renderer.json(
            @order,
            template,
            view_path: view_path,
            scope: view_context
          )
        )
      end

      private

      def template
        'spree/api/orders/show.v1'
      end

      def endpoint
        '/orders'
      end
    end
  end
end
