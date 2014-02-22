I'm really new to this :)

Phone.com is releasing a new API (currently in Beta as of this writing - 2.22.2014 @ 1:31 am PST).  One of the guys who currently work there asked me to help test it, and I've written just a single function thus far.  I plan to continuously implement all the functionality their API offers.

A couple notes - the gem is available on RubyGems.org - so just 'gem install phone-dot-com' and you should have it.

This is my first gem - and I've written it the way I know how to write gems, which means using a lot of 'self.' tags on the methods as I never quite grasped why making a variable an instance of the class was better?  But anyway - please feel free to do with this as you like.  I'm happy to give something back to someone.

I set it up to expect environment variables - you need to set ENV['PHONE_DOT_COM_KEY'] and ENV['PHONE_DOT_COM_PASSWORD'] in your environment for authentication.  Which means you need to sign up for their API.

The usage as of right now is :  PhoneDotCom.send_new_sms(from,to,msg)

The FROM will be the phone number for your account once you've got access to their API.  

The TO will be the number that you wish to send the SMS to - keeping in mind this is a US-only service right now.

Phone number formats MUST be '+1XXXXXXXXXX' with the Internationally-accepted + and country code.

The message will be any string.  Be careful if you're going to pass the + as a parameter from some on-click event, you have to encode that and then decode it.  Probably easier to add the +1 to the params[:from] or whatever then send that.