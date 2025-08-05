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


CREATE TYPE nutri_score_values AS ENUM('A', 'B', 'C', 'D', 'E');
-- Product table
CREATE TABLE product (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid (),
    name TEXT NOT NULL,
    image TEXT NOT NULL,
    calories NUMERIC NOT NULL,
    protein NUMERIC NOT NULL,
    salt NUMERIC NOT NULL,
    fibers NUMERIC NOT NULL,
    lipids NUMERIC NOT NULL,
    lipids_saturated NUMERIC NOT NULL,
    carbohydrates NUMERIC NOT NULL,
    carbohydrates_sugars NUMERIC NOT NULL,
    nutri_score nutri_score_values,
    item_label TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE category (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid (),
    label TEXT NOT NULL
);

CREATE TABLE belong_in_category (
    product_id UUID NOT NULL REFERENCES product (id) ON DELETE CASCADE,
    category_id UUID NOT NULL REFERENCES category (id) ON DELETE CASCADE,
    PRIMARY KEY (product_id, category_id)
);

CREATE TABLE product_group (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid (),
  label TEXT NOT NULL
);

CREATE TABLE belong_to_group (
    product_id UUID NOT NULL REFERENCES product (id) ON DELETE CASCADE,
    group_id UUID NOT NULL REFERENCES product_group (id) ON DELETE CASCADE,
    PRIMARY KEY (product_id, group_id)
);

CREATE TABLE migrations (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
