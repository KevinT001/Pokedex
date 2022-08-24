class CreatePokemons < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :pokemon_weight
      t.boolean :has_evolution
      t.references :region, foreign_key: true
    end
  end
end
