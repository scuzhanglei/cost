module EntriesHelper
  def generate_user_options(default_id)
    options = [['请选择', '']]
    options += User.all.map{|user| [user.name, user.id]}
    options_for_select(options, default_id)
  end

  def generate_cost_type_options(default_id)
    options = [['请选择', '']]
    options += CostType.all.map{|type| [type.name, type.id]}
    options_for_select(options, default_id)
  end
end
