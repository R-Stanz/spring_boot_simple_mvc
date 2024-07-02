# Spring Boot Simple MVC Project


## A project to try out building a simple SpringBoot MVC prototype using containers and database.

<br>

---

<br>

## Overview

### Used Technologies:

|Technology name|Version|
|---|---|
|Java JDK | 21 |
|Spring Boot | |
|Maven | |
|PostgreSQL | |
|Docker | |
|PgAdmin | 4 | 

<br>

### For containers it is used the following distribution:

* **Database (PostgreSQL)**
* **Database Manager (PgAdmin4)**
* **Spring Boot App**

#### The containers are going to have communication with the development environment via a folder sharing storage with them (path: ~/ ).

<br>

### The Database is going to have the following entities/tables:

* **Users**: 
	* *Username* (**PK**)
	* *Passphrase* (**char(68)**)

<br>

* **Roles:**
	* *Username* (**FK**)
	* *Role* (**varchar(20)**, **UK**)
	
<br>

### Used Maven Packages:

|Package name|Version|
|---|---|
| Spring Boot DevTools | |
| Spring Web | |
| Spring Data JPA | |
| Spring Data JPA PostgreSQL |
| Spring Security | |

<br>

### Check-List:
- [x] ReadMe
- [ ] Data Base Container
- [ ] Data Base Management Container
- [ ] Data Base User Population
- [ ] Spring Boot Basic Encrypted Authentication
- [ ] Spring Boot MVC Pages