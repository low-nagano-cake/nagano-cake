class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
    ##ここから記載(佐藤)
      t.integer:customer_id,   null:false
      t.string :name,          null:false
      t.integer:postal_code,   null:false
      t.string :address,       null:false
    ##ここまで記載(佐藤)
      t.timestamps
    end
  end
end
