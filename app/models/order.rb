class Order < ApplicationRecord


 has_many :order_details
 belongs_to :customer

 enum status: { wait: 0, payment_confirmation: 1, progression: 2, prepare: 3, sent: 4 }


end
