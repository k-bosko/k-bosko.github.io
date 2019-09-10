#STEP 1 - generating container with ruby environment

# FROM ruby:2.5

# WORKDIR /usr/src/app

# # we put README.md as placeholder, because Docker cannot create empty container
# COPY README.md ./

# #create volume for later mounting of your local directory
# VOLUME /usr/src/app

#docker build -t ruby-environment .

#-------------------------------------------------------
#STEP 2 - install gems from your workdir -> generate Gemfile.lock

#docker run --volume="$PWD:/usr/src/app" -it ruby-environment bundle install


#-------------------------------------------------------
#STEP 3

# get base container (in our case it is ruby with version 2.5)
FROM ruby:2.5

# optional - update initial container
#RUN gem update --system 

# configure bundle for ruby in this case frozen=1
RUN bundle config --global frozen 1

# setup working directory inside container
WORKDIR /usr/src/app

# copy gemfiles to the working directory
COPY Gemfile Gemfile.lock minimal-mistakes-jekyll.gemspec ./
 
# optional (if no VOLUME) - copy everything from your local directory into docker WORKDIR 
# COPY . .

# run ruby bundle setup
RUN bundle install

# optional (if no COPY) - create volume for later mounting of your local directory (only for development stage, later switch to COPY when deploying)
VOLUME /usr/src/app

# expose port 4000 in order to get access to docker from local web browser
EXPOSE 4000

# run command on docker... in our case - start jekyll server
CMD ["jekyll", "serve"]

# next steps ... 
# 1. build container  -  docker build -t <name of your conatiner> .
# 2. run container    -  docker run --volume="$PWD:/usr/src/app" -p 4000:4000 -it <name of your conatiner>
# optional 3. run shell on container - docker exec -it <id of your running container> /bin/bash
# run exit or hit ctrl-D to exit out of the docker container bash shell 


# to regenerate Gemfile.lock
# step 1. delete frozen to re-generate Gemfile.lock
#RUN bundle config --delete frozen
# step 2. run
# docker run --volume="$PWD:/usr/src/app" -it minimal-mistakes bundle install
