CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid (),
    username TEXT NOT NULL,
    password_hash TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE meal (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid (),
    day TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_id UUID NOT NULL REFERENCES users (id) ON DELETE CASCADE
);

CREATE TABLE meal_item (
    product_id UUID NOT NULL REFERENCES product (id) ON DELETE CASCADE,
    meal_id UUID NOT NULL REFERENCES meal (id) ON DELETE CASCADE,
    quantity NUMERIC NOT NULL DEFAULT 1,
    PRIMARY KEY (product_id, meal_id)
);
