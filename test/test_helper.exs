ExUnit.start

Mix.Task.run "ecto.create", ~w(-r JsonApi.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r JsonApi.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(JsonApi.Repo)

