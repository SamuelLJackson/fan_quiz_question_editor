# to run test server: 
elm reactor

# compile:
elm make path/to/file

# create customized js build to deploy to html:
elm make path/to/file --optimize --output=elm.js

# build docker image
docker build --tag {name_of_build}:{sem.ver} .

# run docker image
docker run --publish {port}:{port} --detach --name {abbreviation} {name_of_build}:{sem.ver}

# stop
docker rm -force {abbreviation}

