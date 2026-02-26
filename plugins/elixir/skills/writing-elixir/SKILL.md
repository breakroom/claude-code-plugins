---
name: writing-elixir
description: Guidelines for writing Elixir, including style, documentation and Ecto conventions. Use any time you're creating or updating Elixir/Phoenix files.
---

# Elixir guidelines

## Approach

- Write Idiomatic Elixir, following the Elixir Style Guide
- Follow Phoenix conventions for contexts, schemas and controllers
- Use pattern matching instead of conditional logic where possible

## Style

- Modules should have public functions first, followed by private functions in an order of relevance within the module - when refactoring, check whether functions can be made private, and if so, move them.
- Imports and aliases in a module should be ordered alphabetically to aid readability, with a blank line maintained between `Poplar` and `PoplarWeb` contexts
- Group multiple `alias`, `import`, `require`, or `use` statements together consistently
- Module names containing acronyms, e.g. XML, should be cased as `Foo.XML`, not `Foo.Xml`
- If a module context is referenced twice or more, use an alias instead of a fully expanded reference. e.g. add `alias Poplar.Foo` and then call `Foo.bar()` instead of calling `Poplar.Foo.bar()` directly

## Documentation

- Add @moduledoc definitions at the top of a module describing the purpose of the module and anything important a developer might want to know about using it
- Add @doc statements on public functions describing what they do in simple terms - you don't need to describe every argument - keep it fairly terse

## Ecto

- Use `mix ecto.gen.migration [migration_name]` to create new migration files
- Always add `timestamps()` on new tables
- Always use the pipe style Ecto queries e.g. `Model |> where(...)` unless the query requires more complex logic
- Never use `preload`, `belongs_to`, `has_one` or `has_many`. Instead, we create lists of maps with `EnumExt.list_to_map_list` and then using `EnumExt.decorate` to load associated data from another context.

For example:

```
list_employers() # [%Employer{}, ...]
|> EnumExt.list_to_map_list(:employer) # [%{employer: %Employer{}}, ...]
|> EnumExt.decorate(&Accounts.find_by_ids/1, &1.employer.account_id) # [%{account: %Account{}, employer: %Employer{}}, ...]
```

- Context functions that return lists of items should be prefixed with `list`, e.g. `list_public_occupations`
- Context functions that get a singular entity (or `nil`) should be prefixed with `get`, e.g. `get_occupation_by_id`
- Context functions that return a `Map` should be prefixed with `find`, e.g. `find_occupations_by_ids`
- Context functions that raise an exception should have a `!` suffix, e.g. `get_occupation_by_id!`
