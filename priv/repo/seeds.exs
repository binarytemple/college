# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     College.Repo.insert!(%College.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
#
import Ecto
import Ecto.Changeset
import Ecto.Query
College.Repo.insert!(%College.User{age: 25, forname: "James", is_student: true, location: "dublin", photo: nil, salutation: nil, surname: "Brown"})
College.Repo.all(from College.User)
Enum.map(College.Repo.all(from College.User), fn(u) ->  College.Repo.insert(%College.Artefact{user: u , title: u.forname <> Integer.to_string( elem( DateTime.utc_now.microsecond,0) ) <> u.surname }) end) 
