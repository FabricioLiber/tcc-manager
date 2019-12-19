namespace :db do
  desc "TODO"
  task fake: :environment do
    for i in 1..100

      tipo_random = rand(1..2)
      status_random = rand(1..3)

      if status_random == 1
        situacao = 'Em aberto'
        nota = -1
      elsif status_random == 2
        situacao = 'Reprovado'
        nota = rand(6.9)
      else
        situacao = 'Aprovado'
        nota = rand(7..10)
      end

      # tipo_random = rand(1..2)
      # if tipo_random == 1
      #   tipo = 'pre-banca'
      # else
      #   tipo = 'defesa'
      # end

      student = Student.create!(
        nome: Faker::Name.name,
        matricula: Faker::Number.number(digits: 11).to_s,
        apto: true,
      )

      teacher = Teacher.create!(
        nome: Faker::Name.name,
        matricula: Faker::Number.number(digits: 11).to_s,
        especialidade: Faker::Educator.subject,
      )

      banca_document = Document.create!(
        link: Faker::Internet.url,
      )

      Request.create!(
        tipo: 'pre-banca',
        status: situacao,
        teacher_id: teacher.id,
        student_id: student.id,
        document_id: banca_document.id,
      )

      defesa_document = Document.create!(
        link: Faker::Internet.url,
      )

      if status_random > 1
        status_random = rand(1..3)

        if status_random == 1
          Request.create!(
            tipo: 'em aberto',
            status: situacao,
            nota: nota.to_f,
            teacher_id: teacher.id,
            student_id: student.id,
            document_id: defesa_document.id,
  
          )
        elsif status_random == 2
          situacao = 'Reprovado'
          nota = rand(6.9)
        else
          situacao = 'Aprovado'
          nota = rand(7..10)
        end
        Request.create!(
          tipo: 'defesa',
          status: situacao,
          nota: nota.to_f,
          teacher_id: teacher.id,
          student_id: student.id,
          document_id: defesa_document.id,

        )
        situacao = 'Reprovado'
        nota = rand(6.9)
      elsif status_random == 3
        situacao = 'Aprovado'
        nota = rand(7..10)
      end
    end
  end

end
