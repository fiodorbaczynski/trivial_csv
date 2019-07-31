defmodule TrivialCsv.Transformer do
  @moduledoc false

  alias TrivialCsv.Context

  alias TrivialCsv.Schema.WrappedFun

  @type transformation_result :: {:ok, any()} | {:error, any()}

  @spec call(any(), nonempty_list(WrappedFun.t()), Context.t()) :: transformation_result()
  def call(value, [transformer | rest], context) do
    case apply_transformer(value, transformer, context) do
      {:ok, value} -> call(value, rest, context)
      {:error, _} = error -> error
    end
  end

  @spec call(any(), [], Context.t()) :: {:ok, any()}
  def call(value, [], _), do: {:ok, value}

  @spec apply_transformer(any(), WrappedFun.t(1), Context.t()) :: transformation_result()
  defp apply_transformer(value, %WrappedFun{callable: callable, arity: 1}, _context) do
    callable.(value)
  end

  @spec apply_transformer(any(), WrappedFun.t(2), Context.t()) :: transformation_result()
  defp apply_transformer(value, %WrappedFun{callable: callable, arity: 2}, context) do
    callable.(value, context)
  end
end
