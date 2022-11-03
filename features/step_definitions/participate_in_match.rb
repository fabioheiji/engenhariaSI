Given('the user visits last created match') do
    match_id = (Match.order("id").last.id).to_s
    visit match_path(match_id)
end