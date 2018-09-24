# README

This is the source code for my personal music website, [ashleysbrother.com.](ashleysbrother.com)
Feel totally free to fork it and make your own music website with this code, or if you spot any issues, submit a pull request!

***

This website uses Postgres for a database, and in production is currently set to use Amazon S3 to store songs. 
You may have to set up a database on your local machine, as well as configure your host to use Amazon S3 in production.
***

To get up and running, cd to the root of the project and run
```
rails db:migrate
rails s
```
Then, pull up the Rails console and create a new Admin account
```
rails c
Admin.create(name: "Example", password: "foobar")
```
After making an account at the console, head to the website and sign in to start uploading music.
***
Each song has options for a Title, Artist, Album, Album position, Artwork, and Tags.
The default view will sort all songs by Title, as well as generating a tag cloud and the ability to view songs by album. 
Songs will play in order as they appear on screen, i.e. when one song ends the next one below it on the list will begin playing.
