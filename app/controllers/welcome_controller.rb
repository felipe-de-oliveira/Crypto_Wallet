class WelcomeController < ApplicationController
  def index
    @meu_nome = params[:nome] || "Felipe"
    @curso = "Rails"
  end
end
