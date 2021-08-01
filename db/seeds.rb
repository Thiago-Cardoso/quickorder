puts "Cadastrando employee...."
Employee.create(name: 'Administrador', email: 'admin@gmail.com', occupation: 0, password: '123456', password_confirmation: '123456', status: 1)
Employee.create(name: 'Atendente', email: 'atendente@gmail.com', occupation: 1 , password: '123456', password_confirmation: '123456', status: 1)
Employee.create(name: 'Cozinha', email: 'cozinha@gmail.com', occupation: 2 , password: '123456', password_confirmation: '123456', status: 1)


puts "Cadastrando category...."
Category.create(description: "Bebidas")
Category.create(description: "Lanches")

puts "Cadastrando product...."
Product.create(category_id: 1, name: "Refrigerante Coca Cola", description: "Coca Cola", price: 4.00, status: 1)
Product.create(category_id: 1, name: "Refrigerante Guaraná", description: "Guaraná", price: 2.99, status: 1)
Product.create(category_id: 1, name: "Refrigerante Sprite", description: "Sprite", price: 3.50, status: 1)
Product.create(category_id: 1, name: "Aguá Mineral", description: "Com gás", price: 4.49, status: 1)
Product.create(category_id: 1, name: "Aguá Mineral", description: "Sem gás", price: 4.49, status: 1)
Product.create(category_id: 1, name: "Cerveja Brahma", description: "Duplo malte", price: 2.88, status: 1)
Product.create(category_id: 1, name: "Cerveja Skol", description: "Puro malte", price: 2.67, status: 1)

puts "Cadastrando product...."
Product.create(category_id: 2, name: "Pastel de Carne", description: "Carne sem alface", price: 7.00, status: 1)
Product.create(category_id: 2, name: "Pizza Calabresa", description: "Calabresa, tomate", price: 10.00, status: 1)
Product.create(category_id: 2, name: "Pizza 4 queijos", description: "Queijo Provolone", price: 20.00, status: 1)
Product.create(category_id: 2, name: "Pizza Vegetariana", description: "Sem carne", price: 10.00, status: 1)
Product.create(category_id: 2, name: "X-salada" , description: "Ovo, Alface, Tomate, Bacon" , price: 16.50, status: 1)
Product.create(category_id: 2, name: "Cachorro quente" , description: "Sem cebola e tomate", price: 10.25, status: 1)
Product.create(category_id: 2, name: "Espetinho de carne" , description: "picanha" , price: 5.50, status: 1)
Product.create(category_id: 2, name: "Arroz de forma" , description: "Integral", price: 15.00, status: 1)