json.extract! report, :id, :start_date, :end_date, :user_id, :created_at, :updated_at
json.url report_url(report, format: :json)
