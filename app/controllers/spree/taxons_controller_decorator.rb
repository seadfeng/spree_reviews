module Spree
    module TaxonsControllerDecorator
      def self.prepended(base)
        base.helper Spree::ReviewsHelper
      end
  
      ::Spree::TaxonsController.prepend self if ::Spree::Core::Engine.frontend_available?  
    end
end
  