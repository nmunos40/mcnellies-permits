json.array!(@employee_licenses) do |employee_license|
  json.extract! employee_license, :id, :employee_id, :license_id, :expiration_date, :obtained?
  json.url employee_license_url(employee_license, format: :json)
end
