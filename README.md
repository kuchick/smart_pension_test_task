# Environment
- ruby 3.0.2

# Installation and Usage
- `$ bundle install`
- `ruby ./parser.rb webserver.log`

# Script Results
```
MOST PAGE VIEWS:
/about/2: 90 visits
/contact: 89 visits
/index: 82 visits
/about: 81 visits
/help_page/1: 80 visits
/home: 78 visits

MOST UNIQUE PAGE VIEWS:
/help_page/1: 23 unique views
/contact: 23 unique views
/home: 23 unique views
/index: 23 unique views
/about/2: 22 unique views
/about: 21 unique views
```

# Implementation
Approach is to go line by line and fill array with ip visits for each path

What is done:
- Splitting logic to separate classes (S in SOLID).
- Validations (file permissions, existence, non-empty, path without ip in log line)
- rubocop: `no offenses detected`
- DI usage
- Error logging

What can be done:
- IP validation
- To reduce memory usage it can make sense to store not full ip visits list for each path, but count of visits for each ip like:
```{'/about' => { '111.222.333.444' => 1, '222.333.444.555' => 6 }}```.
But in real life data is stored in database, so my implementation is simple enough and can be not efficient for big log files
- Repo doesn't have tests because I've reached 2.5h time limit 😅