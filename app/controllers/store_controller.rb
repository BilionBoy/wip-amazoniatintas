class StoreController < ApplicationController
  include Pagy::Backend
  
  def index
    @q = LCategoria.includes(:l_produtos).ransack(params[:q])
    @pagy, @categorias = pagy(@q.result, items: 20)
    
    @produtos_por_categoria = {}
    @categorias.each do |categoria|
      @produtos_por_categoria[categoria.id] = categoria.l_produtos.limit(8)
    end
  end
end