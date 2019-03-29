Then("I should see {string}") do |content|
	expect(page).to have_content content
end

Then("I should not see {string}") do |content|
	expect(page).not_to have_content content
end

Then("I should see an article image") do
	expect(page).to have_selector(".article_image")
end

Then("I should see {string} for {string}") do |expected_content, title|
	@article = Article.find_by_title(title)
	within("#article_#{@article.id}") do
	expect(page).to have_content expected_content
end
end

Then("I should not see {string} for {string}") do |expected_content, title|
	@article = Article.find_by_title(title)
	within("#article_#{@article.id}") do
	expect(page).not_to have_content expected_content
end
end

Then("I should be on subscription page") do
	expect(current_path).to eq new_user_registration_path
end

Then("I should see {string} in {string}") do |expected_content, name|
	category = Category.find_by_name(name)
	within("#category_#{category.id}") do
	expect(page).to have_content expected_content
end
end

Then("I click {string}") do |element|
	click_on element
end

Then('I select {string} from {string}') do |option, selector|
	select option, from: selector
end

Then("I should be redirected to the purchase subscription page") do
	expect(current_path).to eq new_user_registration_path
end

Then("I wait {int} seconds") do |int|
	sleep int
end

Then("I should be a subscriber") do
	@user = User.last
	expect(@user.subscriber?).to eq true
end

Then("I should see my temporary password in the email body") do
	@user = User.last
	password = @user.temp_password
	expect(current_email.default_part_body.to_s).to include(password)
end

Then("I click on {string} on {string}") do |element, title|
	@article = Article.find_by_title(title)
	find("#article_#{@article.id}").click_on element
end