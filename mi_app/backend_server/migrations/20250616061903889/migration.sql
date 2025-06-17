BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "usuario" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "usuario" (
    "id" bigserial PRIMARY KEY,
    "nombre" text NOT NULL,
    "correo" text NOT NULL,
    "fechaRegistro" timestamp without time zone NOT NULL,
    "claveHash" text NOT NULL
);


--
-- MIGRATION VERSION FOR backend
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('backend', '20250616061903889', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250616061903889', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
