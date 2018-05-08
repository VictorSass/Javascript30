class AddCompletedToDrafts < ActiveRecord::Migration[5.1]
  def change
    add_column :drafts, :completed, :string
  end
end
