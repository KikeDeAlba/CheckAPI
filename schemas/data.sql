DROP DATABASE IF EXISTS checador_db;

CREATE DATABASE checador_db DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE checador_db;

CREATE TABLE permissions (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY name (name)
);

INSERT INTO permissions (name) VALUES
    ('Admin'),
    ('Trabajador');

CREATE TABLE users (
    id INT NOT NULL AUTO_INCREMENT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    name VARCHAR(255) NOT NULL,
    domicilio VARCHAR(255) NOT NULL,
    telefono VARCHAR(255) NOT NULL,
    empresa VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255),
    fingerprint TEXT,
    PRIMARY KEY (id),
    UNIQUE KEY email (email),
    UNIQUE KEY name (name)
);

CREATE TABLE user_perms (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    perm_id INT NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY user_perm (user_id, perm_id),
    CONSTRAINT fk_user_perm_user FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
    CONSTRAINT fk_user_perm_perm FOREIGN KEY (perm_id) REFERENCES permissions (id) ON DELETE CASCADE
);
