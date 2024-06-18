class CreateActividads < ActiveRecord::Migration[7.0]
  def change
    create_table :actividads do |t|
      t.references :user, foreign_key: true
      t.string :titulo
      t.text :descripcion
      t.integer :cantidad_personas
      t.datetime :fecha
      t.integer :valor
      t.float :calificacion_promedio

      t.timestamps
    end
  end
end
