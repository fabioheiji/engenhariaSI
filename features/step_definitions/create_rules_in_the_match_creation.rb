When('the user click on the {string} field selecting the checkbox to {string} - error registration') do |string, string2|
    if string2 == '1'
        find(:css, '#' + string).set(1)
      end
end