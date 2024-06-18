class Resena < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :actividad, class_name: 'Actividad'

  # Tiene que existir
  validates :contenido, presence: true
  validates :fecha, presence: true
  validates :calificacion, presence: true
end
