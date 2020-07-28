---
title: "Running Cassandra and PostgreSQL in Docker"
toc: true
toc_label: "Content"
tags:
  - Udacity Nanodegree 
  - Data Engineering
  - Docker
  - Cassandra
  - PostgreSQL

date: July 27, 2020
header:
  teaser: /assets/images/thumbnails/joel-filipe-thumb-400.jpg
excerpt: "How to set up the environment for Udacity Data Engineering Nanodegree on your local machine"
---

Today I started thee Udacity [Data Engineering Nanodegree](https://www.udacity.com/course/data-engineer-nanodegree--nd027) and wanted to follow along the demo projects in Lesson 1 on my local machine. (However, this is optional as Udacity provides the environment in their workspace). 

In this post I describe how to set up the environment using Docker containers for Cassandra and Postgres so that you don't have to install them locally, which is rather cumbersome, especially for Cassandra as you need to install Java first.

## 1. Creating Cassandra and Postgres Docker containers with docker-compose

Create `docker-compose.yml` (with exactly this name) with the following content: 

```docker
version: '2'

networks:
  app-tier:
    driver: bridge

services:
  cassandra:
    image: 'cassandra:latest'
    networks:
      - app-tier
    expose: 
      - '6000'
    ports:
      - '6000:9042'
  postgres:
    image: 'postgres:latest'
    restart: always
    environment:
      POSTGRES_PASSWORD: example
    expose:
      - '7000'
    ports:
      - '7000:5432'
```
Here I connect container ports 9042 (for Cassandra) and 5432 (for Postgres), which are default used by these services, with the host ports, here specified as 6000 and 7000.

Creating a yml-document ensures that you don't have to set up containers each time you want to use them.

To run Docker containers, you just need to type `docker-compose up` in your terminal. 

**Optional**: if you want to check whether Cassandra runs properly, you need first to attach shell to `cassandra:latest` container (I will not go into details here, I do it in Visual Studio Code where I have installed Docker extension - more on it [here](https://code.visualstudio.com/docs/containers/overview)) and type `cqlsh` to run a command line shell for interacting with Cassandra through CQL (the Cassandra Query Language). If no errors thrown, congratulations - you can now use Cassandra docker and run CQL queries. Type `exit` to exit the cqlsh terminal.

In a similar way, you can check whether PostgreSQL runs properly - attach shell to `postgres:latest` and type `psql --username=postgres` to log in as created by default postgres user. Now you can type `\l` to see the existing databases, one of which is `postgres` which we will be connecting to in Jupyter Notebooks. Type `exit` to exit the psql terminal. Type `exit` again if you want to exit container shell.

Finally, if you wish to stop the container, just press `Ctrl+C` in your terminal. Or check which docker containers are running with `docker ps` command in your terminal and then type `docker kill <container-ID as listed when running docker ps command>`, replacing the phrase in <> with corresponding ID.


## 2. Setting up environment for Data Engineering Nanodegree

In the rest of this post, I describe how to create a virtual environment for Data Engineering Nanodegree and run the jupyter notebooks provided in Lesson 1. 

## 2.1. Create new pyenv environment

In your terminal, go to a folder where you're going to save all data for Data Engineering Nanodegree and create a new virtual envirnment by running:

`pyenv virtualenv <python version> <name of virtual environment>`, replacing <> with your own values. 

For instance, I created a new virtual environment called "dataengineer" using my current Python version 3.8.2 like so:
`pyenv virtualenv 3.8.2 dataengineer`

To check which Python version is installed on your computer, try `pyenv version`.

Then we activate the new virtual environment with `pyenv activate dataengineer` and install the following packages:

```pip install jupyter notebook```

```pip install psycopg2-binary```

```pip install cassandra-driver```

Note that I installed the binary version of psycopg2, as I have an error thrown if I try installing psycopg2 as suggested by Udacity.

## 2.2. Connect to Cassandra and PostgreSQL database in Jupyter Notebook

After completing steps 1 and 2.1., you can now start using Cassandra within Jupyter Notebook "L1_Demo_2_Creating_a_Table_with_Apache_Cassandra" by specifying the host port from container as following:

```python
from cassandra.cluster import Cluster
try: 
    cluster = Cluster(['127.0.0.1'], port=6000) #If you have a locally installed Apache Cassandra instance
    session = cluster.connect()
except Exception as e:
    print(e)
```

In the same way, you can start PostgreSQL within Jupyter Notebook "L1_Demo_0_creating-a-table-with-postgres" by specifying the host port and password from container as following:

```python
conn = psycopg2.connect("host=127.0.0.1 port=7000 dbname=postgres user=postgres password=example")
```

Use this connection and cluster for all other jupyter notebooks in Lesson 1.




