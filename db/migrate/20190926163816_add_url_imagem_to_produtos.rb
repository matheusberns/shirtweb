class AddUrlImagemToProdutos < ActiveRecord::Migration[5.2]
  def change
    add_column :produtos, :url_image, :string
  end
end
