json.array!(@leaves) do |leave|
  json.title leave.notes
  json.start leave.start_date.to_date
  json.end leave.end_date.to_date
  json.editable leave.editable?(current_user)
end
