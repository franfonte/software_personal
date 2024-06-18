class CreateSolicituds < ActiveRecord::Migration[7.0]
  def change
    create_table :solicituds do |t|
      t.references :user, null: false, foreign_key: true
      t.references :actividad, null: false, foreign_key: true
      t.datetime :fecha
      t.text :descripcion
      t.boolean :estado

      t.timestamps
    end
  end
end
