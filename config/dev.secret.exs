use Mix.Config

config :utsokt_web, UtsoktWeb.Endpoint, http: [port: 1338]

config :utsokt, Utsokt.Repo,
  username: "root",
  password: "password",
  database: "utsokt",
  hostname: "localhost"
