# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_flash_sales'
  s.version     = '1.1.0'
  s.summary     = 'Flash Sales for Spree'
  s.description = 'Ability to create flash sales.'
  s.required_ruby_version = '>= 1.8.7'

  s.author    = ['ec1lpse', 'damjack']
  s.email     = 'ecl1pse.armageddon@gmail.com'
  s.homepage  = 'https://github.com/damjack/spree_flash_sales'
  
  #s.files         = `git ls-files`.split("\n")
  s.files        = Dir['CHANGELOG', 'README.md', 'LICENSE', 'lib/**/*', 'app/**/*', 'db/**/*', 'config/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '>= 1.1.3'
end
