-- V51 deployment metadata. Safe to run repeatedly.
CREATE TABLE IF NOT EXISTS deployment_releases (
  version TEXT PRIMARY KEY,
  deployed_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  notes TEXT DEFAULT ''
);
INSERT INTO deployment_releases(version, notes) VALUES ('51.0.0','Real production deployment foundation') ON CONFLICT (version) DO NOTHING;
