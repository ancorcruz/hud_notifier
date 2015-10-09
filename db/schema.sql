DROP TABLE IF EXISTS "deals";

CREATE TABLE "deals" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  "hud_id" INTEGER UNIQUE NOT NULL,
  "title" varchar,
  "url" text,
  "created_at" datetime NOT NULL,
  "updated_at" datetime NOT NULL
);
