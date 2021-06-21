# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Libralyweb.Repo.insert!(%Libralyweb.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Libralyweb.Repo
alias Libralyweb.Models.{Books}

%Books{ISBN: "9781683923534", title: "Python Basics", author: "H.Bhasin", edition: "0", publisher: "Mercury", is_borrowed: false, borrowed_by: ""} |> Repo.insert!()
%Books{ISBN: "9781977921758", title: "Illustrated Guide to Python 3", author: "Matt Harrison", edition: "0", publisher: "CreateSpace", is_borrowed: false, borrowed_by: ""} |> Repo.insert!()
%Books{ISBN: "9781119457893", title: "Beginning Programming with Python", author: "John Paul Mueller", edition: "0", publisher: "John Wiley & Sons", is_borrowed: false, borrowed_by: ""} |> Repo.insert!()
%Books{ISBN: "9780470519820", title: "Coding Theory", author: "Andre Neubauer", edition: "0", publisher: "Wiley-Interscience", is_borrowed: false, borrowed_by: ""} |> Repo.insert!()
%Books{ISBN: "9781449369415", title: "Introduction to Machine Learning with Python", author: "Andreas C. Müller", edition: "0", publisher: "O’Reilly Media", is_borrowed: false, borrowed_by: ""} |> Repo.insert!()
