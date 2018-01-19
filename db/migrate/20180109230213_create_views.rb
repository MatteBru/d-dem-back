class CreateViews < ActiveRecord::Migration[5.1]
  def change
    create_table :views do |t|
      t.references :issue, index: true
      t.string :description
      t.integer :attitude
      t.references :creator

      t.timestamps
    end
  end
end
