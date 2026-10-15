const fs=require('fs');
const path=require('path');
const {Client}=require('pg');
const dir=path.join(process.cwd(),'migrations');
async function main(){
 if(!process.env.DATABASE_URL){console.error('DATABASE_URL is required for PostgreSQL migrations.');process.exit(1)}
 const files=fs.readdirSync(dir).filter(f=>/^\d+_.+\.sql$/.test(f)).sort();
 const client=new Client({connectionString:process.env.DATABASE_URL,ssl:process.env.DATABASE_SSL==='true'?{rejectUnauthorized:false}:undefined});
 await client.connect();
 await client.query('CREATE TABLE IF NOT EXISTS schema_migrations (version TEXT PRIMARY KEY, applied_at TIMESTAMPTZ NOT NULL DEFAULT now())');
 const applied=new Set((await client.query('SELECT version FROM schema_migrations')).rows.map(r=>r.version));
 if(process.argv[2]==='status'){
  for(const f of files) console.log(`${applied.has(f)?'applied':'pending'} ${f}`);
  await client.end(); return;
 }
 if(process.argv[2]!=='apply'){console.error('Usage: node scripts/migrate.js status|apply');process.exit(2)}
 for(const f of files){if(applied.has(f)) continue; const sql=fs.readFileSync(path.join(dir,f),'utf8'); await client.query('BEGIN'); try{await client.query(sql);await client.query('INSERT INTO schema_migrations(version) VALUES($1)',[f]);await client.query('COMMIT');console.log(`applied ${f}`)}catch(e){await client.query('ROLLBACK');throw e}}
 await client.end();
}
main().catch(e=>{console.error(e.message);process.exit(1)});
