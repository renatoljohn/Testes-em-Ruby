require 'capybara/cucumber'

# Carrega elementos de um Dicionario
EL = YAML.load_file(Dir.pwd + '/features/support/elements.yaml')

# Carrega opções de navegador com base nos perfis escritos no cucumber.yaml
ENV['BROWSER'] = ENV['BROWSER'] || 'selenium_chrome'
Capybara.default_driver = ENV['BROWSER'].to_sym