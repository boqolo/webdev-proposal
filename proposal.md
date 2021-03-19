## Final Project Proposal: Disposocial

When the parameters for the final project were released, 
I was stoked to begin what I knew would be the most 
ambitious of the assignments thus far, but also struck
with the uneasiness that comes with charting new terrain.
I had a few ideas brewing but had to carefully weigh all 
of my options for their complexity, suitability, my 
confidence, and my interests. I deliberated this topic
amongst myself and some companions on what it was I should
do that could maybe be of some real world use. However, 
I am now pleased to have committed to the idea of what I
will henceforth call Disposocial.

Disposocial is, as its name suggests (quite cheekily
I might add), a disposable social network. To expand,
it is a localized, duration-based, self-discarding bulletin/
chat room/social media. This is the vision at least.

Let me be specific: on Disposocial, user accounts are temporary
by design (also convenient due to the lack of disk space on my
VPS). Once an account is created, if there is a disposable social
network (henceforth called a 'Dispo' because branding is key, right)
active within a radius of the user's location, they may join it.
If one does not exist, they may create one themselves. ALL Dispos
have a duration. They are not persistent. Ideally, this would be
an option that the user could specify (1 hour, 1 day, 2 days, 
1 week). Once in a Dispo, Disposocial acts like a rudimentary
social media platform, allowing text posts, small media content,
post tags, live presence, having a live feed, and a ticker with
updates when people join. 

Once you leave the Dispo, your user account is deleted. This
necessarily implies that you may only be in one Dispo at a time
and to rejoin means to create a new user. If you feel data 
separation anxiety, there might be some discussion to add an
export feature.

The idea is that creating your own custom social spaces should
be lightweight, easy to use, and laidback.

What are the use cases? Well, a club or other organizational
gathering could find some use in creating group communication
without forming a permanent groupchat that we know we'll 
forget to leave and will more than likely annoy us in the future
when its use is definitely expired but at least one person is 
still sending memes to an unresponsive crowd. A slightly adapted
case is if there were a Dispo at a restaurant and guests could
throw out recommendations or post comments about their experience.
Newcomers could log on (because the Dispo is in their vicinity) and
read about how others are liking their food without gawking at
others' plates. A group of friends might like to just have their 
own space to goof off and not feel inhibited by the eyes of the 
world.

At any rate, the common denominator in the use cases could be 
reduced to a user story that goes a little something like this:

- Boqolo visits the site
- There are no active Dispos in Boqolo's vicinity
- He chooses to create one for 1 hour
- He inputs his phone number
- He receives a verification text message with a one-time password
- He enters it along with his username
- He is logged in and has access to the social space
- He can see stats about how many have joined, are online, 
  and how much time is left before the Dispo self-destructs
- He creates a post, "first post! I am alone in here" and 
  tags it "OG"
- It populates the feed and the new tag shows up as a category
- He clicks an 'Invite' button to send the link to his friend
- The friend clicks the link and is taken to the login page
- The friend follows the same auth-flow and logs in
- Boqolo sees the live update of the friend joining
- The friend accidentally closed the tab
- The friend opens a new window and sees her session is persisted
- Boqolo clicks the friend's name from the user list and can see
  her profile along with some basic stats
- The friend tells her friend in Detroit about Disposocial
- The Detroit friend visits the site but cannot join Boqolo's
  Dispo because they are not in the same geographical vicinity
- She sees her neighborhood has an active Dispo and joins
- After a good time with friends, Boqolo says goodbye, and 
  clicks "Exit"
- He is prompted that his account will be closed and clicks "Ok"
- The first friend sees that he is no longer online but can
  still see his posts in the feed and click on his profile
- The next day, Boqolo visits the site and does not see any active
  Dispos because it has been deleted

The development team for this project is currently composed only
of myself. The API I plan to use is Twilio's SMS API for user
verification and log in. Realtime behavior will be encompassed
by the live feed/timeline which in the backend will be a Phoenix
Channel broadcast to connected users of the Dispo on every
dispatchable action depending on if they are on a certain screen.
Apart from users, I will be using Postgres to store the Dispo and
its critical metadata (when created, by who, global updates, etc).
The neat feature that I want to do is the geolocation aspect, which
will use the HTML Location API.

The Location API was one of my tests and I used it to learn how
to access the location data, what stage in the user story to use it,
and how complicated it would be. I found that it was very 
straightforward to use but unfortunately may not be the most accurate.
The degree of error in my tests was 65 meters. This will effect my
radius calculations for determining who can join a Dispo. 

My second test was the Twilio SMS API. I tried using an HTTP client
from Elixir to send an sms request and send a text to my phone.
I ran into problems with this quickly mainly to do with formatting
my request and using the libraries. After spending a lot of time
and not able to dispatch a text from iex, I tried a different API
called D7SMS. It went more smoothly for me but the messages were
sent pretty slow. I will need to get this working for the 
functionality and to meet the requirements but for now, I learned
that if I can't get it to work, then I'll need to be ready for
a substitution, or worst case, fallback to regular username and
passwords.

I did a third little test on random word generation for Dispo
names (to be used for URLs) sourced from a file. It was successful.




