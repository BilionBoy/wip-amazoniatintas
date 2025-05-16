class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    case user.l_tipo_usuario.descricao.downcase
    when 'administrador'
      can :manage, :all

    when 'gerente'
      can :read, :all
      can :update, User
      can :manage, LTipoUsuario

    when 'colaborador'
      can :read, :all

    when 'funcionário'
      # Aqui, você pode personalizar mais se tiver recursos próprios
      can :read, User, id: user.id  # Pode ver apenas a si mesmo
    end
  end
end
