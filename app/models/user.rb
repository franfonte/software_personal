# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Nuevos atributos para user y sus validaciones
  validates :name, presence: true
  validates :descripcion, presence: true
  validates :phone, presence: true, numericality: { only_integer: true }
  # Para permitir la foto de perfil
  has_one_attached :image 

  # Si se elimina el usuario todas sus dependencias son eliminadas
  has_many :actividades, class_name: "Actividad", foreign_key: "user_id", dependent: :destroy  # borra Actividad
  has_many :mensajes, class_name: "Mensaje", foreign_key: "user_id", dependent: :destroy # borra Mensaje
  has_many :resenas, class_name: "Resena", foreign_key: "user_id", dependent: :destroy # borra Resena
  has_many :solicitudes, class_name: "Solicitud", foreign_key: "user_id", dependent: :destroy # borra Solicitud
  has_many :messages, class_name: "Message", foreign_key: "user_id", dependent: :destroy # Borra sus mensajes al ser eliminado

  # Tutorial
  scope :all_except, ->(user) { where.not(id: user) }
  after_create_commit { broadcast_append_to 'users' }
end
