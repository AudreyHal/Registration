# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Registration.Repo.insert!(%Registration.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias NimbleCSV.RFC4180, as: CSV
alias Registration.Repo
alias Registration.Management.Course

"priv/seed_data/course_list.csv"
|> File.read!
|> CSV.parse_string
|> Enum.each(fn [_,code,title,credits,department] ->

  credits= String.to_integer(credits)
  code= String.to_integer(code)
  %Course{code: code, title: title, credits: credits, department: department }

  |> Repo.insert
end)
