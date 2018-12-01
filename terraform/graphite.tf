# Create a hosted graphite, and configure the app to use it
resource "heroku_addon" "hostedgraphite" {
  app  = "${heroku_app.ci.name}"
  plan = "hostedgraphite"
}