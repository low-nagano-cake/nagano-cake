class Item < ApplicationRecord

has_one_attached :image
belongs_to :genre

has_many :cart_items, dependent: :destroy
has_many :order_details, dependent: :destroy

validates :image, presence: true

 def add_tax_price
   (self.price * 1.10).round
 end

end
