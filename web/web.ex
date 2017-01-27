defmodule Coherence.Web do
  @moduledoc """
  Coherence setting for web resources.

  Similar to a project's Web module
  """

  @doc false
  def model do
    quote do
      use Ecto.Schema

      import Ecto
      import Ecto.Changeset
      import Ecto.Query, only: [from: 1, from: 2]
    end
  end

  @doc false
  def controller do
    quote do
      use Phoenix.Controller
      import Coherence.ControllerHelpers

      import Ecto
      import Ecto.Query

      alias Coherence.Config
      require Redirects
    end
  end

  @doc false
  def router do
    quote do
      use Phoenix.Router
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
