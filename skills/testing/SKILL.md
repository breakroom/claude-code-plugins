---
name: testing
description: Guidelines for writing tests, including testing philosophy, style and tools. Use whenever you are writing or updating any code, or when reviewing pull requests that include tests.
---

# Testing

Important: add and update unit tests for all code you change, even if the user didn't ask.

## Unit testing

- Practice Test Driven Development: write the tests first, watch them fail, update the implementation, and confirm the tests pass

## Elixir testing with ExUnit

- Unit tests should be `async: true` unless there's a good reason not to, and this reason must be documented with a comment
- Unit tests that interact with OpenSearch should have a `@moduletag :opensearch` so they correctly set up OpenSearch for async testing
