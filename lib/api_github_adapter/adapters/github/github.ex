defmodule ApiGitHubAdapter.Adapters.Github do
  use HTTPoison.Base

  @behaviour ApiGithubAdapter.Adapters.Github.Behaviour

  defp base_url, do: "https://api.github.com"

  def get_user(user_name) do
    "/users/#{user_name}"
    |> get()
    |> handle_response()
  end

  defp handle_response(response) do
    case response do
      {:ok, %{body: body, status_code: 200}} ->
        {:ok, body}

      {:ok, %{body: body, status_code: 201}} ->
        {:ok, body}

      {:ok, %{status_code: 401}} ->
        {:error, :error}
    end
  end

  def process_url(url) do
    base_url() <> url
  end

  def process_response_body(""), do: ""

  def process_response_body(body) do
    body
    |> Jason.decode!()
  end
end
