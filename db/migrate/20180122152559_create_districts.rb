class CreateDistricts < ActiveRecord::Migration[5.1]
  def change
    create_table :districts do |t|
      t.string :name
      t.string :rep
      t.string :state
      t.integer :cdid

      t.timestamps
    end
  end
end
