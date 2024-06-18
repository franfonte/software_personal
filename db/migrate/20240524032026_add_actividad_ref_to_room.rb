class AddActividadRefToRoom < ActiveRecord::Migration[7.0]
  def change
    add_reference :rooms, :actividad, null: false, foreign_key: true # Volvi a agregar el null false
  end
end
