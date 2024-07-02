# Spring Boot Simple MVC Project

---
## A project to try out building a simple SpringBoot MVC prototype using containers and database.


<br>

---

<br>

### Used Technologies:

* **Java JDK 21**
* **Spring Boot**
* **Maven**
* **PostgreSQL**
* **Docker**

<br>

---

<br>


### For containers it is used the following distribution:

* **Database (Postgresql)**
* **Spring Boot App**

#### Both containers are going to have communication with the development environment via a folder sharing storage with them (path: ~/ ).

<br>

---

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

---

<br>

### Used Maven Packages:

* **Spring Boot DevTools**
* **Spring Web**
* **Spring Data JPA**
* **Spring Data JPA PostgreSQL**
* **Spring Security**