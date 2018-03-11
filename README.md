# AccompList: Taking Cred for Little Victories

## Usage
Fork, clone, bundle install, db:migrate, db:seed (for dummy data)

<img src="/app/assets/images/landingpage.png" alt="Welcome Page Screenshot">

## About
I got the idea for this app from using my GitHub commit graph as daily motivation to keep working while I was feeling down for a few months. My rule of getting a light green box on the board for weekdays was usually the catalyst I needed to work the rest of the day.

Knowing that personal goals can look drastically different for everyone, I made this app for anyone wanting to visually see that they're getting stuff done over time-- all those little and big victories beyond GitHub commits. :)

## This Branch
This branch uses a jQuery implementation in the frontend. This allows the individual lists to be browsed from the list#index page. It also allows items to be created on the list#show page without refreshing the page, and it gives the user an option to see all the tags in the database if they're stumped on what new tags to create.


# Technical Details

## Models/relationships
User, List, Item, ItemTag, Tag.


Items and tags have a many to many relationship. Items belong to lists, lists belong to users.

## Authentication
Accomplist uses Devise to manage users and sessions, and provides an option to login through Facebook with OmniAuth.

<img src="/app/assets/images/signup.png" alt="Signup Page Screenshot">

## Validations
Validations are fairly simple. Basically every field is required and must be unique, except item names (users can list the same item title as often as they want.)

<img src="/app/assets/images/listindex-jquery.png" alt="Lists Page Screenshot">

## User Journey
The app currently allows users to sign in and see a colour-coded calendar for the year 2018. Days that were more productive are darker colours. The user can view their existing lists (one per day) or start a new list for today. Lists can have items (or "accomplishments") added to them. Each item can have extra points given it if it was a big accomplishment, but the default is one point per item. Tags can be added when the item is added to a list. The tags are viewable under each day's list. 

<img src="/app/assets/images/listshow-jquery.png" alt="List Item Form Screenshot">

## Error Handling
Form submission errors will render the "Add Item" form with a highlighted error message (e.g. "title cannot be blank"). Devise supplies built in error messages for user login/signup messages. For anything else, I generalized error handling to redirect back to the root path if there's an ActiveRecord error or if a random path is entered. This could use some refining eventually but the goal here was to have a catch all for any issues I haven't already planned for.

## Next Steps
This app was meant to be an MVP product. Next steps would be improving responsiveness on mobile screens, making items editable, expanding OmniAuth options for logins, and making the '/tags' page have links to associated lists.

## Contributing
Please feel welcome to create an issue or open a pull request with any bugs/suggestions. Keep in mind this is a project for Flatiron, though....

## License
This app is licensed under Creative Commons Attribution-NonCommercial 4.0 International (CC BY-NC 4.0).

<3
