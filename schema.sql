CREATE TABLE books (
    id serial PRIMARY KEY,
    publisher VARCHAR(50) NOT NULL,
    cover_state VARCHAR(30)NOT NULL,
    publish_date DATE,
);

CREATE TABLE labels (
    id serial PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    color VARCHAR(50) ,
)