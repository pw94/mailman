# Mailman

This is mailing sending application using [SendGrid API](https://sendgrid.com/docs/index.html).

## Install dependencies
```
bundle
```

## Setup Environment Variables

Update the development environment with your [SENDGRID_API_KEY](https://app.sendgrid.com/settings/api_keys), for example:

```bash
echo "export SENDGRID_API_KEY='YOUR_API_KEY'" > sendgrid.env
echo "sendgrid.env" >> .gitignore
source ./sendgrid.env
```

## Database creation
```
rake db:migrate
```

## Database initialization
```
rake db:setup
```

## Start
```
rails s
```

## How to run the test suite
```
rake test
cucumber
```
