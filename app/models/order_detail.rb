class OrderDetail < ApplicationRecord
  
  
      enum making_status: { impossible: 0, wait: 1, progression: 2, completion: 3 }
  
  belongs_to :item
  
  
  


end
