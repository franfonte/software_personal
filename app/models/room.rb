class Room < ApplicationRecord
  belongs_to :actividad, class_name: "Actividad"
  validates_uniqueness_of :name
  scope :public_rooms, -> { where(is_private: false) }
  after_create_commit { broadcast_append_to 'rooms' }
  has_many :messages, class_name: "Message", foreign_key: "room_id", dependent: :destroy # Borra sus mensajes al ser eliminado
end
