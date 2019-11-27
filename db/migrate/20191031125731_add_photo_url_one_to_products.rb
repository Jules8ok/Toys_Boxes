class AddPhotoUrlOneToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :photo_url_one, :string
    add_column :products, :photo_url_two, :string
    add_column :products, :photo_url_three, :string
    add_column :products, :photo_url_four, :string
  end
end
