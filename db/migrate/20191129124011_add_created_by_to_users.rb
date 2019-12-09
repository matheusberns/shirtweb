class AddCreatedByToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :produtos, :created_by, foreign_key: {to_table: :users}
    add_column :produtos, :user_email, :string
  end
end
