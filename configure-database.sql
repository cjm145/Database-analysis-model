DROP DATABASE IF EXISTS prof_data;
CREATE DATABASE prof_data;

USE prof_data;

DROP USER IF EXISTS 'user' @'%';
CREATE USER 'user' @'%' IDENTIFIED WITH mysql_native_password BY 'profession';
GRANT ALL ON prof_data.* TO 'user' @'%';