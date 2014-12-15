/*
SQLite Data Transfer
Date: 2014-11-28 10:52:00
*/

PRAGMA foreign_keys = OFF;

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS "main"."comments";
CREATE TABLE comments (
	id INTEGER NOT NULL, 
	body TEXT, 
	body_html TEXT, 
	timestamp DATETIME, 
	author_id INTEGER, 
	author_name VARCHAR(64), 
	author_email VARCHAR(64), 
	notify BOOLEAN, 
	approved BOOLEAN, 
	talk_id INTEGER, 
	PRIMARY KEY (id), 
	FOREIGN KEY(author_id) REFERENCES users (id), 
	CHECK (notify IN (0, 1)), 
	CHECK (approved IN (0, 1)), 
	FOREIGN KEY(talk_id) REFERENCES talks (id)
);

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO "main"."comments" VALUES (1, 'Check out guys!!!', '<p>Check out guys!!!</p>', '2014-11-28 12:47:58.659748', 1, null, null, 0, 1, 1);

-- ----------------------------
-- Table structure for pending_emails
-- ----------------------------
DROP TABLE IF EXISTS "main"."pending_emails";
CREATE TABLE pending_emails (
	id INTEGER NOT NULL, 
	name VARCHAR(64), 
	email VARCHAR(64), 
	subject VARCHAR(128), 
	body_text TEXT, 
	body_html TEXT, 
	talk_id INTEGER, 
	timestamp DATETIME, 
	PRIMARY KEY (id), 
	FOREIGN KEY(talk_id) REFERENCES talks (id)
);

-- ----------------------------
-- Records of pending_emails
-- ----------------------------

-- ----------------------------
-- Table structure for talks
-- ----------------------------
DROP TABLE IF EXISTS "main"."talks";
CREATE TABLE talks (
	id INTEGER NOT NULL, 
	title VARCHAR(128) NOT NULL, 
	description TEXT, 
	slides TEXT, 
	video TEXT, 
	user_id INTEGER, 
	venue VARCHAR(128), 
	venue_url VARCHAR(128), 
	date DATETIME, 
	PRIMARY KEY (id), 
	FOREIGN KEY(user_id) REFERENCES users (id)
);

-- ----------------------------
-- Records of talks
-- ----------------------------
INSERT INTO "main"."talks" VALUES (1, 'Talk at PyCon 2014', 'Gustavo will be presenting the Flask Framework', '', '<iframe width="450" height="315" src="//www.youtube.com/embed/Hzg16-4k-Kk" frameborder="0" allowfullscreen></iframe>', 1, 'CarnegieHall', 'http://www.carnegiehall.org/', null);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS "main"."users";
CREATE TABLE users (
	id INTEGER NOT NULL, 
	email VARCHAR(64) NOT NULL, 
	username VARCHAR(64) NOT NULL, 
	is_admin BOOLEAN, 
	password_hash VARCHAR(128), 
	name VARCHAR(64), 
	location VARCHAR(64), 
	bio TEXT, 
	member_since DATETIME, 
	avatar_hash VARCHAR(32), 
	PRIMARY KEY (id), 
	CHECK (is_admin IN (0, 1))
);

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO "main"."users" VALUES (1, 'gustavocp@gmail.com', 'Gustavo Pezzi', 0, 'pbkdf2:sha1:1000$LdrXEESh$fd6a1dc3c9ec653a59b9a198c42e6c44a769d078', null, null, null, '2014-11-28 12:27:28.211370', '3aeb7f6308e6ac8ab1761c6cc37eaf16');

-- ----------------------------
-- Indexes structure for table comments
-- ----------------------------
CREATE INDEX "main"."ix_comments_timestamp"
ON "comments" ("timestamp" ASC);

-- ----------------------------
-- Indexes structure for table pending_emails
-- ----------------------------
CREATE INDEX "main"."ix_pending_emails_email"
ON "pending_emails" ("email" ASC);
CREATE INDEX "main"."ix_pending_emails_timestamp"
ON "pending_emails" ("timestamp" ASC);

-- ----------------------------
-- Indexes structure for table users
-- ----------------------------
CREATE UNIQUE INDEX "main"."ix_users_email"
ON "users" ("email" ASC);
CREATE UNIQUE INDEX "main"."ix_users_username"
ON "users" ("username" ASC);
