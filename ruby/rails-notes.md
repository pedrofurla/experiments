 * From http://guides.rubyonrails.org/getting_started.html

~~~
$ rails new blog
$ cd blog
~~~

 * database config is located at config/database.yml

 * Running the server

 ~~~
 $ rails server
 ~~~
  
   * Browse to http://localhost:3000
   * Click 'application environment' to see info about the app

  
 * Creating a home

~~~
   $ rails generate controller home index
      create  app/controllers/home_controller.rb
       route  get "home/index"
      invoke  erb
      create    app/views/home
      create    app/views/home/index.html.erb
      invoke  test_unit
      create    test/functional/home_controller_test.rb
      invoke  helper
      create    app/helpers/home_helper.rb
      invoke    test_unit
      create      test/unit/helpers/home_helper_test.rb
      invoke  assets
      invoke    coffee
      create      app/assets/javascripts/home.js.coffee
      invoke    scss
      create      app/assets/stylesheets/home.css.scss
~~~

~~~
$ mv public/index.html public/_index.html
~~~

~~~
$ edit app/views/home/index.html.erb
$ edit config/route.rb
~~~

 * Scaffolding blog posts:

~~~
$ rails generate scaffold Post name:string title:string content:text 
invoke  active_record
      create    db/migrate/20120222134507_create_posts.rb
      create    app/models/post.rb
      invoke    test_unit
      create      test/unit/post_test.rb
      create      test/fixtures/posts.yml
       route  resources :posts
      invoke  scaffold_controller
      create    app/controllers/posts_controller.rb
      invoke    erb
      create      app/views/posts
      create      app/views/posts/index.html.erb
      create      app/views/posts/edit.html.erb
      create      app/views/posts/show.html.erb
      create      app/views/posts/new.html.erb
      create      app/views/posts/_form.html.erb
      invoke    test_unit
      create      test/functional/posts_controller_test.rb
      invoke    helper
      create      app/helpers/posts_helper.rb
      invoke      test_unit
      create        test/unit/helpers/posts_helper_test.rb
      invoke  assets
      invoke    coffee
      create      app/assets/javascripts/posts.js.coffee
      invoke    scss
      create      app/assets/stylesheets/posts.css.scss
      invoke  scss
      create    app/assets/stylesheets/scaffolds.css.scss
~~~
 
 * running the db migration created above

~~~
$ rake db:migrate
~~~

  * Use rake db:migrate RAILS_ENV=production to run it for the production db defined in config/database.yml

  * checking the database
~~~
 $ sqlite3 db/development.sqlite3
 sqlite> .tables
 posts              schema_migrations
 sqlite> .schema posts
      CREATE TABLE "posts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "title" varchar(255), "content" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
 sqlite> .exit
 ~~~

  * Set up a model for blog comments

  ~~~
  $ rails generate model Comment commenter:string body:text post:references
    invoke  active_record
      create    db/migrate/20120223102958_create_comments.rb
      create    app/models/comment.rb
      invoke    test_unit
      create      test/unit/comment_test.rb
      create      test/fixtures/comments.yml
  $ rake db:migration
  ~~~



* Create the Comments controller:

~~~
% rails generate controller Comments
      create  app/controllers/comments_controller.rb
      invoke  erb
      create    app/views/comments
      invoke  test_unit
      create    test/functional/comments_controller_test.rb
      invoke  helper
      create    app/helpers/comments_helper.rb
      invoke    test_unit
      create      test/unit/helpers/comments_helper_test.rb
      invoke  assets
      invoke    coffee
      create      app/assets/javascripts/comments.js.coffee
      invoke    scss
      create      app/assets/stylesheets/comments.css.scss
~~~


 * Partials

 