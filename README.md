# DeepClean

Provide functionality to exclude elements in nested maps or list.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `deep_clean` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:deep_clean, "~> 0.1.0"}]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm).
The docs can be found at  [https://hexdocs.pm/deep_clean](https://hexdocs.pm/deep_clean).


## Usage

Simply call the `DeepClean.exclude_in/2` function sending the following params:

  1. `deep_elem`: a *map* or *list* with nested elements
  2. `clean_list`: a *list* with the keys to be exclude from the *deep_elem*
    separated by dots by each nested level


## Example

```elixir
iex> DeepClean.exclude_in(%{a: %{aa: 1, ab: 2}, b: %{ba: 3, bb: 4}}, ["a.ab", "b.bb"])
.. > %{a: %{aa: 1}, b: %{ba: 3}}

iex> DeepClean.exclude_in(%{a: [%{aa: 1, ab: 2}, %{aa: 11, ab: 22},], b: [%{ba: 3, bb: 4}, %{ba: 33, bb: 44}]}, ["a.ab", "b.bb"])
.. > %{a: [%{aa: 1}, %{aa: 11}], b: [%{ba: 3}, %{ba: 33}]}
```
