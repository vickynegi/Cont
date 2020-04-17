# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 2.5
* Rails 5.2
* Database: PostgreSQL 10.12
* please mention database and password in database.yml file
* please run following commands:- 
  rake db:create
  rake db:migrate
* please specify sender's user_name and password in config/environments/development.rb file under "config.action_mailer.smtp_settings"
*  visit this link https://myaccount.google.com/lesssecureapps and enable it.
* please install redis
* I have used sidekiq to send email purpose
* whenever run the server, please run 2 commands in other terminals redis-server and sidekiq respectively
* a visitor can send multiple messages whenver he wants. I have put validation of uniqueness on visitor's email. If he visits 1st time and enters deltails such as first_name, last_name, phone no, email id, message then all the details will be saved and check the receiver's email box. But if he visits 2nd, 3rd and so on time and enters his same email id which he gave during 1st time then:- a) details such as first_name, last_name, phone no will be updated. b) new message will be saved. c) all the data of old/new messages is stored in database.
* in app/mailers/visitor_mailer.rb file, please specify the sender's/receiver's email in mail(from: "sender_email_id", to: "receiver_email_id") method 
