provider "statuscake" {
  username = "${var.statuscake_username}"
}

resource "statuscake" "production" {
  website_name = "${heroku_app.production.name}"
  website_url  = "${heroku_app.production.web_url}"
  test_type    = "HTTP"
  check_rate   = 300
}

resource "statuscake" "stage" {
  website_name = "${heroku_app.staging.name}"
  website_url  = "${heroku_app.staging.web_url}"
  test_type    = "HTTP"
  check_rate   = 300
}

resource "statuscake" "ci" {
  website_name = "${heroku_app.ci.name}"
  website_url  = "${heroku_app.ci.web_url}"
  test_type    = "HTTP"
  check_rate   = 300
}
