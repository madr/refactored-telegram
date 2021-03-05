# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Utsokt.Repo.insert!(%Utsokt.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Utsokt.Link
alias Utsokt.Repo
import Ecto.Query

now = NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second)

Repo.delete_all(from(l in Link))

Repo.insert(%Link{
  url: "https://programmingisterrible.com/post/162346490883/how-do-you-cut-a-monolith-in-half",
  title: "How do you cut a monolith in half?",
  inserted_at: now
})

Repo.insert!(%Link{
  url: "https://blog.royalsloth.eu/posts/the-complexity-that-lives-in-the-gui/",
  title: "The complexity that lives in the GUI",
  inserted_at: now,
  read?: true
})

Repo.insert!(%Link{
  url:
    "https://www.folkhalsomyndigheten.se/smittskydd-beredskap/utbrott/aktuella-utbrott/covid-19/vaccination-mot-covid-19/statistik/statistik-over-registrerade-vaccinationer-covid-19/",
  title: "Statistik över registrerade vaccinationer covid-19",
  inserted_at: now
})

Repo.insert!(%Link{
  url: "https://www.guru99.com/frontend-testing.html",
  title: "What is Front End Testing? Tools & Frameworks ",
  inserted_at: now
})

Repo.insert!(%Link{
  url: "https://www.rocknytt.net/skivslapp",
  title: "Kommande Skivsläpp",
  inserted_at: now
})

Repo.insert!(%Link{
  url: "https://www.ikea.com/se/sv/p/skarsta-skrivbord-sitt-sta-vit-s59324818/",
  title: "SKARSTA Skrivbord sitt/stå",
  inserted_at: now
})

Repo.insert!(%Link{
  url: "https://lisacrispin.com/2020/03/15/new-challenges-in-continuous-delivery/",
  title: "New Challenges in Continuous Delivery ",
  inserted_at: now
})
