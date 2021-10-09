module Spree::ReviewsHelper
  # This method is unused in the spree_reviews extension
  # by default, but could be used in custom view setups.
  def star(the_class)
    content_tag(:span, ' &#10030; '.html_safe, class: the_class)
  end

  # This method is unused in the spree_reviews extension
  # by default, but could be used in custom view setups.
  def mk_stars(m)
    (1..5).collect { |n| n <= m ? star('lit') : star('unlit') }.join
  end

  def txt_stars(n, show_out_of = true)
    res = Spree.t(:star, count: n)
    res += " #{Spree.t('out_of_5')}" if show_out_of
    res
  end

  def reviews_structured_hash(product) 
    return {} unless product.reviews.any? 
    return {} unless product.reviews.approved.any? 

    reviews = product.reviews.approved
    reviews_hash = reviews.map do |review|
      structured_review_hash(review) 
    end

    { 
     'review': reviews_hash,
     'aggregateRating': aggregate_rating_structured_data(product)
    }
  end

  def aggregate_rating_structured_data(product)
     {
      "@type": "AggregateRating",
      "ratingValue": product.avg_rating,
      "bestRating": product.best_rating,
      "ratingCount": product.reviews_count
    }
  end

  def structured_review_hash(review) 
      { 
        '@type': 'Review',
        'reviewRating':  {
          "@type": "Rating",
          "ratingValue": review.rating
        },
        "author": {
          "@type": "Person",
          "name": review.name
        },
        "reviewBody": review.review
      } 
  end

end
