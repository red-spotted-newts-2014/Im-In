require 'faker'

user1 = User.create(email: "user1@imin.com",
                   username: "user1",
                   password: "password")
user2 = User.create(email: "user2@imin.com",
                   username: "user2",
                   password: "password")
user3 = User.create(email: "user3@imin.com",
                   username: "user3",
                   password: "password")
user4 = User.create(email: "user4@imin.com",
                   username: "user4",
                   password: "password")
user5 = User.create(email: "user5@imin.com",
                   username: "user5",
                   password: "password")

party = user1.events.create(name: "Party at Elz",
                  description: "goodtimes",
                  start_time: "2014-10-14 17:33:09",
                  end_time: "2014-10-15 17:33:09",
                  venue: "elz house",
                  location: "elz house, new york, ny",
                  notify_user?: true,
                  notify_hours_until_event: 3)

party.invitations.create(user_id: 2, status: "in")
party.invitations.create(user_id: 3, status: "in")
party.invitations.create(user_id: 4, status: "pending")
party.invitations.create(user_id: 5, status: "pending")

frisbee = user1.events.create(name: "Frisbee",
                  description: "get some fresh air",
                  start_time: "2014-10-14 17:33:09",
                  end_time: "2014-10-15 17:33:09",
                  venue: "Central Park",
                  location: "Central Park, New York, NY",
                  notify_user?: true,
                  notify_hours_until_event: 3)

frisbee.invitations.create(user_id: 3, status: "in")
frisbee.invitations.create(user_id: 4, status: "pending")
frisbee.invitations.create(user_id: 5, status: "out")

yoga = user1.events.create(name: "Yoga",
                  description: "just breathe",
                  start_time: "2014-10-14 17:33:09",
                  end_time: "2014-10-15 17:33:09",
                  venue: "DBC",
                  location: "48 Wall St, New York, NY",
                  notify_user?: true,
                  notify_hours_until_event: 3)

yoga.invitations.create(user_id: 4, status: "in")
yoga.invitations.create(user_id: 5, status: "pending")

