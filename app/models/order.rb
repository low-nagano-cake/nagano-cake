class Order < ApplicationRecord
  
  enum status: { wait: 0, payment_confirmation: 1, progression: 2, prepare: 3, sent: 4 }
  
  # enum payment_method: { credit_card: 0, bank_transfer: 1 }
  
  belongs_to :customer
  
  has_many :order_details
  
  has_many :cart_items, dependent: :destroy
  
  
  
end
