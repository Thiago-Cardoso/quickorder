if Rails.env.development? || Rails.env.test?
  require 'factory_bot'

  namespace :dev do
    desc 'Sample data for local development environment'
    task prime: 'db:setup' do
      include FactoryBot::Syntax::Methods

      5.times do
        occupation = [:admin, :clerk, :cooker].sample
        create(:employee, occupation: occupation)
      end

      categories = []
      25.times do
        categories << create(:category, description: Faker::Game.unique.genre)
      end


      15.times {
        create(:product,
          category: Category.first
        )
      }

      15.times do
        situation = [0, 1, 2].sample
        create(:order, situation: situation, employee: Employee.first)
      end

      20.times do
        situation = [0, 1, 2].sample
        create(:product_order, product: Product.first, order: Order.first)
      end


    end
  end
end