require "helper"
require "fluent/plugin/out_swift"

class SwiftOutputTest < Test::Unit::TestCase
  setup do
    Fluent::Test.setup
  end

  def teardown
    Dir.glob('test/tmp/*').each {|file| FileUtils.rm_f(file) }
  end

  CONFIG = %[
    auth_url https://127.0.0.1/auth/v1.0
    auth_user test:tester
    auth_api_key testing
    domain_name default
    project_name test_project
    auth_region RegionOne
    swift_container CONTAINER_NAME
    path logs/
    swift_object_key_format %{path}%{time_slice}_%{index}.%{file_extension}
    ssl_verify false
    buffer_path /var/log/fluent/swift
    buffer_type memory
    time_slice_format %Y%m%d-%H
    time_slice_wait 10m
    utc
  ]

  def create_driver(conf = CONFIG)
    Fluent::Test::Driver::Output.new(Fluent::Plugin::SwiftOutput) do
      def format(tag, time, record)
        super
      end

      def write(chunk)
        chunk.read
      end

      private

      def check_container
      end
    end.configure(conf)
  end

  def test_configure
#  test 'test_configure' do
    d = create_driver(CONFIG)
    assert_equal 'https://127.0.0.1/auth/v1.0', d.instance.auth_url
    assert_equal 'test:tester', d.instance.auth_user
    assert_equal 'testing', d.instance.auth_api_key
    assert_equal 'RegionOne', d.instance.auth_region
    assert_equal 'CONTAINER_NAME', d.instance.swift_container
    assert_equal 'logs/', d.instance.path
  end

end