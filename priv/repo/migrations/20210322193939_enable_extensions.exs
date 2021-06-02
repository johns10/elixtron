defmodule Elixtron.Repo.Migrations.EnableExtensions do
  use Ecto.Migration

  def up do
    execute "CREATE EXTENSION IF NOT EXISTS pg_stat_statements"
  end

  def down do
    execute "DROP EXTENSION pg_stat_statements"
  end
end
