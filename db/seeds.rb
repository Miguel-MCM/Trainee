# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

categorias = ['Entrada', 'Prato Principal', 'Sobremesa']
for nome in categorias
    Category.create!(name: nome)
end

Product.create!(name: 'Pate', description: 'Pães sírios e um paté de atum', price: 800, category_id: 1)
Product.create!(name: 'Bruschettas', description: 'Antepasto italiano feito com uma fatia de pão rústico', price: 800, category_id: 1)
Product.create!(name: 'Porção de Batatas Fritas', description: 'Uma porção de batatas em tiras fritas', price: 850, category_id: 1)

Product.create!(name: 'Rosbife', description: 'Prato com bife de carne bovina assada', price: 2500, category_id: 2)
Product.create!(name: 'Macarronada', description: 'Prato de macarrão linguinni com molho vermelho', price: 2350, category_id: 2)
Product.create!(name: 'Peito de Frango', description: 'Prato com frango assado', price: 2200, category_id: 2)
Product.create!(name: 'Rattatouile', description: 'Prato de legumes cozidos, igualzinho ao do filme!', price: 2500, category_id: 2)

Product.create!(name: 'Pudim', description: 'Pudim de leite condensado, quem não adora um pudinzinho?', price: 1500, category_id: 3)
Product.create!(name: 'Gelatina', description: 'Gelatina sabor cereja, o favorito das crianças', price: 1350, category_id: 3)
Product.create!(name: 'Salada de Frutas', description: 'Salada de frutas com mamão, laranja, banana, maçã, morango, pessego e uva. Uma ótima opção saudável para sobremesa', price: 1250, category_id: 3)
