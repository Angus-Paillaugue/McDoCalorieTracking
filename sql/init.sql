-- Migration SQL Script at 2025-08-05T17:21:10.000Z

-- Create user
do
$$
begin
  if not exists (select * from pg_user where usename = 'mcdo_calorie_tracker_user') then
    CREATE USER mcdo_calorie_tracker_user WITH ENCRYPTED PASSWORD 'mcdo_calorie_tracker_password';
  end if;
end
$$
;

-- Create database
-- CREATE DATABASE mcdo_calorie_tracker;

\c mcdo_calorie_tracker;

GRANT ALL PRIVILEGES ON DATABASE mcdo_calorie_tracker TO mcdo_calorie_tracker_user;

ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT ALL ON TABLES TO mcdo_calorie_tracker_user;

CREATE TABLE migrations (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
