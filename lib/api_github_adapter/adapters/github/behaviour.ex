defmodule ApiGithubAdapter.Adapters.Github.Behaviour do
  @callback get_user(String.t()) :: tuple()
end
