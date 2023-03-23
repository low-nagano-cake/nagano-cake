class OrderDetail < ApplicationRecord


      enum making_status: { impossible: 0, wait: 1, progression: 2, completion: 3 }


end
