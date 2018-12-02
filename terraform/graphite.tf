# Create a hosted graphite, and configure the app to use it
resource "heroku_addon" "hostedgraphite" {
  app  = "${heroku_app.ci.name}"
  plan = "hostedgraphite"
}

resource "heroku_addon" "hostedgraphite" {
  app  = "${heroku_app.staging.name}"
  plan = "hostedgraphite"
}

resource "heroku_addon" "hostedgraphite" {
  app  = "${heroku_app.production.name}"
  plan = "hostedgraphite"
}