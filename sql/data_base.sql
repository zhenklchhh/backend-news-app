-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-09-28 18:06:34.088

-- tables
-- Table: Admins
CREATE TABLE Admins (
    adminID int  NOT NULL,
    userID int  NOT NULL,
    CONSTRAINT Admins_pk PRIMARY KEY (adminID)
);

-- Table: Communities
CREATE TABLE Communities (
    communityID int  NOT NULL,
    communityName varchar(255)  NOT NULL,
    Users_userID int  NOT NULL,
    CONSTRAINT CommunityID PRIMARY KEY (communityID)
);

-- Table: CommunitiesAuthors
CREATE TABLE CommunitiesAuthors (
    communityAuthorID int  NOT NULL,
    communityID int  NOT NULL,
    userID int  NOT NULL,
    CONSTRAINT CommunitiesAuthors_pk PRIMARY KEY (communityAuthorID)
);

-- Table: CommunitiesModerators
CREATE TABLE CommunitiesModerators (
    communityModeratorID int  NOT NULL,
    communityID int  NOT NULL,
    userID int  NOT NULL,
    CONSTRAINT CommunitiesModerators_pk PRIMARY KEY (communityModeratorID)
);

-- Table: CommunitiesOwners
CREATE TABLE CommunitiesOwners (
    communityOwnerID int  NOT NULL,
    communityID int  NOT NULL,
    userID int  NOT NULL,
    CONSTRAINT CommunitiesOwners_pk PRIMARY KEY (communityOwnerID)
);

-- Table: News
CREATE TABLE News (
    newsID int  NOT NULL,
    communityID int  NOT NULL,
    newsTitle varchar(255)  NOT NULL,
    newsContent text  NOT NULL,
    newsPublicationDate date  NOT NULL,
    newsSource int  NOT NULL,
    CONSTRAINT newsID PRIMARY KEY (newsID)
);

-- Table: News_Tags
CREATE TABLE News_Tags (
    newsTagID int  NOT NULL,
    newsID int  NOT NULL,
    tagID int  NOT NULL,
    CONSTRAINT News_Tags_pk PRIMARY KEY (newsTagID)
);

-- Table: Tags
CREATE TABLE Tags (
    tagID int  NOT NULL,
    tagName int  NOT NULL,
    CONSTRAINT Tags_pk PRIMARY KEY (tagID)
);

-- Table: Users
CREATE TABLE Users (
    userID int  NOT NULL,
    userName varchar(255)  NOT NULL,
    userPassword varchar(255)  NOT NULL,
    CONSTRAINT Users_pk PRIMARY KEY (userID)
);

-- foreign keys
-- Reference: Admins_Users (table: Admins)
ALTER TABLE Admins ADD CONSTRAINT Admins_Users
    FOREIGN KEY (userID)
    REFERENCES Users (userID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: CommunitiesAuthors_Communities (table: CommunitiesAuthors)
ALTER TABLE CommunitiesAuthors ADD CONSTRAINT CommunitiesAuthors_Communities
    FOREIGN KEY (communityID)
    REFERENCES Communities (communityID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: CommunitiesAuthors_Users (table: CommunitiesAuthors)
ALTER TABLE CommunitiesAuthors ADD CONSTRAINT CommunitiesAuthors_Users
    FOREIGN KEY (userID)
    REFERENCES Users (userID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: CommunitiesModerators_Communities (table: CommunitiesModerators)
ALTER TABLE CommunitiesModerators ADD CONSTRAINT CommunitiesModerators_Communities
    FOREIGN KEY (communityID)
    REFERENCES Communities (communityID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: CommunitiesModerators_Users (table: CommunitiesModerators)
ALTER TABLE CommunitiesModerators ADD CONSTRAINT CommunitiesModerators_Users
    FOREIGN KEY (userID)
    REFERENCES Users (userID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: CommunitiesOwners_Communities (table: CommunitiesOwners)
ALTER TABLE CommunitiesOwners ADD CONSTRAINT CommunitiesOwners_Communities
    FOREIGN KEY (communityID)
    REFERENCES Communities (communityID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: CommunitiesOwners_Users (table: CommunitiesOwners)
ALTER TABLE CommunitiesOwners ADD CONSTRAINT CommunitiesOwners_Users
    FOREIGN KEY (userID)
    REFERENCES Users (userID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Communities_Users (table: Communities)
ALTER TABLE Communities ADD CONSTRAINT Communities_Users
    FOREIGN KEY (Users_userID)
    REFERENCES Users (userID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: News_Communities (table: News)
ALTER TABLE News ADD CONSTRAINT News_Communities
    FOREIGN KEY (communityID)
    REFERENCES Communities (communityID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: News_Tags_News (table: News_Tags)
ALTER TABLE News_Tags ADD CONSTRAINT News_Tags_News
    FOREIGN KEY (newsID)
    REFERENCES News (newsID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: News_Tags_Tags (table: News_Tags)
ALTER TABLE News_Tags ADD CONSTRAINT News_Tags_Tags
    FOREIGN KEY (tagID)
    REFERENCES Tags (tagID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

