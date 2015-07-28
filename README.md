== README

#App for guessing movies

http://guessa.herokuapp.com/

##S3

Register account for S3(http://aws.amazon.com/ru/s3/), if you want to use Heroku. Heroku doesn't provide own storage for files.

Next you need to export environment variables(in Terminal):

    heroku config:set S3_ACCESS_KEY_ID=key_id_here
    heroku config:set S3_SECRET_ACCESS_KEY=your_key_here

Change name of your future bucket(must be unique):
*lib/s3.rb*
    directory = connection.directories.create(
      :key    => "name_of_your_future_bucket", # globally unique name
      :public => true
    )

## Scrapping

    rake import:movies

Enjoy :)