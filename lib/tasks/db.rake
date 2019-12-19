namespace :db do
  desc "TODO"
  task fake: :environment do
    for i in 1..200

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

      status_random = rand(1..3)

      if status_random == 1
        situacao = 'Em aberto'
      elsif status_random == 2
        situacao = 'Reprovado'
      else
        situacao = 'Aprovado'
      end

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


      if status_random == 1
        Request.create!(
          tipo: 'defesa',
          status: 'Em aberto',
          teacher_id: teacher.id,
          student_id: student.id,
          document_id: defesa_document.id,
        )
      else
        if status_random == 2
          Request.create!(
            tipo: 'defesa',
            status: 'Reprovado',
            nota: rand(6.9).to_f,
            teacher_id: teacher.id,
            student_id: student.id,
            document_id: defesa_document.id,
          )
        else
          Request.create!(
            tipo: 'defesa',
            status: 'Aprovado',
            nota: rand(7..10).to_f,
            teacher_id: teacher.id,
            student_id: student.id,
            document_id: defesa_document.id,
          )
        end
      end
    end
  end

end
