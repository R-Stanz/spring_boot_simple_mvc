# Spring Boot Simple MVC Project


## A project to try out building a simple Spring Boot MVC prototype using containers and database.

---

## 1. Overview

* ### Used Technologies:

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

* ### For containers it is used the following distribution:

	* **Database (PostgreSQL)**
	* **Database Manager / Editor (PG Admin 4)**
	* **Spring Boot App**

	#### The containers are going to have communication with the development environment via a shared directory for storage (with the path of: ```docker/postgresql/scripts```).

<br>

* ### The Database is going to have the following entities/tables:

	* **Users**: 
		* *Username* (**PK**)
		* *Passphrase* (**char(68)**)

	* **Roles:**
		* *Username* (**FK**, **UK**)
		* *Role* (**varchar(20)**, **UK**)
	
<br>


* ### Used Maven Packages:

	| 		Package name			| Version |
	| :------------------------:	| :-----: |
	| Spring Boot DevTools		| |
	| Spring Web 				| |
	| Spring Data JPA 			| |
	| Spring Data JPA PostgreSQL	| |
	| Spring Security 			| |

<br>

* ### Check-List:
	- [x] Read Me
	- [x] Database Container
	- [ ] Populate Database
	- [ ] Database Management Container
	- [ ] Database User Population
	- [ ] Spring Boot Basic Encrypted Authentication
	- [ ] Spring Boot MVC Pages

---

## 2. Manual Setup

* ### 1. Setup Database Service:

	1. Before initializing the process it should be checked if docker-compose is installed, it can be verified by running the following command: <br>
	``$ docker-compose --version`` <br>
	In case it isn't installed the [original documentation of the docker compose might help you](https://docs.docker.com/compose/install/). <br>
		
	2. In order to initialize / manipulate the database try to be on the same directory as the database docker compose file. In order to go from the project directory to there you could use the command: <br>
	``$ cd docker/postgresql`` <br>
	
	3. Once at the ``docker/postgresql`` you can compose the docker of the database by running: <br>
	``$ sudo docker-compose -f docker-compose.yml up -d`` <br>
	Or (as root) <br>
	``# docker-compose -f docker-compose.yml up -d``
	
		* To undo the previous step you can use the following command to **stop and remove all the containers**: <br>
		``$ sudo docker-compose down`` <br>
		Or (as root) <br>
		``# docker-compose down``
	
	
	4. Having arriving at this step you should be able to check if the database service is running by accessing the database. You can do it in two ways:
		
		1. Open the <localhost:80>, you are even going to able to modify the database using the default user, password and database I left on the docker compose file of the postgreSQL - postgres, test123 and simple_crud (respectively).
		
		2. Open the postgreSQL terminal mode of the container by running: <br>
		``$ sudo docker exec -it postgresql_db_1 psql -U postgres`` <br>
			* To get out of the the container interactive mode, the one you should get after using the previous command, you can press the combination `ctrl + d` on an empty line.<br>
			* It can happen that your container might not have the same name as mine, in case you to check what containers your machine is running you can use the command: <br>
			``$ sudo docker ps`` <br>
			Or <br>
			``$ sudo docker-compose ps`` <br>
			The name of the containers can be found on the names and name columns, for the docker and docker-compose (respectively).
	
	
	### 2.