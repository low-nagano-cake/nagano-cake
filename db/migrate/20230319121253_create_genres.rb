class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|
    ##ここから記載(佐藤)
     t.string :name,   null:false
    ##ここまで記載(佐藤)
     t.timestamps
    end
  end
end
