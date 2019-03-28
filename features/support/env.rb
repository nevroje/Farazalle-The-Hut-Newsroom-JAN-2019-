# frozen_string_literal: true

require 'coveralls'
Coveralls.wear_merged!('rails')
require 'cucumber/rails'
require 'email_spec/cucumber'

ActionController::Base.allow_rescue = false
begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise 'You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it.'
end

Chromedriver.set_version '2.45'

chrome_options = %w[disable-popup-blocking disable-infobars]

chrome_options << 'auto-open-devtools-for-tabs'

# Toggle this to use headless mode
chrome_options << 'headless'

Capybara.register_driver :chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new(
    args: chrome_options
  )
  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    options: options
  )
end

Cucumber::Rails::Database.javascript_strategy = :truncation
World(FactoryBot::Syntax::Methods)

Capybara.server = :puma
Capybara.javascript_driver = :chrome

Warden.test_mode!
World Warden::Test::Helpers

Before "@geolocation" do
 	Geocoder.configure(lookup: :test, ip_lookup: :test)
end

After "@geolocation" do
	#freegeoip.net provides a public HTTP API for software developers to search the geolocation of IP addresses.
 	Geocoder.configure(lookup: :freegeoip, ip_lookup: :freegeoip)
end

After do
  Warden.test_reset!
  StripeMock.stop
end

Before '@stripe' do
  StripeMock.start
end

# After '@stripe' do
#   StripeMock.stop
# end

Before '@stripe_errorINSUFF_FUNDS' do
  StripeMock.start
  custom_error = StandardError.new('Your card has insufficient funds.')
  StripeMock.prepare_error(custom_error, :new_customer)
  # StripeMock.prepare_card_error(:incorrect_cvc)
end

Before '@stripe_error_cvc' do

  StripeMock.toggle_live(true)
  StripeMock.start

  expect(StripeMock.create_test_helper).to be_a StripeMock::TestStrategies::Live
  # StripeMock.start
  # expect(StripeMock.create_test_helper).to be_a StripeMock::TestStrategies::Mock
  # StripeMock.prepare_card_error(:incorrect_cvc)
end

Before '@stripe_errorEXPIRED' do
  StripeMock.start
  StripeMock.prepare_card_error(:invalid_expiry_year)
end
