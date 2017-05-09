# README
https://blog-jesusmiramontes.c9users.io

Simple web-app using Ruby on Rails. 

**Features:**
* User authentication.
* Visits counter on each post.
* Comments on each post.

**Configuration:**
I'm using Mysql2

* adapter: mysql2
* encoding: utf8
* pool: 5
* username: root
* password: root
* host: localhost
* port: **3307**

**How to run the test suite**
1. rails db:create
1. rails db:migrate
1. rails s
