Given(/^the following movies exist:$/) do |table|
  table.hashes.each do |movie|
    Movie.create(movie)
  end
end

Then(/^the director of "([^"]*)" should be "([^"]*)"$/) do |arg1, arg2|
  expect(page).to have_text("Director: #{arg2}")
end

Then(/^I should be directed to the Similar Movies page for "(.*?)"$/) do |arg1|
  similar_director_path Movie.find_by_title(arg1)
end


