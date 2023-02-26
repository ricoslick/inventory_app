source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'sassc-rails'
gem 'rails', '~> 7.0.4'
gem 'bootstrap'
gem 'bcrypt'
gem 'will_paginate'
gem 'bootstrap-will_paginate'
gem 'autoprefixer-rails', '~> 8.6.5'
gem 'paperclip'
gem 'mimemagic', '~> 0.4.3'
gem 'font-awesome-sass', '~> 6.2.1'
gem 'pg_search'
gem 'prawn'
gem 'matrix'
gem 'axlsx_rails'
# gem 'axlsx','~> 2.0.1'
gem 'axlsx'
gem 'rubyzip'
gem 'prawn-table'

# Use sqlite3 as the database for Active Record
# gem 'sqlite3'
group :development, :test do
	gem 'pg'
	gem 'rspec-rails'
end
group :production do
	gem 'pg'
end
group :asset do
	# Use Puma as the app server
	gem 'puma'
	# Use Uglifier as compressor for JavaScript assets
	gem 'uglifier', '>= 2.3'
	# gem 'terser'
	gem 'babel-transpiler'
	# See https://github.com/rails/execjs#readme for more supported runtimes
	# gem 'therubyracer', platforms: :ruby
	# Use CoffeeScript for .coffee assets and views
	gem 'coffee-rails'

	gem 'coffee-script-source'
end
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
