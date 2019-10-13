class Dish
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :price, type: Float

  embedded_in :restaurant

end
