# frozen_string_literal: true

class LogParser
  SPLITTER = ' '

  def initialize(file_path, error_logger:)
    @file = File.open(file_path, 'r')
    @results = Hash.new { |h, k| h[k] = [] }
    @error_logger = error_logger
  end

  def call
    @file.each do |line|
      page, ip = line.split(SPLITTER)
      if !page || !ip
        @error_logger.push_error("Error in line #{@file.lineno}")
        next
      end
      @results[page] << ip
    end
    @file.close
    @results
  end
end
