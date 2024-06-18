class Mensaje < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :actividad, class_name: 'Actividad'
end
