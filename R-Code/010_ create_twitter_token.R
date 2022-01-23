# 010_ create_twitter_token

# Script , dass Zugang zu den tweets von Twitter ermöglicht-

# Setup API to twitter ----------------------------------------------------

# whatever name you assigned to your created app
appname <- "autotram"

## api key (example below is not a real key)
key <- "5ZwwHySjtcpYza41ZBhsmSZq4"

## api secret (example below is not a real key)
secret <- "cRq0JljG9i62O3IFcopE9NOWrgbbg2Ra2hs2DKwT8ZHnZUhv89"

access_token <- "1211733566406582272-Z6RfVgAJWS6NGM9jqFGmNoknfW05zs"

access_secret <- "skabqWpQkM8u4AftE5iqDAyywA46XRX9hQjef0WAEyONE"

# create token named "twitter_token"
twitter_token <- create_token(
  app = appname,
  consumer_key = key,
  consumer_secret = secret,
  access_token = access_token,
  access_secret = access_secret)
