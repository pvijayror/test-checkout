FactoryGirl.define do

  factory :product, :class => Product do |p|
    p.name Faker::Lorem.words
    p.product_code Faker::Lorem.words
    p.price 10.00

    p.created_at Time.now
  end

  factory :checkout, :class => Checkout do |c|
    c.created_at Time.now
  end

  factory :pricing_rule, :class => PricingRule do |pr|
    pr.discount_type "bulk"
    pr.bulk_price 8.00
    pr.association :product

    pr.created_at Time.now
  end

  factory :transaction, :class => Transaction do |tr|
    tr.association :checkout
    tr.association :product
    tr.no_of_items 1
    tr.created_at Time.now
  end


end