# Blog Tutorial Zone

## Running on local:
Get postgres installed: (http://postgresapp.com/)
Next, create a database config from the example:
` cp config/database.example.yml config/database.yml `
You'll want to update the username section: ` username: yournamehere `

Now we can setup our database:
```
rake db:create
rake db:migrate
```
You should be ready to go!

### Testing
This app uses minitest for testing. Run the tests with the following command:
` rake test `
