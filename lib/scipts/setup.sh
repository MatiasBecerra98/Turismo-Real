#!/bin/bash

#set development
bin/rails db:environment:set RAILS_ENV=production

# drop and create database for tables
rake db:drop
rake db:create

# Add gems
# Devise
echo "# Devise " >> Gemfile
echo "gem 'devise'" >> Gemfile


# JSON web token
echo "# Gema JSON web token " >> Gemfile
echo "gem 'jwt'" >> Gemfile

# Simple command
echo "# Simple command for web services" >> Gemfile
echo "gem 'simple_command'" >> Gemfile

echo "# Better errors" >> Gemfile
echo "group :development do"  >> Gemfile
echo "  gem 'better_errors'"  >> Gemfile
echo "  gem 'binding_of_caller'"  >> Gemfile
echo "end"  >> Gemfile

# bcrypt
echo "# Add bcrypt to gemfile"
echo "gem 'bcrypt', '~> 3.1', '>= 3.1.13'" >> Gemfile

# install gems
# update gemfile
bundle install

# install devise
rails generate devise:install

#base scafolds
rails g scaffold Appartment nightly_fee:integer

rails g scaffold Janitor name:string

rails g scaffold Supply name:string cost:integer

rails g scaffold Profile name:string

# generate model for devise
rails generate devise User profile:references


# scaffolds
rails g scaffold AppartmentQuality appartment:references cable:boolean conditioned_air:boolean internet:boolean calefaction:boolean

rails g scaffold CleaningEvent appartment:references time_of_event:datetime janitor:references reminder_sent:boolean

rails g scaffold SupplyMovement supply:references appartment:references movement:integer

rails g scaffold Reservation user:references appartment:references starting_date:date ending_date:date total_cost:integer paid:boolean

rails g scaffold ExtraService reservation:references name:string


# run schema migrations
rake db:migrate

# use devise views
rails g devise:views

# run seed
rake db:seed

# install active admin
# Active Admin
echo "# Active admin" >> Gemfile
echo "gem 'activeadmin'" >> Gemfile
echo "gem 'cancancan'" >> Gemfile
echo "gem 'draper'" >> Gemfile
echo "gem 'pundit'" >> Gemfile

bundle install


rails g active_admin:install
echo  "# Active admin line"
rake db:migrate

rails generate active_admin:resource Appartment
rails generate active_admin:resource Janitor
rails generate active_admin:resource Supply
rails generate active_admin:resource Profile
rails generate active_admin:resource AppartmentQuality
rails generate active_admin:resource CleaningEvent
rails generate active_admin:resource Reservation
rails generate active_admin:resource ExtraService
rails generate active_admin:resource User

# scaffolds from active admin

# server up
rails s
