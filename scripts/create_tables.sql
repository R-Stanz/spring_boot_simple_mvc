\c postgres
DROP DATABASE IF EXISTS simple_crud;
\c postgres
CREATE DATABASE simple_crud
	WITH
		ENCODING = 'UTF8'
		CONNECTION LIMIT = 20;

\c simple_crud
DROP TABLE IF EXISTS roles;
\c simple_crud
DROP TABLE IF EXISTS users;


SELECT 'simple_crud';
\c simple_crud
CREATE TABLE users (
        username varchar(25) NOT NULL,
        passphrase char(68) NOT NULL,
        enabled boolean NOT NULL,
        PRIMARY KEY (username)
);      

\c simple_crud
INSERT INTO users (username, passphrase, enabled)
	VALUES
		('joe', '{bcrypt}$2a$10$VbD2OgJB3bsJRP5cB2GQvuS5QxxSMIoqdi0w3z7ilo9Pz877.Dxzq', true),
		('donald', '{bcrypt}$2a$10$oKqOl/cR9CzKRrzR24qqnurnI8lc/A84hyIz9CnU1sedznn58ZKrW', true),
		('harris', '{bcrypt}$2a$10$bwanjrOsO9eiOI6B4oN3q.MhFTHhm9p57iCBSy.opPKDVk3ddOyYe', true),
		('pence', '{bcrypt}$2a$10$N.A43rJ.AbWGuQcn1MUTZuLNc3dFj5cKcNdZK9./cKKQPMaVo65aS', true);



\c simple_crud
CREATE TABLE roles (
        username varchar(25) NOT NULL,
        role varchar(20) NOT NULL,
        PRIMARY KEY (username, role),
	CONSTRAINT fk_roles
		FOREIGN KEY (username)
			REFERENCES users(username)
);

\c simple_crud
CREATE UNIQUE INDEX idx_username_role
	ON roles(username, role);

\c simple_crud
INSERT INTO roles (username, role)
	VALUES
		('joe', 'ROLE_PRESIDENT'),
		('joe', 'ROLE_WORKER'),
		('donald', 'ROLE_SHAREHOLDER'),
		('harris', 'ROLE_VICEPRESIDENT'),
		('harris', 'ROLE_WORKER'),
		('pence', 'ROLE_CLIENT');
