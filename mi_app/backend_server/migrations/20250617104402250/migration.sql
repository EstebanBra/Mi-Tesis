BEGIN;


--
-- MIGRATION VERSION FOR backend
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('backend', '20250617104402250', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250617104402250', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
