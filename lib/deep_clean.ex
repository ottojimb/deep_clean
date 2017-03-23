defmodule DeepClean do
  @moduledoc """
  Provides functionality to remove elements from nested
  `Map` or `List` elements.

  Util to remove json attributes in responses
  """

  @doc """
  Cleans nested maps elements provided in a list.

  ## Examples

      iex> DeepClean.exclude_in(%{a: %{aa: 1, ab: 2}, b: %{ba: 3, bb: 4}}, ["a.ab", "b.bb"])
      %{a: %{aa: 1}, b: %{ba: 3}}

      iex> DeepClean.exclude_in(%{a: [%{aa: 1, ab: 2}, %{aa: 11, ab: 22},], b: [%{ba: 3, bb: 4}, %{ba: 33, bb: 44}]}, ["a.ab", "b.bb"])
      %{a: [%{aa: 1}, %{aa: 11}], b: [%{ba: 3}, %{ba: 33}]}

  """
  @spec exclude_in(map | list, [String.t, ...]) :: (map | list)
  def exclude_in(deep_elem, clean_list)
      when (is_map(deep_elem) or is_list(deep_elem)) and
        is_list(clean_list) do
    exclude(deep_elem, clean_list, "")
  end

  defp update_current_level(level, key) do
    key =
      case key do
        key when is_atom(key) -> Atom.to_string(key)
        key -> key
      end

    case level do
      "" -> key
      _ -> "#{level}.#{key}"
    end
  end

  defp exclude(enum, _, _) when (not is_map(enum) and not is_list(enum)) do
    enum
  end

  defp exclude(enum, to_clean, level) when is_list(enum) do
    for element <- enum, do: exclude(element, to_clean, level)
  end

  defp exclude(enum, to_clean, level) when is_map(enum) do
    enum
    |> Enum.map(fn({key, element}) ->
      current_level = update_current_level(level, key)
      unless Enum.member?(to_clean, current_level) do
        respo = {key, exclude(element, to_clean, current_level)}
        respo
      end
    end)
    |> Enum.filter(&(not is_nil(&1)))
    |> Enum.into(%{})
  end
end
