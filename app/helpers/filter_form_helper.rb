module FilterFormHelper
  def define_value(params, field)
    params.nil? ? '' : params[field]
  end
end