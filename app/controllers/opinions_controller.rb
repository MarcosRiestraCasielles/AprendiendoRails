class OpinionsController < ApplicationController
  def create
    @usuario = Usuario.find(params[:usuario_id])
    @opinion = @usuario.opinions.create(opinions_params)
    redirect_to usuario_path(@usuario)
  end

  private
    def opinions_params
      params.require(:opinion).permit()
    end
end
