# frozen_string_literal: true

class LogReportPrinter
  def initialize(file_path, file_validator_class:, error_logger:)
    @file_path = file_path
    @file_validator_class = file_validator_class
    @error_logger = error_logger
  end

  def call
    file_validator = @file_validator_class.new(@file_path)
    unless file_validator.valid?
      puts file_validator.list_errors
      return
    end
    @results = LogParser.new(@file_path, error_logger: @error_logger).call
    show_most_page_views_results
    show_most_page_unique_views_results
    show_errors
  end

  private

  def show_most_page_views_results
    most_page_views_results = @results.transform_values(&:size).sort_by { |_k, v| -v }
    puts "MOST PAGE VIEWS:\n"
    most_page_views_results.each { |k, v| puts "#{k}: #{v} visits" }
  end

  def show_most_page_unique_views_results
    most_page_unique_views_results = @results.transform_values { |v| v.uniq.size }.sort_by { |_k, v| -v }
    puts "\nMOST UNIQUE PAGE VIEWS:\n"
    most_page_unique_views_results.each { |k, v| puts "#{k}: #{v} unique views" }
  end

  def show_errors
    puts "\n"
    puts @error_logger.list_errors if @error_logger.errors?
  end
end
