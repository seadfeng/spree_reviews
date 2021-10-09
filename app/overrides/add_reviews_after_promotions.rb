Deface::Override.new(
  virtual_path: 'spree/products/show',
  name: 'converted_promotions',
  insert_after: '[data-hook="promotions"]',
  partial: 'spree/shared/reviews'
)
