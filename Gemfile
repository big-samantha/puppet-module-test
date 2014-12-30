source ENV['GEM_SOURCE'] || "https://rubygems.org"

if facterversion = ENV['FACTER_GEM_VERSION']
  gem 'facter', facterversion, :require => false
else
  gem 'facter', :require => false
end

if puppetversion = ENV['PUPPET_GEM_VERSION']
  gem 'puppet', puppetversion, :require => false
else
  gem 'puppet', :require => false
end

gem 'rake',                    :require => false
gem 'puppetlabs_spec_helper',  :require => false
gem 'puppet-lint',             :require => false
gem 'puppet-syntax',           :require => false
gem 'rspec',                   '<3.0.0'
gem 'rspec-expectations',      '<3.0.0'
gem 'rspec-puppet',            :require => false
gem 'rspec-core', '~> 2.0',    :require => false

gem 'beaker',                  :require => false
gem 'beaker-rspec',            :require => false
gem 'serverspec',              :require => false
gem 'pry',                     :require => false
gem 'simplecov',               :require => false
# vim:ft=ruby
