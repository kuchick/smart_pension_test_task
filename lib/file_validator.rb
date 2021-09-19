# frozen_string_literal: true

class FileValidator
  def initialize(path)
    @path = path
    @errors = []
  end

  def valid?
    file_exists_and_not_empty? && file_readable?
  end

  def list_errors
    @errors.join(', ')
  end

  private

  def file_exists_and_not_empty?
    File.size?(@path) ? true : (@errors << "File `#{@path}` not exists or empty" and false)
  end

  def file_readable?
    File.readable?(@path) ? true : (@errors << "Permission denied for `#{@path}`" and false)
  end
end
