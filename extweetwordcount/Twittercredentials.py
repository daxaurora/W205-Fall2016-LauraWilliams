import tweepy

consumer_key = "ZSBVncc7Ducoi1wpagg1cVwZx";
#eg: consumer_key = "YisfFjiodKtojtUvW4MSEcPm";


consumer_secret = "iHzPeZe6mY5YhwK43EsQwnXHMfAEzvcAJ1nsR8LCGSpeeflCgk";
#eg: consumer_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token = "798563487886606336-VmKXDY8NYOnoCf6TXBA7jjnXWPFXlM2";
#eg: access_token = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token_secret = "cgsRhCZsipYTQuwbSWgRrcW76VEyrYOfGbUHMQBVvMq4j";
#eg: access_token_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";


auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)

api = tweepy.API(auth)



