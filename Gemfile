source "http://rubygems.org"

# Specify your gem's dependencies in middleman-navigation.gemspec
gemspec

group :development do
  gem "rake",     "~> 0.9.2"
  gem "rdoc",     "~> 3.9"
  gem "yard",     "~> 0.8.0"
end

group :test do
  gem "sinatra"
  gem "cucumber", "~> 1.2.0"
  gem "fivemat"
  gem "aruba",    "~> 0.4.11"
  gem "rspec",    "~> 2.7"
  gem "timecop",  "~> 0.4.0"
  gem "kramdown"
  
  platforms :ruby do
    gem "redcarpet", "~> 2.1.1"
  end
end