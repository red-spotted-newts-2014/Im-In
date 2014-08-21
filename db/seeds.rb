require 'faker'

user1 = User.create(email: "AriGold@imin.com",
                   username: "AriGold",
                   phone_number: "4383984323",
                   first_name: "Ari",
                   last_name: "Gold",
                   password: "password")
user2 = User.create(email: "elztheman@imin.com",
                   username: "elztheman",
                   phone_number: "0987893232",
                   first_name: "Elz",
                   last_name: "Theman",
                   password: "password")
user3 = User.create(email: "vincechase@imin.com",
                   username: "VincentChase",
                   phone_number: "4168323284",
                   first_name: "Vincent",
                   last_name: "Chase",
                   password: "password")
user4 = User.create(email: "stella@imin.com",
                   username: "StellaArtoisKim",
                   phone_number: "4163273627",
                   first_name: "Stella",
                   last_name: "Kim",
                   password: "password")
user5 = User.create(email: "cmoon@imin.com",
                   username: "ChristianTheLegendMoon",
                   phone_number: "4163728732",
                   first_name: "ChristianTheLegend",
                   last_name: "Moon",
                   password: "password")
user6 = User.create(email: "fahiamoh@imin.com",
                   username: "FahiaMohSwag",
                   phone_number: "4163892343",
                   first_name: "Fahia",
                   last_name: "Moh",
                   password: "password")
user7 = User.create(email: "denzel@imin.com",
                   username: "DenzelWashington",
                   phone_number: "4169984567",
                   first_name: "Denzel",
                   last_name: "Washington",
                   password: "password")
user8 = User.create(email: "bradpitt@imin.com",
                   username: "bpitt",
                   phone_number: "4167738873",
                   first_name: "Brad",
                   last_name: "Pitt",
                   password: "password")
user9 = User.create(email: "chrisbrown@imin.com",
                   username: "chrisbrown",
                   phone_number: "4163273617",
                   first_name: "Chris",
                   last_name: "Brown",
                   password: "password")
user10 = User.create(email: "parkleesung@imin.com",
                   username: "Parkjsung",
                   phone_number: "4163272127",
                   first_name: "Park",
                   last_name: "Sung",
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

user2.follow(user1)
user2.follow(user3)
user2.follow(user4)
user2.follow(user5)
user2.follow(user6)
user2.follow(user7)
user2.follow(user8)
user2.follow(user9)
user2.follow(user10)

user1.follow(user2)
user3.follow(user2)
user4.follow(user2)
user5.follow(user2)
user5.follow(user2)
user6.follow(user2)
user7.follow(user2)
user8.follow(user2)
user9.follow(user2)

user5.follow(user2)
user5.follow(user3)
user5.follow(user4)
user5.follow(user1)
user5.follow(user6)
user5.follow(user7)
user5.follow(user8)
user5.follow(user9)
user5.follow(user10)

user1.follow(user5)
user3.follow(user5)
user4.follow(user5)
user2.follow(user5)
user5.follow(user5)
user6.follow(user5)
user7.follow(user5)
user8.follow(user5)
user9.follow(user5)

