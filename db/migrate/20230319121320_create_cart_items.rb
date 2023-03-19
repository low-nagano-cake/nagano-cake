class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
    ##ここから記載(佐藤)
     t.integer :customer_id,  null:false
     t.integer :item_id,      null:false
     t.integer :amount,       null:false
    ##ここまで記載(佐藤)
     t.timestamps
    end
  end
end

