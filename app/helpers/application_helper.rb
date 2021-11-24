module ApplicationHelper
  def locale(locale)
    I18n.locale == :en ? "Estados Unidos" : "Portuguẽs do Brasil"
  end

  def data_brasileira(data_us)
    data_us.strftime("%d/%m/%Y")  
  end

  def ambiente_rails
    if Rails.env.development?
      "Desenvolvimento"
    elsif Rails.env.production?
      "Produção"
    else
      "Teste"  
    end
  end
end
