# README

## Usage
Fork, bundle install, db:migrate, db:seed (for dummy data)

## About
I got the idea for this app from using my GitHub commit graph as daily motivation to keep working while I was feeling down for a few months.

After years of working in mental health services so I know personal goals can look drastically different for everyone. Things like getting out of bed, going for a walk to relieve anxiety, and making plans with friends when you're tempted to stay in (again) can be a big deal if you're having a tough time.

I made this app for anyone wanting to visually see that they're getting stuff done over time-- stuff beyond GitHub commits. :)


# Technical Details

## Models/relationships
User, List, Item, ItemTag, Tag
Items and tags have a many to many relationship. Items belong to lists, lists belong to users.

##Authentication
Accomplist uses Devise to manage users and sessions, and provides an option to login through Facebook with OmniAuth.

#Validations
Validations are fairly simple. Basically every field is required and must be unique, except item names (users can list the same item title as often as they want.)
