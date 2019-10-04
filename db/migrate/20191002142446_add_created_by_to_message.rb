class AddCreatedByToMessage < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :created_by, :string
  end
end
