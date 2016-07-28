defmodule JsonApi.Api.PostView do
  use JsonApi.Web, :view

  def render("index.json", %{posts: posts}) do
    %{
      data: render_many(posts, __MODULE__, "post.json", as: :post)
    }
  end

  def render("show.json", %{post: post}) do
    %{
      data: render_one(post, __MODULE__, "post.json")
    }
  end

  def render("post.json", %{post: post}) do
     %{
      "type": "post",
      "attributes": %{
        "title": post.title,
        "body": post.body,
        "created_at": post.inserted_at,
        "updated_at": post.updated_at,
      }
    }
  end
end
