json.array!(@leaves) do |leave|
  json.title leave.notes
  json.start leave.start_date
  json.end leave.end_date
  json.editable true
end
