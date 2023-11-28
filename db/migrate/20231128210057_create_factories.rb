class CreateFactories < ActiveRecord::Migration[7.1]
  def change
    create_table :factories do |t|
      t.string :name
      t.integer :max_material_storage
      t.integer :max_production_capacity
      t.integer :max_plushie_storage
      t.integer :max_accessory_storage

      t.timestamps
    end
  end
end
