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
