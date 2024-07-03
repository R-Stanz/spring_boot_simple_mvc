# Spring Boot Simple MVC Project


## A project to try out building a simple Spring Boot MVC prototype using containers and database.

---

## 1. Overview

* ### Used Technologies

	| 		Technology Name			|  Version  |
	| :----------------------------:	| :-------: |
	| Java JDK        				|     21    |
	| Spring Boot     				|           |
	| Maven           				|           |
	| PostgreSQL Docker-Compose Image	|    3.9    |
	| Docker          				|   27.0.3  |
	| Docker-Compose  				|   1.29.2  |
	| PG Admin        				|     4     |


<br>

* ### For containers it is used the following distribution

	* **Database (PostgreSQL)**
	* **Database Manager / Editor (PG Admin 4)**
	* **Spring Boot App**

	#### The containers are going to have communication with the development environment via a shared directory for storage (with the path of: ```docker/postgresql/scripts```).

<br>

* ### The Database is going to have the following entities/tables

	* **Users**: 
		* *Username* (**PK**)
		* *Passphrase* (**char(68)**)

	* **Roles:**
		* *Username* (**FK**, **UK**)
		* *Role* (**varchar(20)**, **UK**)
	
<br>


* ### Used Maven Packages

	| 		Package name			| Version |
	| :------------------------:	| :-----: |
	| Spring Boot DevTools		| |
	| Spring Web 				| |
	| Spring Data JPA 			| |
	| Spring Data JPA PostgreSQL	| |
	| Spring Security 			| |

<br>


* ### Authentication Infos
	
	* It's enough the username and password
	
	* The default authentications have their infos equal to the table below:

	|  Username	| Passphrase	| 		  Roles 			| Enabled |
	| :--------:	| :--------:	| :--------------------:	| :-----: |
	|    joe	   	|  crud123 	| president, worker 		|   true  |
	|   donald	|  crud123 	| shareholder			|   true  |
	|   harris	|  crud123 	| vice-president, worker	|   true  |
	|   pence	|  crud123 	| client					|   true  |
	
<br>


* ### Check-List
	- [x] Read Me
	- [x] Database Container
	- [x] Authentication Tables
	- [ ] App Function Tables
	- [ ] Database Management / Editor Container
	- [ ] Database User Population
	- [ ] Spring Boot Basic Encrypted Authentication
	- [ ] Spring Boot MVC Pages

---

## 2. Manual Setup

* ### 1. Setup Database Service

	1. Before initializing the process it should be checked if docker-compose is installed, it can be verified by running the following command: <br>
		```
		$ docker-compose --version
		```
	In case it isn't installed the [original documentation of the docker compose might help you](https://docs.docker.com/compose/install/). <br>
		
	2. In order to initialize / manipulate the database try to be on the same directory as the database docker compose file. In order to go from the project directory to there you could use the command: <br>
		```
		$ cd docker/postgresql
		```
	
	3. Once at the ``docker/postgresql`` you can compose the docker of the database by running: <br>
		```
		$ sudo docker-compose -f docker-compose.yml up -d
		```
		Or (as root)	
		```
		# docker-compose -f docker-compose.yml up -d
		```
	
		* To undo the previous step you can use the following command to **stop and remove all the containers**: <br>
			```
			$ sudo docker-compose down
			```
			Or (as root): <br>
			```
			# docker-compose down
			```
			
	4. Having arriving at this step you should be able to check if the database service is running by accessing the database. You can do it in two ways:
		
		1. Open the <localhost:80>, you are even going to able to modify the database using the default user, password and database I left on the docker compose file of the postgreSQL - postgres, test123 and simple_crud (respectively).
		
		2. Open the postgreSQL terminal mode of the container by running:
			```
			$ sudo docker exec -it postgresql_db_1 psql -U postgres
			```
		
			* To get out of the the container interactive mode (using the *psql*), the one you should get after using the previous command, you can press the combination `ctrl` + `d` on an empty line.<br>
			* It can happen that your container might not have the same name as mine, in case you to check what containers your machine is running you can use the command: <br>
			
				```
				$ sudo docker ps
				```
				Or 
				```
				$ sudo docker-compose ps
				```
				
				The name of the containers can be found on the names and name columns, for the docker and docker-compose (respectively).
	
	
* ### 2. Setup Authentication Tables

	* The container postgreSQL container must be already running to possible to follow the future steps.
	

	1. Use the SQL on the scripts directory to create and populate the postgreSQL database, with this command:

		```
		$ sudo docker exec postgresql_db_1 psql -U postgres -d simple_crud -f /var/scripts/create_tables.sql
		```
	
		It should have an output like:
		```
		psql:/var/scripts/create_tables.sql:1: NOTICE:  table "roles" does not exist, skipping
		DROP TABLE
		psql:/var/scripts/create_tables.sql:2: NOTICE:  table "users" does not exist, skipping
		DROP TABLE
		CREATE TABLE
		INSERT 0 4
		CREATE TABLE
		CREATE INDEX
		INSERT 0 6
		```
	
	2. Check if SQL script worked, by accessing and consulting the database:
	
		```
		$ sudo docker exec -it postgresql_db_1 psql -U postgres -d simple_crud
		
		simple_crud=# SELECT * FROM roles
		simple_crud-# UNION
		simple_crud-# SELECT username, passphrase FROM users
		simple_crud-# ORDER BY username;
		```
		
		The output should be something like this:
		
		```
		 username |                                 role                                 
		 ----------+----------------------------------------------------------------------
		 donald   | {bcrypt}$2a$10$oKqOl/cR9CzKRrzR24qqnurnI8lc/A84hyIz9CnU1sedznn58ZKrW
		 donald   | ROLE_SHAREHOLDER
		 harris   | {bcrypt}$2a$10$bwanjrOsO9eiOI6B4oN3q.MhFTHhm9p57iCBSy.opPKDVk3ddOyYe
		 harris   | ROLE_VICEPRESIDENT
		 harris   | ROLE_WORKER
		 joe      | ROLE_PRESIDENT
		 joe      | ROLE_WORKER
		 joe      | {bcrypt}$2a$10$VbD2OgJB3bsJRP5cB2GQvuS5QxxSMIoqdi0w3z7ilo9Pz877.Dxzq
		 pence    | {bcrypt}$2a$10$N.A43rJ.AbWGuQcn1MUTZuLNc3dFj5cKcNdZK9./cKKQPMaVo65aS
		 pence    | ROLE_CLIENT
		(10 rows)
		```
		
		* To get out of the interactive mode (the *psql*) you can once again use the combination of `ctrl` + `d`.

* ### 3.

---