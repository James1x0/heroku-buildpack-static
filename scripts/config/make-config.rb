require 'fileutils'
require 'erb'
require_relative 'lib/nginx_config'

TEMPLATE     = File.join(File.dirname(__FILE__), 'templates/nginx.conf.erb')
USER_CONFIG  = 'static.json'
NGINX_CONFIG = 'config/nginx.conf'

erb = ERB.new(File.read(TEMPLATE)).result(NginxConfig.new(USER_CONFIG).context)
File.write(NGINX_CONFIG, erb)
