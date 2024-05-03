# SNS Discord Webhook

Sends a message to a Discord based on the contents of a SNS Topic message.

## Development

### Prerequsites

- Python
- Pipenv

### Running Locally

1. pipenv install
1. Set discord_webhook_url environment variable
1. pipenv run python-lambda-local -f lambda_handler lambda_function.py test/sample_event.json

