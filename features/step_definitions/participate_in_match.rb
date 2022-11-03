Given('the user visits last created match') do
    match_id = (Match.order("id").last.id).to_s
    visit match_path(match_id)
end

Given ('a newly created match with the maximum number of participants reached') do
    @match = Match.create(name: 'Rachao da EACH', description: "Rachao entre alunos da Each", address: "Rua Arlindo Béttio, 1000 - Ermelino Matarazzo, São Paulo - SP, 03828-000", limit: 20, privateCourt: true, halfCourt: true, level: "Livre", starts_at: '2022-11-05T15:00')
    for i in 1..20 do
        user = User.create(name: 'LeBron James', email: "lebron_james#{i}@email.com",  password: '123', password_confirmation: '123', birth_date: 'Thu, 14 Oct 1999', position: 'Small Forward (SF)')
        @match.users << user
    end
    puts(@match.users)
end