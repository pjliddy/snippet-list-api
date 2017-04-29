# frozen_string_literal: true
# This file should contain all the record creation needed to experiment with
# your app during development.
#
# The data can then be loaded with the rake db:examples (or created alongside
# the db with db:nuke_pave).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# %w(antony jeff matt jason).each do |name|
#   email = "#{name}@#{name}.com"
#   next if User.exists? email: email
#   User.create!(email: email,
#                password: 'abc123',
#                password_confirmation: nil)
# end

Item.create([
              {
                title: 'First Snippet',
                body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                user_id: 1
              },
              {
                title: 'Another Snippet',
                body: 'Sed eiusmod tempor incididunt ut labore et dolore magna',
                user_id: 1
              },
              {
                title: 'Random Snippet',
                body: 'Ut enim ad minim veniam, nostrud exercitation ullamco.',
                user_id: 1
              }
            ])
