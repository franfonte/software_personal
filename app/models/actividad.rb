class Actividad < ApplicationRecord
  belongs_to :user, class_name: "User"

  # Tiene que existir
  validates :titulo, presence: true
  validates :fecha, presence: true
  validates :valor, presence: true
  validates :descripcion, presence: true
  #validates :publica, presence: true

  # Si se elimina la actividad todas sus dependencias son eliminadas
  has_many :mensajes, class_name: "Mensaje", foreign_key: "actividad_id", dependent: :destroy# borra Mensaje
  has_many :resenas, class_name: "Resena", foreign_key: "actividad_id", dependent: :destroy # borra Resena
  has_many :solicitudes, class_name: "Solicitud", foreign_key: "actividad_id", dependent: :destroy # borra Solicitud
  has_one :room, class_name: "Room", foreign_key: "actividad_id", dependent: :destroy # borra Room de chat
end
