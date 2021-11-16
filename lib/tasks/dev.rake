namespace :dev do
  desc "Configura o ambiente de desnvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando o Banco de Dados ...") do
        %x(rails db:drop) 
      end 

      show_spinner("Criando o Banco de Dados ...") do
        %x(rails db:create)
      end 

      show_spinner("Migrando o Banco de Dados ...") do
        %x(rails db:migrate) 
      end

      show_spinner("Semeando o Banco de Dados ...") do
        %x(rails db:seed)
      end
      
    else
      puts "Você não está no ambiente de desenvolvimento!"
    end 
  end

  private

  def show_spinner(msg_inicio,msg_final = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_inicio}") 
    spinner.auto_spin
    yield
    spinner.success("#{msg_final}")
  end  
end