class AddCompletiontoDrafts < ActiveRecord::Migration[5.1]
  def change
    add_column :drafts, :completion, :text
  end
end
