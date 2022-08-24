class CreateRegions < ActiveRecord::Migration[5.2]
  def change
    create_table :regions do |t|
      t.string :name
      t.integer :total_num_in_region
      t.boolean :caught_all_in_region
      t.timestamps
    end
  end
end
