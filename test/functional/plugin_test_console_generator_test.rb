require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

class PluginTestConsoleGeneratorTest < Test::Unit::TestCase
  def setup
    setup_app('empty')
    
    require 'rails_generator'
    require 'rails_generator/scripts/generate'
    Rails::Generator::Base.sources << Rails::Generator::PathSource.new(:plugin_test_console, "#{Rails.root}/../../generators")
    Rails::Generator::Scripts::Generate.new.run(['plugin_test_console', 'acts_as_foo'])
  end
  
  def test_should_create_console
    assert File.exists?("#{Rails.root}/vendor/plugins/acts_as_foo/script/console")
  end
  
  def teardown
    teardown_app
  end
end
