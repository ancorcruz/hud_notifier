DROP TABLE IF EXISTS "deals";

CREATE TABLE "deals" (
  "id" SERIAL,
  "hud_id" INTEGER UNIQUE NOT NULL,
  "title" varchar,
  "url" text,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp NOT NULL
);
