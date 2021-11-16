# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

spinner = TTY::Spinner.new("[:spinner] Cadastrando Moedas...") 
spinner.auto_spin

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
  }
]

coins.each do |coin|
  Coin.find_or_create_by!(coin)
end

spinner.success("(Concluído!)")