module Spree
  module ProductsControllerDecorator
    def self.prepended(base)
      base.helper Spree::ReviewsHelper
    end

    ::Spree::ProductsController.prepend self if ::Spree::Core::Engine.frontend_available?  
  end
end
