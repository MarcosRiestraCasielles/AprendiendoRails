#Esta es una validacion a nivel de servidor
class Usuario < ApplicationRecord
  has_many :opinion
  validates :nombre, presence: true
  validates :apellido, presence: true
  validates :informacion, presence: true, length:{minimum: 5}
  #De esta forma, cuando llamas a @usuario.save, centro de la accion create,
  # si tienes un usuario invalido te retorna false
end

#Para que no sea guardado en la bse de datos
