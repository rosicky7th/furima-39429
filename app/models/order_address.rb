class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture, :city, :addresses, :building, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :addresses
    validates :phone_number, numericality: { only_integer: true }, length: { in: 10..11 }
    validates :token
  end

  validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }

  def save
    order = Order.create(user_id:, item_id:)
    Address.create(postal_code:, prefecture:, city:, addresses:, building:,
                   phone_number:, order_id: order.id)
  end
end
