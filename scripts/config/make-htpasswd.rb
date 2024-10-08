require 'json'

USER_CONFIG = "/app/static.json"

config      = {}
config      = JSON.parse(File.read(USER_CONFIG)) if File.exist?(USER_CONFIG)

HTPASSWD    = config["basic_auth_htpasswd_path"] || '/app/.htpasswd'
USERNAME    = ENV["BASIC_AUTH_USERNAME"]
PASSWORD    = ENV["BASIC_AUTH_PASSWORD"]

htpasswd    = "#{USERNAME}:#{PASSWORD}" unless (USERNAME.nil? || PASSWORD.nil?)

File.open(HTPASSWD, 'a') { |file| file.puts(htpasswd) } if !htpasswd.nil?
