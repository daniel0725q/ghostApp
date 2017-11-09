json.extract! expenditure, :id, :value, :name, :group_id, :user_id, :created_at, :updated_at
json.url expenditure_url(expenditure, format: :json)
