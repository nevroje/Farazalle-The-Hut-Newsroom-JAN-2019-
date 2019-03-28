class SpoofIp
	def initialize(app, ip)
		@app = app
		@ip = ip
	end

	def call(env)
		env['REMOTE_ADDR'] = env['action_dispatch.remote_ip'] = @ip
		@status, @headers, @response = @app.call(env)
		[@status, @headers, @response]
	end
end

Rails.application.configure do
  config.webpacker.check_yarn_integrity = false
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local = true
  # Enable/disable caching. By default caching is disabled.
  # Run rails dev:cache to toggle caching.
  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false
    config.cache_store = :null_store
  end

  config.active_storage.service = :local

  config.action_mailer.raise_delivery_errors = false

	config.action_mailer.perform_caching = false

	config.action_mailer.default_url_options = { host: 'localhost:3000' }

  config.active_support.deprecation = :log

  config.active_record.migration_error = :page_load

  config.active_record.verbose_query_logs = true

  config.assets.debug = true

  config.assets.quiet = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

	config.file_watcher = ActiveSupport::EventedFileUpdateChecker

	config.stripe.secret_key = Rails.application.credentials.stripe_secret_key
	config.stripe.publishable_key = Rails.application.credentials.stripe_publishable_key

	config.middleware.use(SpoofIp, '82.196.108.228')
end
