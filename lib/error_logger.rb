# frozen_string_literal: true

class ErrorLogger
  def initialize
    @errors = []
  end

  def push_error(error_message)
    @errors << error_message
  end

  def errors?
    !@errors.empty?
  end

  def list_errors
    @errors.join("\n")
  end
end
