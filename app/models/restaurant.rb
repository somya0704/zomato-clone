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
end
