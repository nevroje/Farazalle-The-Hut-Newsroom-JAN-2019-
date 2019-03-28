Feature: Editor can publish articles
	As an editor,
	In order to make sure that the articles have good standards
	I would like only editors to be able to publish articles.

	Background:
		Given the following users exist
			| email           | role       |
			| laura@mail.com  | editor     |
			| alecia@mail.com | registered |
			| amanda@mail.com | journalist |
		And the following categories exist
			| name   |
			| tech   |
			| local  |
			| sports |
		And the following articles exist
			| title                                          | content                                                                                                                                                                                     | image | status     | category |
			| The Hub News is the site of the moment         | Great articles! This site's popularity is raising so quick!                                                                                                                                 |       | free       | tech     |
			| Spring hasn't arrived in Sweden yet            | Ice can be still spotted on the street, watch out!                                                                                                                                          |       | restricted | local    |
			| Eating cinnamon buns increases life expectancy | Researchers are running clinical studies to see the benefits of cinnamon buns consumption. Some state that it might be correlated with an increase in life expectancy, is that really true? |       | free       | sports   |
		And I am logged in as "laura@mail.com"

	Scenario: Editor can publish articles
		And I visit the "landing" page
		When I click on "Employee"
		Then I should see "Welcome to the staff page"