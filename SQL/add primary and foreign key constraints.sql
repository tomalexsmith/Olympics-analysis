-- Set Primary Keys
ALTER TABLE athlete ADD PRIMARY KEY(athlete_id);
ALTER TABLE noc ADD PRIMARY KEY(noc_id);
ALTER TABLE games ADD PRIMARY KEY(games_id);
ALTER TABLE event ADD PRIMARY KEY(event_id);

-- Set Foreign Keys
ALTER TABLE results ADD FOREIGN KEY (athlete_id) REFERENCES athlete(athlete_id);
ALTER TABLE results ADD FOREIGN KEY (noc_id) REFERENCES noc(noc_id);
ALTER TABLE results ADD FOREIGN KEY (games_id) REFERENCES games(games_id);
ALTER TABLE results ADD FOREIGN KEY (event_id) REFERENCES event(event_id);