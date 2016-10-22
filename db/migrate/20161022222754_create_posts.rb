class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :author
      t.string :title
      t.text :content
      t.date :post_date

      t.timestamps null: false
    end
  end
end
