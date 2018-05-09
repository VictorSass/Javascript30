class AddIntroToDrafts < ActiveRecord::Migration[5.1]
  def change
    add_column :drafts, :intro, :text
  end
end
