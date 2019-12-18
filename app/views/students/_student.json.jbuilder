json.extract! student, :id, :nome, :matricula, :apto, :created_at, :updated_at
json.url student_url(student, format: :json)
