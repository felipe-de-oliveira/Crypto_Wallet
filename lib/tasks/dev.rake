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
      %x(rails dev:add_coins)
      %x(rails dev:add_mining_types)

    else
      puts "Você não está no ambiente de desenvolvimento!"
    end 
  end

  desc "Cadastra as Moedas"
  task add_coins: :environment do
    show_spinner("Cadastando Moedas ...") do
      
      coins = [
        {
          description: "Bitcoin",
          acronym: "BTC",
          url_image: "https://cdn.pixabay.com/photo/2019/06/23/19/15/bitcoin-4294492_1280.png"
        },
      
        {
          description: "Ethereum",
          acronym: "ETH",
          url_image: "https://www.batistacoin.net/wp-content/uploads/2017/06/ethereum.png"
        },

        {
          description: "Dash",
          acronym: "DASH",
          url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/131.png"
        },

        {
          description: "Monero",
          acronym: "XMR",
          url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/328.png"
        },

        {
          description: "Iota",
          acronym: "IOT",
          url_image: "https://img2.gratispng.com/20180712/tkc/kisspng-iota-cryptocurrency-logo-internet-of-things-tether-aren-5b481f06b57ae1.5360095415314531907434.jpg",
        },

        {
          description: "ZCash",
          acronym: "ZEC",
          url_image: "https://img1.gratispng.com/20180614/bil/kisspng-computer-icons-zcash-cryptocurrency-selecta-5b22aff704b023.0927691415289999270192.jpg"
        }
      ]

      coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end
    end
  end
  
  desc "Cadastra dos tipos de Mineração"
  task add_mining_types: :environment do 
    show_spinner("Cadastando Tipo de Mineração ...") do
     
      mining_types = [
        {description: "Poof of Work", acronym: "PoW"},
        {description: "Poof of Stake", acronym: "PoS"},
        {description: "Poof of Capacity", acronym: "PoC"}
      ]

      mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
      end
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