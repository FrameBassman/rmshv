DO
$do$
BEGIN
   IF NOT EXISTS (
      SELECT
      FROM   pg_catalog.pg_roles
      WHERE  rolname = 'romashov_user') THEN

      CREATE ROLE romashov_user LOGIN PASSWORD 'J2aKC2Tq3hdV3uEC';
      GRANT SELECT ON ALL TABLES IN SCHEMA public TO romashov_user;
   END IF;
END
$do$;
