require 'benchmark'
require 'faker'

puts Benchmark.measure { 
  50.times do 
    Article.create(
      user_id: 1,
      category_id: 2,
      title: Faker::Book.title,
      content: Faker::Lorem.paragraph
    )
  end
}
