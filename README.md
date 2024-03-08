# Simple RSS Reader

Simple RSS Reader following the Take-Home Coding Test requirements

## First time setup
1. Clone this repo: `git clone git@github.com:CJGlitter/simple_rss_reader.git`
1. Navigate to newly installed repo with `cd`
1. Install dependancies from Gemfile: `bundle install`
1. Set up database: `rails db:migrate`
1. Start the server: `rails s`
1. In a browser, navigate to `http://localhost:3000/`

## Using the app
From the homescreen you can click "Click here to go to the articles!" to open up the index of articles. Here you'll find a list of articles pulled from the RSS feed with a short preview of the article. To view them, click the title of the article. When you return to the article index, you'll notice the article you've read now has a grey background. All articles that are not unread will have a grey background.

If you'd like to mark them unread again, simply open that article, scroll to the bottom, and click "Return and mark unread." 

If you'd like to refresh the article database, click "Reset DB" on the top-bar. This will clear the database and start over. The RSS feed will be queried again when you return to the articles index.
