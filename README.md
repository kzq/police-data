# Neighbourhood Crime Monitor
------
Neighbourhood Crime Monitor uses https://data.police.uk/docs/ api to display crimes rates in the given area. Application uses Rails at back end and AngiularJS as front end.

**Installation** 
===

**Bower Setup**

First install Node.js if you don't have already.

**Install Bower**

```node
  npm install -g bower
```

**Rails Setup**

```rails
  bundle install
  
  bundle exec rake bower:install 
```

**Run Server**

```rails
  rails server -e development -p 3000  -P tmp/pids/3000.pid
```