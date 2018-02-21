
     ,-----.,--.                  ,--. ,---.   ,--.,------.  ,------.
    '  .--./|  | ,---. ,--.,--. ,-|  || o   \  |  ||  .-.  \ |  .---'
    |  |    |  || .-. ||  ||  |' .-. |`..'  |  |  ||  |  \  :|  `--, 
    '  '--'\|  |' '-' ''  ''  '\ `-' | .'  /   |  ||  '--'  /|  `---.
     `-----'`--' `---'  `----'  `---'  `--'    `--'`-------' `------'
    ----------------------------------------------------------------- 


Welcome to your Rails project on Cloud9 IDE!

To get started, just do the following:

1. Run the project with the "Run Project" button in the menu bar on top of the IDE.
2. Preview your new app by clicking on the URL that appears in the Run panel below (https://HOSTNAME/).

Happy coding!
The Cloud9 IDE team


## Support & Documentation

Visit http://docs.c9.io for support, or to learn more about using Cloud9 IDE. 
To watch some training videos, visit http://www.youtube.com/user/c9ide
## Blocipedia
Build an application that allows users to create public and private Markdown-based wikis.

### Generate a New Rails App
In your command line, cd into your work directory, create a new Rails app, new-rails-project is our example. Then, cd into the new-rails-project directory.

```
~/path/to/work/directory/
$ rails new new-rails-project --skip-test-unit
$ cd new-rails-project
```
Configure Git and GitHub
Sign into your GitHub account and create a new repository, we'll name ours “new-rails-project.” Instead of following GitHub's directions after creating the repository, initialize a git repo in your project directory with this command:

```
~/path/to/work/directory/new-rails-project/
$ git init
```
To push commits to GitHub, we have to specify the remote repository with git remote add origin.

```
~/path/to/work/directory/new-rails-project/
$ git remote add origin https://github.com/<user name>/new-rails-project.git
```
Your project is configured to use Git and GitHub.

### Add Default Gems
Replace the contents of your Gemfile with the following:
```
Gemfile
 source 'https://rubygems.org'
 
 git_source(:github) do |repo_name|
   repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
   "https://github.com/#{repo_name}.git"
 end
 
 # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
 gem 'rails', '~> 5.1.2'
 
 group :production do
   # Use pg as the production database for Active Record
   gem 'pg'
 end
 
 group :development do
   # Use sqlite3 as the development database for Active Record
   gem 'sqlite3'
   gem 'web-console', '~> 2.0'
 end
 
 # Use Puma as the app server
 gem 'puma', '~> 3.0'
 # Use SCSS for stylesheets
 gem 'sass-rails', '~> 5.0'
 # Use Uglifier as compressor for JavaScript assets
 gem 'uglifier', '>= 1.3.0'
 
 # Use jquery as the JavaScript library
 gem 'jquery-rails'
 # Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
 gem 'turbolinks', '~> 5'
 # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
 gem 'jbuilder', '~> 2.5'
 
 gem 'thor', '0.19.1'
 
 group :development do
   gem 'listen', '~> 3.0.5'
 end
 ```
 
 ## User Sign Up
As a user, I want to sign up for a free account by providing a user name, password and email

### Incorporate Devise
Use the Devise gem for authentication. Userpedia's authentication system should allow users to sign up and send emails for account confirmation. Refer to the Devise Resource and the Devise Getting Started Guide for examples on implementing user sign up.

### Test Your Code
1. Sign a new user up. Do you receive a confirmation email?
1. What happens if you attempt to sign up with an invalid email?
1. What happens if you attempt to sign up with a duplicate email?

## User Sign in and Out
As a user, I want to sign in and out of Userpedia

Now that users can sign up for Userpedia, you want to give them a way to sign in and out of the app. Refer to our Devise Resource and the Devise Getting Started Guide for examples on implementing user sign in/out with Devise.

### Test Your Code
1. Sign into Userpedia, does the top navigation change to indicate you are signed in?
1. Sign out of Userpedia, does the top navigation change to indicate you are signed out?
1. What happens if you attempt to reset your password?

## Wiki CRUD
As a user with a standard account, I want to create, read, update, and delete public wikis

### Create the Model
Create the wiki model. For guidance, you can refer to the Models Checkpoint. Start by generating the Wiki model:

```
Terminal
$ rails g model Wiki title:string body:text private:boolean user:references:index
The wikis_controller will replace the posts_controller in Userpedia.
```
### Test Your Code
1. Are you able to create new public wikis?
1. Are you able to update public wikis?
1. Are you able to delete public wikis?

## User Roles
As a developer, I want to offer three user roles: admin, standard, or premium

### Incorporate Pundit
Use the Pundit gem for authorization. Users should have one of three roles: standard (free), premium, or admin. Refer to the Pundit Readme checkpoint for examples of using Pundit policies.

### Default to Standard
Users should default to the standard role when they are first created. There are several ways to implement default values. Use the after_initialize callback approach to implement default values for roles.

In Userpedia, users should be able to edit any public wiki. To allow this behavior, change the update? method in application_policy.rb:
```
app/policies/application_policy
  def update?
    user.present?
  end
  ```
### Test Your Code
1. Use the Rails console to create a new user. Are they given the default role?
1. Are you able to edit wikis created by another user?

