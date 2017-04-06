class UsuariosController < ApplicationController
  #Aquí se van a desempeñar las funciones CRUD
  def index
    @usuarios = Usuario.all
  end

  def show
    @usuario = Usuario.find(params[:id])
  end

  def new
    @usuario = Usuario.new
  end

  def edit
    @usuario = Usuario.find(params[:id])
    #Lo primero que hacemos es buscar el identificador del usuario que queremos modificar
  end

#Cuando el formularioes enviado, los campos del formulario son enviados a Rails
#como parámetros, estos pueden ser invocados
  def create
    #necesitamos grabar los datos en la base de datos
    @usuario = Usuario.new(usuario_validator)
    #actualmenmte no hay ningun tipo de validacion
    #Es Usuario con la primera u, en mayusculas, porque estas creando uns instancia
    # de la clase Usuario, la cual está en app/models/usuario.rb
    #render plain: params[:usuarios].inspect
    if @usuario.save #guardamos los parámetros den la base de datos
    #ESto retorna un valor booleano, que indica si el articulo fue guardado de
    #forma correcta en la base de dstos o no
      redirect_to @usuario
    else
      render 'new'
      #EL metodo render, lo que te hace es ir a la vista new de nuevo
    end
  end

  def update
    @usuario = Usuario.find(params[:id])

    if @usuario.update(usuario_validator)
      redirect_to @usuario
    else
      render 'edit'
    end
  end

  def destroy
    @usuario = Usuario.find(params[:id])
    @usuario.destroy #Esto lo borra de la base de datos
    redirect_to usuarios_path
  end

  private #ojo, todo lo que pongas debajo de private queda de forma privada
  def usuario_validator
    params.require(:usuario).permit(:nombre,:apellido,:informacion)
    #Yo creo que aquí se ejecutaría la validación, del contenido, si es un umero
    #de telefono que sean sólo números... etc
  end
end
