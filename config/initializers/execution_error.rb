class GraphQL::ExecutionError < GraphQL::Error

  attr_accessor :error, :record

  def initialize(error)
    @error = error_tracker(error)
    # @record = error.try(:record)
  end

  def error_tracker(error)
    if error.class == NoMethodError
      error = "Your search returned no results."
    end
  end

  def to_h
    if record.present?
      record.errors.messages
    else
      error
    end
  end
end
