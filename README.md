# ga-events
Send events to Google Analytics

# installation
git clone git@github.com:evshvarov/ga-events.git

docker-compose build --no-cache

docker-compose up -d

# usage

docker-compose exec iris iris session iris

USER>zn "GA"
GA>w ##class(GA.Analytics).SendEvent("Your UA-something GA ID","Event Name","Event Category","Event label")

GA ID could be something like "UA-101413258-1"

# contribution
fork the repo
git clone and open then folder in VS-Code with InterSystems ObjectScript plugin installed
