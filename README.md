Twitter and Resque Experiment
================================
A twitter and resque experiment that will send tweets to my
account at a certain future time.

Make sure to edit config/initializers/twitter.rb.example and 
change to twitter.rb

Also, make sure to put the path to your redis server in both
lib/tasks/resque.rake and the tweets_controller

You'll also need to run rake resque:scheduler and rake resque:work 
to get started.