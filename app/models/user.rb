class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Se estiver usando relacionamento com l_tipo_usuario, configure aqui
  belongs_to :l_tipo_usuario, optional: true  # só se for opcional
end
