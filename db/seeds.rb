require 'faker'

user1 = User.create(email: "AriGold@imin.com",
                   username: "AriGold",
                   password: "password")
user2 = User.create(email: "elztheman@imin.com",
                   username: "elztheman",
                   password: "password")
user3 = User.create(email: "vincechase@imin.com",
                   username: "VincentChase",
                   password: "password")
user4 = User.create(email: "stella@imin.com",
                   username: "StellaKim",
                   password: "password")
user5 = User.create(email: "cmoon@imin.com",
                   username: "ChristianTheLegendMoon",
                   password: "password")
user6 = User.create(email: "fahiamoh@imin.com",
                   username: "FahiaMohSwag",
                   password: "password")
user7 = User.create(email: "denzel@imin.com",
                   username: "DenzelWashington",
                   password: "password")
user8 = User.create(email: "denzel@imin.com",
                   username: "denzelwashington",
                   password: "password")
user9 = User.create(email: "chrisbrown@imin.com",
                   username: "chrisbrown",
                   password: "password")
user10 = User.create(email: "parkleesung@imin.com",
                   username: "Parkjsung",
                   password: "password")

party = user1.created_events.create(name: "Party at the Ritz",
                  description: "Exclusive Event @ the Ritz, Dress code. Special guest appearance: Christian Moon",
                  start_time: "2014-10-14 17:33:09",
                  end_time: "2014-10-15 17:33:09",
                  venue: "The Ritz Carlton Hotel",
                  location: "77 Water St, New York, NY 10005",
                  notify_user?: true,
                  notify_hours_until_event: 3)

party.invitations.create(user_id: 2, status: "in")
party.invitations.create(user_id: 3, status: "in")
party.invitations.create(user_id: 4, status: "pending")
party.invitations.create(user_id: 5, status: "pending")

frisbee = user1.created_events.create(name: "Night @ Lavo",
                  description: "Reach Lavo for a fun night!",
                  start_time: "2014-10-14 17:33:09",
                  end_time: "2014-10-15 17:33:09",
                  venue: "Central Park",
                  location: "Central Park, New York, NY",
                  notify_user?: true,
                  notify_hours_until_event: 3)

frisbee.invitations.create(user_id: 3, status: "in")
frisbee.invitations.create(user_id: 4, status: "pending")
frisbee.invitations.create(user_id: 5, status: "pending")

yoga = user1.created_events.create(name: "Yoga",
                  description: "just breathe",
                  start_time: "2014-10-14 17:33:09",
                  end_time: "2014-10-15 17:33:09",
                  venue: "DBC",
                  location: "17 state street, New York, NY",
                  notify_user?: true,
                  notify_hours_until_event: 3)

yoga.invitations.create(user_id: 4, status: "in")
yoga.invitations.create(user_id: 5, status: "pending")

demo_day = user2.created_events.create(name: "DBC Demo Day",
                  description: "are you in?",
                  start_time: "2014-08-22 10:33:09",
                  end_time: "2014-08-22 11:33:09",
                  venue: "Meatpacking District",
                  location: "2 east 42nd street, new york, ny",
                  notify_user?: true,
                  notify_hours_until_event: 3)

demo_day.invitations.create(user_id: 1, status: "in")
demo_day.invitations.create(user_id: 3, status: "in")
demo_day.invitations.create(user_id: 4, status: "pending")
demo_day.invitations.create(user_id: 5, status: "pending")

sleepover = user3.created_events.create(name: "Sleepover at DBC",
                  description: "goodtimes",
                  start_time: "2014-11-14 17:33:09",
                  end_time: "2014-11-15 17:33:09",
                  venue: "Chelsea",
                  location: "48 Wall St, new york, ny",
                  notify_user?: true,
                  notify_hours_until_event: 3)

sleepover.invitations.create(user_id: 1, status: "pending")
sleepover.invitations.create(user_id: 3, status: "in")
sleepover.invitations.create(user_id: 4, status: "pending")
sleepover.invitations.create(user_id: 5, status: "pending")

learningswift = user3.created_events.create(name: "Learning Swift",
                  description: "goodtimes",
                  start_time: "2014-11-14 17:33:09",
                  end_time: "2014-11-15 17:33:09",
                  venue: "Lower East Side",
                  location: "100 East Broadway, new york, ny",
                  notify_user?: true,
                  notify_hours_until_event: 3)

learningswift.invitations.create(user_id: 1, status: "in")
learningswift.invitations.create(user_id: 3, status: "in")
learningswift.invitations.create(user_id: 4, status: "pending")
learningswift.invitations.create(user_id: 5, status: "pending")

killingtime = user3.created_events.create(name: "Killing Time",
                  description: "sleep is for the weak",
                  start_time: "2014-11-14 17:33:09",
                  end_time: "2014-11-15 17:33:09",
                  venue: "Upper East Side",
                  location: "102nd street, new york, ny",
                  notify_user?: true,
                  notify_hours_until_event: 3)

killingtime.invitations.create(user_id: 1, status: "pending")
killingtime.invitations.create(user_id: 3, status: "in")
killingtime.invitations.create(user_id: 4, status: "pending")
killingtime.invitations.create(user_id: 5, status: "pending")

user1.follow(user2)
user1.follow(user3)
user1.follow(user4)
user1.follow(user5)

user2.follow(user1)
user3.follow(user1)
user4.follow(user1)
user5.follow(user1)

