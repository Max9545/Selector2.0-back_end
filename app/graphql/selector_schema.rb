class SelectorSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)

  use GraphQL::Execution::Errors
  # rescue ActiveRecord::RecordNotFound exception
  rescue_from(NoMethodError) do |err, obj, args, ctx, field|
    raise GraphQL::ExecutionError, err
  end
end
