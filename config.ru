require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

# in order to send patch and delete requests:
use Rack::MethodOverride

# mounting seperate controllers
use UsersController
use PostsController

run ApplicationController
