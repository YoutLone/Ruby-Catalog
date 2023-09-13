-- code below added by team member #1
CREATE TABLE books (
    id serial PRIMARY KEY,
    publisher VARCHAR(50) NOT NULL,
    cover_state VARCHAR(30)NOT NULL,
    published_date DATE,
);

CREATE TABLE labels (
    id serial PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    color VARCHAR(50) ,
)
-- code below added by team member #2
CREATE TABLE Genre (
  id SERIAL NOT NULL,
  name VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
  genre_id INT NULL
  FOREIGN KEY (genre_id) REFERENCES item(id)
);


CREATE TABLE MusicAlbum (
  id SERIAL NOT NULL,
  on_spotify BOOLEAN NOT NULL,
  genre_id INT NULL,
  FOREIGN KEY (genre_id) REFERENCES item(id),
  PRIMARY KEY (id)
);
-- code below added by team member #3
CREATE TABLE Author (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  item_id INTEGER,
  FOREIGN KEY(item_id) REFERENCES Item(id)
);

CREATE TABLE Game (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  item_id INTEGER,
  last_played_date DATE NOT NULL,
  multiplayer BOOLEAN NOT NULL,
  FOREIGN KEY(item_id) REFERENCES Item(id)
);

CREATE INDEX idx_genre_id_music_album ON MusicAlbum (genre_id);
CREATE INDEX idx_genre_id_genre ON Genre (genre_id);
CREATE INDEX idx_item_id_author ON Author(item_id);
CREATE INDEX idx_item_id_game ON GAME (item);