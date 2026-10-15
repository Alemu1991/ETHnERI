-- Habeshan Dating V9 PostgreSQL baseline.
-- Apply with your managed PostgreSQL migration system before production.
CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE IF NOT EXISTS users(
 id UUID PRIMARY KEY,email TEXT UNIQUE NOT NULL,password_hash TEXT NOT NULL,name TEXT NOT NULL,age INTEGER NOT NULL,
 city TEXT DEFAULT '',bio TEXT DEFAULT '',gender TEXT DEFAULT '',interested_in TEXT DEFAULT '',
 verified BOOLEAN DEFAULT FALSE,disabled BOOLEAN DEFAULT FALSE,role TEXT DEFAULT 'user',
 created_at TIMESTAMPTZ DEFAULT now(),updated_at TIMESTAMPTZ DEFAULT now()
);
CREATE TABLE IF NOT EXISTS likes(id BIGSERIAL PRIMARY KEY,from_id UUID REFERENCES users(id),to_id UUID REFERENCES users(id),created_at TIMESTAMPTZ DEFAULT now(),UNIQUE(from_id,to_id));
CREATE TABLE IF NOT EXISTS passes(id BIGSERIAL PRIMARY KEY,from_id UUID REFERENCES users(id),to_id UUID REFERENCES users(id),created_at TIMESTAMPTZ DEFAULT now(),UNIQUE(from_id,to_id));
CREATE TABLE IF NOT EXISTS blocks(id BIGSERIAL PRIMARY KEY,from_id UUID REFERENCES users(id),to_id UUID REFERENCES users(id),created_at TIMESTAMPTZ DEFAULT now(),UNIQUE(from_id,to_id));
CREATE TABLE IF NOT EXISTS messages(id BIGSERIAL PRIMARY KEY,from_id UUID REFERENCES users(id),to_id UUID REFERENCES users(id),body TEXT NOT NULL,read_at TIMESTAMPTZ,created_at TIMESTAMPTZ DEFAULT now());
CREATE TABLE IF NOT EXISTS reports(id BIGSERIAL PRIMARY KEY,reporter_id UUID REFERENCES users(id),target_id UUID REFERENCES users(id),reason TEXT,status TEXT DEFAULT 'open',created_at TIMESTAMPTZ DEFAULT now());
CREATE TABLE IF NOT EXISTS notifications(id BIGSERIAL PRIMARY KEY,user_id UUID REFERENCES users(id),type TEXT,message TEXT,read_at TIMESTAMPTZ,created_at TIMESTAMPTZ DEFAULT now());
CREATE TABLE IF NOT EXISTS subscriptions(id BIGSERIAL PRIMARY KEY,user_id UUID REFERENCES users(id),plan TEXT,status TEXT,provider TEXT,provider_ref TEXT,created_at TIMESTAMPTZ DEFAULT now());
CREATE TABLE IF NOT EXISTS tokens(id BIGSERIAL PRIMARY KEY,user_id UUID REFERENCES users(id),type TEXT,token_hash TEXT UNIQUE,expires_at TIMESTAMPTZ,used_at TIMESTAMPTZ,created_at TIMESTAMPTZ DEFAULT now());
CREATE TABLE IF NOT EXISTS audit_logs(id BIGSERIAL PRIMARY KEY,actor_id UUID,target_id UUID,action TEXT,metadata JSONB,created_at TIMESTAMPTZ DEFAULT now());
CREATE TABLE IF NOT EXISTS sessions(id UUID PRIMARY KEY,user_id UUID REFERENCES users(id),user_agent TEXT,ip INET,created_at TIMESTAMPTZ DEFAULT now(),last_seen TIMESTAMPTZ DEFAULT now(),revoked_at TIMESTAMPTZ);
CREATE INDEX IF NOT EXISTS idx_messages_pair ON messages(from_id,to_id,created_at);
CREATE INDEX IF NOT EXISTS idx_notifications_user ON notifications(user_id,created_at);
CREATE INDEX IF NOT EXISTS idx_reports_status ON reports(status,created_at);
