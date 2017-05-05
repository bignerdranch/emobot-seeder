# Emobot Seeder

Seeds data for [emobot-backend](https://github.com/stickybandits/emobot-backend).

**WARNING: This deletes all current data in the DB first!**

## Installation

- Install Ruby and Rails
- Set up the `config/database.yml`. You can point `development` to your local app and `production` to the real app (but be careful!)

## Usage

- Local: `rails db:seed`
- Production: `rails db:seed RAILS_ENV=production`
