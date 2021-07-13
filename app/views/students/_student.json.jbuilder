json.extract! student, :id, :name, :roll_no, :department_id, :subject_id, :created_at, :updated_at
json.url student_url(student, format: :json)
