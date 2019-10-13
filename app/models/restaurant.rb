class Restaurant
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :image_url, type: String
  field :owner, type: BSON::ObjectId
  field :staff, type: Array, default: []

  embeds_many :dishes


  def add_staff(staff_id)
    self.push(staff: staff_id)
  end

  def self.search(search)
  if search
    Restaurant.any_of({:'dishes.name'  => /.*#{search}.*/ }, { name:  /.*#{search}.*/ })
  else
    Restaurant.all
  end
end
end
