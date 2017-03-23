defmodule DeepCleanTest do
  use ExUnit.Case
  import DeepClean
  doctest DeepClean

  test "Avoid to remove if key is not found" do
    map = %{a: %{aa: 1, ab: 2}, b: %{ba: 3, bb: 4}}
    assert exclude_in(map, ["c"]) == map
  end

  test "Remove bb from b element in map" do
    map = %{a: %{aa: 1, ab: 2}, b: %{ba: 3, bb: 4}}
    res = %{a: %{aa: 1, ab: 2}, b: %{ba: 3}}
    assert exclude_in(map, ["b.bb"]) == res
  end

  test "Remove bb from b element in list" do
    map = [%{a: %{aa: 1, ab: 2}, b: %{ba: 3, bb: 4}}]
    res = [%{a: %{aa: 1, ab: 2}, b: %{ba: 3}}]
    assert exclude_in(map, ["b.bb"]) == res
  end
end
