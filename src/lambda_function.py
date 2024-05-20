import os
from discord_webhook import DiscordWebhook

def lambda_handler(event, context):
    url = os.environ.get("discord_webhook_url", None)
    if not url:
        raise ValueError("Env var 'discord_webhook_url' must be set")

    for record in event['Records']:
        try:
            message = record['Sns']['Message']
            webhook = DiscordWebhook(url=url, content=message)
            webhook.execute()
        except Exception as e:
            print("An error occurred")
            raise e
    return "ok"
