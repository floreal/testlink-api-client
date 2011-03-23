Gem::Specification.new do |spec|
  spec.name = 'testlink-api-client'
  spec.version = '0.0.1'
  spec.date = %q{2011-03-22}
  spec.description = <<-EOF
    TestLink API Client allow to use the TestLink Remote API.
  EOF
  spec.summary = 'A ruby TestLink API Client'
  spec.author = 'Floréal TOUMIKIAN'
  spec.email = 'ftoumikian@april.org'
  spec.homepage = 'http://github.com/floreal/testlink-api-client/'

  spec.files = Dir['lib/**/*.rb']

  spec.add_development_dependency('rspec')
end