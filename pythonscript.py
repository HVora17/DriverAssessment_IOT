import geocoder
import time
from twilio.rest import Client

account_sid = 'AC4e8560cb2f95056a3560d830b511e71f'
auth_token = 'd471eea351e5b59aeabc4d36ecfcc5ef'
  
client = Client(account_sid, auth_token)

g = geocoder.ip('me')
print(g)
gps1,gps2 = g.latlng

client.messages.create(
			    from_= "+16165800950",
                body = "URGENT!! The driver is at http://maps.google.com/?q={},{} , GET IN TOUCH ASAP!!!".format(gps1, gps2),
                to= "+918169131878",
		              
            )
print("sent")

client.messages.create(
			    from_= "+16165800950",
                body = "URGENT!! The driver is at http://maps.google.com/?q={},{} , GET IN TOUCH ASAP!!!".format(gps1, gps2),
                to= "+918291604813",
		              
            )
print("sent")

client.messages.create(
			    from_= "+16165800950",
                body = "URGENT!! The driver is at http://maps.google.com/?q={},{} , GET IN TOUCH ASAP!!!".format(gps1, gps2),
                to= "+919757283521",
		              
            )
print("sent")