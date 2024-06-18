class CreateMensajes < ActiveRecord::Migration[7.0]
  def change
    create_table :mensajes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :actividad, null: false, foreign_key: true
      t.datetime :fecha
      t.text :contenido

      t.timestamps
    end
  end
end
