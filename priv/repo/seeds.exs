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

people = [ {"mr","james","dean"}, {"miss", "riva","siconni"}, {"mrs", "laura","hepburn"} ]

for {t,f,s} <- people do 
  College.Repo.insert!(%College.User{
    dob: elem(Ecto.Date.cast( {   :crypto.rand_uniform(1990,1996), :crypto.rand_uniform(1,13), :crypto.rand_uniform(1,28)  }),1),
    salutation: t,
    forname: f,
    surname: s, 
    email:  Ecto.UUID.generate <> "@" <>   Ecto.UUID.generate <> ".com" ,
    fulltext_name: "#{t} #{f} #{s}",
    is_student: true, 
    location: "dublin", 
    photo: nil
  })
 end

Enum.map(College.Repo.all(from College.User), 
          fn(u) -> College.Repo.insert(%College.Artefact{
            id: Ecto.UUID.generate, 
            user: u , 
            title: u.forname <> Integer.to_string( elem( DateTime.utc_now.microsecond,0) ) <> u.surname 
          }) end)

