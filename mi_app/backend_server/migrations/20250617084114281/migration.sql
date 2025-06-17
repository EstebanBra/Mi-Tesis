BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "evento" (
    "id" bigserial PRIMARY KEY,
    "titulo" text NOT NULL,
    "descripcion" text NOT NULL,
    "fecha" timestamp without time zone NOT NULL,
    "usuarioId" bigint NOT NULL
);


--
-- MIGRATION VERSION FOR backend
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('backend', '20250617084114281', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250617084114281', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
