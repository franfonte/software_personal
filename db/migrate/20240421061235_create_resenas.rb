class CreateResenas < ActiveRecord::Migration[7.0]
  def change
    create_table :resenas do |t|
      t.references :user, null: false, foreign_key: true
      t.references :actividad, null: false, foreign_key: true
      t.datetime :fecha
      t.text :contenido
      t.float :calificacion

      t.timestamps
    end
  end
end
