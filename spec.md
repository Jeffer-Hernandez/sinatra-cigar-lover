Specs:

    [X] Use Sinatra to build the app 
    (Used the corneal gem to create app, which uses sinatra)

    [X] Use ActiveRecord for storing information in a database
    (Used active record gem for this app.)

    [X] Include more than one model class (e.g. User, Post, Category)
    (Have a User model and a Post model.)

    [X] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
    (User has_many posts.)

    [X] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
    (Posts belong_to a user.)

    [X] Include user accounts with unique login attribute (username or email)
    (I am validating email for Uniqueness in my User model.)

    [X] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
    (Posts_Controller has all the CRUD functionality.)

    [X] Ensure that users can't modify content created by other users
    (Created helper methods to determine authorization for edits and deletes in Application_Controller, and implemented a conditional statment on the 'post/show' view so that an unauthorized user will not have the option.)

    [X] Include user input validations
    (Both User and Post model have validations from active record to ensure the presence of values in text bars.)

    [X] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
    (Included error/success messages for every page where input needs to be valid and/or unique.)

    [X] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code.
    (README.md file includes all necessary components.)

Confirm:

    [X] You have a large number of small Git commits
    [X] Your commit messages are meaningful
    [X] You made the changes in a commit that relate to the commit message
    [X] You don't include changes in a commit that aren't related to the commit message