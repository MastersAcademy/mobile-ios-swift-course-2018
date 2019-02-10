# place4rest

SEARCH ON THE MAP OF CAMPGROUNDS AND PARKING LOTS IN UKRAINE AND IN EUROPE
https://github.com/imedelyan/place4rest
http://place4rest.com


## About
place4rest – is an iOS app for searhing and sharing camping places and rest areas like:
  - free or paid parking for campers
  - picnic areas
  - rest areas
  - camping
  - springs with clear water
  - old mansions
  etc.
place4rest is going to popularize "clean rest".


## Features
  - search on the map places using different filters by categories such as wild camping, springs, and castles etc
  - description, photos, rating and comments for places 
  - sharing/adding new places
  - off-line mode
  - socail sharing


## The Target Audience
place4rest is for all people which want to find or share places for rest. 
For all people which want to save nature and have a rest at the same time.


## Challange
App uses maps in offlline mode. So users are going to have a possibility: 
  - arrive at the place of the rest just using GPS 
  - add new place
  without Internet connection.


## Design Pattern
Project uses VIPER architecture pattern.


## Setup

### Bundler
To get going you need to install the tool, including using a more modern ruby:
```
brew install ruby
```
Then install bundler: 
```
gem install bundler
```

### Project setup
After updating `ruby` and installing `bundler`, you must install tools for project setup:
```
bundle install --path vendor/bundle 
```

### Cocoapods
After tools installation, should you install dependecies for project:
```
bundle exec pod install
```
Later should you need to update dependances:
```
bundle exec pod update
```
