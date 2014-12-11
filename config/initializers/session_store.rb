# Be sure to restart your server when you modify this file.

Rails.application.config.session_store :cookie_store, key: '_subdomainapp_session', domain: {
  production: 'edupdu.com',
  development: 'edupdu.com'
}.fetch(Rails.env.to_sym, :all)