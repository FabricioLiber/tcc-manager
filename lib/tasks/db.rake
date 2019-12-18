namespace :db do
  desc "TODO"
  task fake: :environment do
    for i in 1..100

      tipo_random = rand(1..2)
      status_random = rand(1..3)

      Student.create!(
        nome: Faker::Name.name,
        matricula: Faker::Number.number(11).to_s,
        apto: true,
      )

      Teacher.create!(
        nome: Faker::Name.name,
        matricula: Faker::Number.number(11),
        especialidade: Faker::Educator.subject,
      )


    end
  end

end
