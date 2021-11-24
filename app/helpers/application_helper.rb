module ApplicationHelper
  def locale
    I18n.locale == :en ? "Estados Unidos" : "Portuguẽs do Brasil"
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
