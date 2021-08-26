#first register for Twitter academic research account, then get the bearer token and run twarc configure to setup the authentication (user/pass).
pip install --upgrade twarc
twarc configure
twarc2 search --start-time 2020-02-01 --end-time 2021-08-20  --archive  "(corona OR covid OR pandemic OR covid-19 OR covid19 OR virus OR lockdown OR vax OR vaccine OR lockdown OR restriction OR border OR quarantine OR vaccination OR hotspot OR jab) place_country:au is:verified" > tweets_raw.json
twarc2 flatten tweets_raw.json tweets.json
cat tweets.json | jq -r '[.author.name, .author.username, .author.description,  .text] | @tsv' > tweets.tsv
wc -l tweets.tsv

