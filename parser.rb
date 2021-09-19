# frozen_string_literal: true

require_relative 'lib/environment'
require 'pry'

file_name = ARGV[0] || ''
LogReportPrinter.new(file_name, file_validator_class: FileValidator, error_logger: ErrorLogger.new).call
