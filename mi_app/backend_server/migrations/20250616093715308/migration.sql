BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "usuario" ALTER COLUMN "correo" DROP NOT NULL;
ALTER TABLE "usuario" ALTER COLUMN "fechaRegistro" DROP NOT NULL;
ALTER TABLE "usuario" ALTER COLUMN "claveHash" DROP NOT NULL;

--
-- MIGRATION VERSION FOR backend
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('backend', '20250616093715308', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250616093715308', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
