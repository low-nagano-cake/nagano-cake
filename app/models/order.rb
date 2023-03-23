class Order < ApplicationRecord

    enum status: { wait: 0, payment_confirmation: 1, progression: 2, prepare: 3, sent: 4 }


end
