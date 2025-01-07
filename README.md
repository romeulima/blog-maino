![Logo of the project](https://i0.wp.com/maino.com.br/wp-content/uploads/2021/11/Logo-Oficial.webp?fit=300%2C129&ssl=1)

# Mainô Blog
> Additional information or tagline

I developed a blog as part of a technical challenge for Mainô, a company focused on technological solutions for foreign trade. This project aims to demonstrate skills in backend development using Ruby on Rails. This includes functionalities specified by the company itself. This project also reflects the ability to create solid, optimized and adaptable backend solutions, following the good practices and standards expected in the industry.

## Installing / Getting started

To install and run this application, you will need Docker installed on your machine. If you don't have Docker yet, follow the instructions in the link below to install Docker:

```shell
https://docs.docker.com/get-started/get-docker/
```

Once Docker is installed, verify the installation with the following command:
```sh
$ docker run hello-world
```

### Initial Configuration

You will initially need two files: 
```shell
.env
config/master.key
```
> .env is used to define some environment variables, such as database variables and application variables

> master.key is used to decrypt the config/credentials.yml.enc file, which holds sensitive credentials for your application.

### Steps to Generate master.key

Run this command:
```shell
rails secret
```
```shell
bin/rails credentials:edit
```
Once you have the master.key, the bin/rails credentials:edit command can be used to edit the credentials in config/credentials.yml.enc. When you run this command, it uses the key to decrypt the credentials.yml.enc file for editing.

Adicione as credenciais do Gmail no arquivo
```yaml
smtp:
  user-name: 'email@gmail.com'
  password: 'senha'
```
The password is the gmail password. If you have 2Fa, generate an app password and use that instead. To generate the password, go to [https://support.google.com/accounts/answer/185833?hl=pt-br]

#### If you haven't ruby you can make this:
```shell
docker pull ruby
docker run -it --rm ruby bash
gem install rails
rails secret
exit
```

Copy the generated secret into config/master.key

## Developing

Clone this repository to your machine:

```shell
git clone git@github.com:romeulima/blog-maino.git
cd blog-maino/
```

Make sure you have already included the .env in the root of the project and config/master.key

### Building

```sh
$ docker-compose build

$ docker-compose run web bundle exec rails db:create

$ docker-compose run web bundle exec rails db:migrate

$ docker-compose up
```
Now you can access localhost <strong>without port</strong>

## Features

### Public Area (Logged Out)
* View posts published by all users, ordered from newest to oldest.
* Posts should be paginated after 3 posts, meaning the 4th post will move to page 2 and so on, with each page containing up to 3 posts.
* Post anonymous comments.
* Register a new user.
* Login with an existing user.
* Recover the user’s password.

### Logged-in Area
* Write and publish a post.
* Edit and delete posts previously published by the logged-in user.
* Comment with an identified user login.
* Edit the user profile.
* Change the logged-in user's password.

### Optional Features
* Write simple automated tests
* Implement internationalization
* Add tags to posts and provide filters to use the registered tags. Tags should be implemented as a new table in the model, associated with the posts.

### Super Differentiator
* Enable TXT file upload for creating one or more posts or creating multiple tags, using Sidekiq for asynchronous processing (if possible).
```
  Post Title
  Post content
  tag1, tag2, tag3
  
  Post Title
  Post content
  ```

This application contains all this and more

## Additional Features
* Design a Docker environment for the application to ease deployment and simplify running the application locally on any machine.
* Implement email sending functionality.
* Create a page to display posts for each individual user.
* Creativity

## Future tasks
- Add CI/CD pipeline
- View to show posts by a specific user
- Delete comment
- Reply to comment
- Change the search to filter similar tags and not just the same ones

## Links
- Repository: https://github.com/romeulima/blog-maino/
- LinkedIn: https://linkedin.com/in/sromeulima/
- Application: http://165.227.27.64/

## Licensing
"The code in this project is licensed under MIT license."
