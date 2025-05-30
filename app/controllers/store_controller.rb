class StoreController < ApplicationController
  include Pagy::Backend
  
  def index
    @q = LCategoria.includes(:l_produtos).ransack(params[:q])
    @pagy, @categorias = pagy(@q.result, items: 20)
    
    @produtos_por_categoria = {}
    @categorias.each do |categoria|
      @produtos_por_categoria[categoria.id] = categoria.l_produtos.limit(8)
    end
    
    # Buscar profissionais
    @profissionais = LProfissional.all
    
    # Organizar profissionais por especialidade
    @profissionais_por_especialidade = {
      'todos' => @profissionais,
      'residencial' => @profissionais.select { |p| p.especialidade.downcase.include?('residencial') },
      'comercial'   => @profissionais.select { |p| p.especialidade.downcase.include?('comercial') },
      'industrial'  => @profissionais.select { |p| p.especialidade.downcase.include?('industrial') },
      'decorativo'  => @profissionais.select { |p| p.especialidade.downcase.include?('decorativo') }
    }
  end
end