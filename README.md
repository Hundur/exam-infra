PGR301

Instructions

Fork my repos `https://github.com/Hundur/exam-infra` `https://github.com/Hundur/exam-app`,
and rename the `credentials-example.yml` file to `credentials.yml`. Fill out the needed values
in the `credentials.yml` file, and the needed values in the `terraform/variables.tf` file.
No need to change the app and pipeline names unless you want to, but then you have to make
sure you run the cli commands correctly according to your new names. The API keys in the files
when you download the repos, are complete gibberish. After doing this you'll have to
manually set your Logzio API key by using this command: `set LOGZIO_TOKEN=<token>`

Run `docker-compose up -d` where you have your docker-compose.yml file (The file which will
put concourse up on localhost:8080, if you don't have this file, I put one under docker/
for you to use)

After this you will have to move into the `exam-infra folder`, and open it up in a 
cli, for example git-bash or cmd. Once there, run `
fly -t <your username> sp -c concourse/pipeline.yml -p exam -l credentials.yml`, this will 
put the pipeline up on concourse, where you will be able to run the the tasks.

Open up `localhost:8080` to access concourse, then run the infra task (Remember to start the 
concourse, un-pause it). After running infra, the pipeline and the herokuapps should be up 
and running. If you get errors, make sure you have space on your heroku, and that the heroku 
apps don't already exist. The infra automatically adds postgres and hosted graphite to all
apps.

Before running the deploy-app task, you need to get the host url for Hosted Graphite. To do 
this you go to your heroku apps, and from its gui go to the Hosted Graphite site. Scroll down
until the API key is visible, and click the `how do I send metrics` button. From there you
take the url that pops up, and run the command 
`heroku config:set GRAPHITE_HOST=<url> --app hundur-app-ci` in your cli.

Now you can run the deploy-app task, it might take a while depending on your internet. When it
finishes, you should be able to access the website on `http://hundur-app-ci.herokuapp.com/`,
the Graphite metrics on the Graphite website, Logzio on the Logzio website, and Statuscake
on the Statuscake website. To enable autodeployment when you push things to git, go to 
your heroku apps, then go under the deployment tab, click on github and find your repo, 
then enable automatic deploys.