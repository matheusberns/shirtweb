class AddDepartmentIdToProdutos < ActiveRecord::Migration[5.2]
  def change
    add_column :produtos, :department_id, :integer
  end
end
