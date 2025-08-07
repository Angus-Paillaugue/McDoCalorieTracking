-- Migration created at 2025-08-07T12:00:12.935Z

ALTER TABLE product
ADD COLUMN available BOOLEAN NOT NULL DEFAULT true;

UPDATE product SET available = true WHERE available IS NULL;

UPDATE
  "public"."product"
SET
  "available" = false
WHERE
  "id" = '0e338e1b-2b52-4b95-b795-c39ce1948a95';

UPDATE
  "public"."product"
SET
  "available" = false
WHERE
  "id" = '1e49257a-e0be-489d-a2f4-c68dd9df6094';


ALTER TABLE users ADD COLUMN isAdmin BOOLEAN NOT NULL DEFAULT false;

UPDATE users SET isAdmin = false WHERE isAdmin IS NULL;
