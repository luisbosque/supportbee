Gem::Specification.new do |s|
  s.name        = 'supportbee'
  s.version     = '0.0.1'
  s.date        = '2013-10-10'
  s.summary     = "Ruby client for Supportbee API"
  s.description = "Ruby client for Supportbee API"
  s.authors     = ["Luis Bosque"]
  s.email       = 'luisico@gmail.com'
  s.files       = ["lib/supportbee.rb", "lib/supportbee/client.rb"]
  s.files       += Dir.glob("lib/supportbee/client/*.rb")
  s.add_dependency 'faraday', '>= 0.1.0'
  s.homepage    =
    'https://github.com/lbosque/supportbee'
  s.license       = 'MIT'
end
