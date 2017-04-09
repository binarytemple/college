
Testing form component fields

```elixir
:erlang.iolist_to_binary( elem(Phoenix.HTML.Form.select( %Phoenix.HTML.Form{data: %{ age: 10   }  },:age, 0..10), 1))
```

Again:

```elixir
:erlang.iolist_to_binary( 
  elem(
    Phoenix.HTML.Form.select( %Phoenix.HTML.Form{data: %{ age: 10   }  },:age, [{0,"zero"},{1,"one"}]), 1
    )
    )
```

Again:

```
:erlang.iolist_to_binary( elem(Phoenix.HTML.Form.select( %Phoenix.HTML.Form{data: %{ age: "1"   }  },:age, [{"0","0"},{"1","1"}]), 1))
```




