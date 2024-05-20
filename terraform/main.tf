provider "aws" {
  region = "us-east-1"
}

module "lambda_function" {
  source = "terraform-aws-modules/lambda/aws"

  function_name          = "sns-discord-webhook"
  description            = "SNS Discord Webhook"
  handler                = "lambda_function.lambda_handler"
  runtime                = "python3.11"
  create_package         = false
  local_existing_package = "../lambda_function.zip"
  role_name              = "SnsDiscordWebhookLambda"
  policy_name            = "SnsDiscordWebhookLambda"
  timeout                = 60
  environment_variables = {
    discord_webhook_url = var.discord_webhook_url
  }
}

module "sns_topic" {
  source = "terraform-aws-modules/sns/aws"

  name         = "sns-discord-webhook"
  display_name = "SNS Discord Webhook"

  subscriptions = {
    lambda = {
      protocol = "lambda"
      endpoint = module.lambda_function.lambda_function_arn
    }
  }
}
