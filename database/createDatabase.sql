DROP TABLE IF EXISTS stories;
DROP TABLE IF EXISTS words;
DROP TABLE IF EXISTS wordchild;
DROP TABLE IF EXISTS votes;

CREATE TABLE stories (
     storyID INTEGER PRIMARY KEY
    ,name    TEXT    NOT NULL
);

CREATE TABLE words (
    wordID  INTEGER PRIMARY KEY
    ,storyID    INTEGER NOT NULL
    ,word   TEXT    NOT NULL
    ,FOREIGN KEY(storyID) REFERENCES stories(storyID)
);

CREATE TABLE wordchild (
    parentID    INTEGER NULL
    ,childID    INTEGER NULL
    ,PRIMARY KEY(parentID, childID)
    ,FOREIGN KEY(parentID) REFERENCES words(wordID)
    ,FOREIGN KEY(childID) REFERENCES words(wordID)
);

CREATE TABLE votes (
    wordID  INTEGER NOT NULL
    ,FOREIGN KEY(wordID) REFERENCES words(wordID)
);


--test data
INSERT INTO stories VALUES (1, "test story");

INSERT INTO words VALUES (1, 1, "hello");
INSERT INTO words VALUES (2, 1, "world");

INSERT INTO wordchild VALUES (1, 2);