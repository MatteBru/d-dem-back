class CreateStances < ActiveRecord::Migration[5.1]
  def change
    create_table :stances do |t|
      t.references :user, index: true
      t.integer :importance
      t.references :view, index: true

      t.timestamps
    end
  end
end
