require 'codeclimate-test-reporter'

SimpleCov.formatters = [
  CodeClimate::TestReporter::Formatter
]

SimpleCov.add_filter '/spec'
SimpleCov.add_filter 'run-specs.sh'
