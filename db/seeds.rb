# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Coin.create!(
  description: "Bitcoin",
  acronym: "BTC",
  url_image: "https://cdn.pixabay.com/photo/2019/06/23/19/15/bitcoin-4294492_1280.png"
)

Coin.create!(
  description: "Ethereum",
  acronym: "ETH",
  url_image: "https://www.batistacoin.net/wp-content/uploads/2017/06/ethereum.png"
)

Coin.create!(
  description: "Dash",
  acronym: "DASH",
  url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/131.png"
)

Coin.create!(
  description: "Monero",
  acronym: "XMR",
  url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/328.png"
)