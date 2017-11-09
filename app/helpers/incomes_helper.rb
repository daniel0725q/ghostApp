module IncomesHelper
  def groups_for_select
    Group.where(user_id: current_user.id).collect { |m| [m.name, m.id] }
  end
end
