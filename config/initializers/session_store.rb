# Be sure to restart your server when you modify this file.

Rails.application.config.session_store :redis_store, :servers => "redis://localhost:6379", :expire_in => 60
