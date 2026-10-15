const fs=require('fs');
const required=['NODE_ENV','BASE_URL','JWT_SECRET','ADMIN_EMAIL'];
const prod=['DATABASE_URL','STORAGE_PROVIDER','EMAIL_PROVIDER'];
const env=process.env;
const checks=[];
for(const k of required) checks.push([k,!!env[k]]);
if(env.NODE_ENV==='production') for(const k of prod) checks.push([k,!!env[k] && env[k]!=='console' || (k==='STORAGE_PROVIDER'&&env[k]==='local')]);
checks.push(['BASE_URL_HTTPS',env.NODE_ENV!=='production'||/^https:\/\//i.test(env.BASE_URL||'')]);
checks.push(['JWT_SECRET_STRONG',env.NODE_ENV!=='production'||(env.JWT_SECRET||'').length>=48]);
const failed=checks.filter(x=>!x[1]);
console.log('\nHabeshan Dating V51 production preflight');
for(const [k,v] of checks) console.log(`${v?'✓':'✗'} ${k}`);
if(failed.length){console.error(`\n${failed.length} check(s) failed.`);process.exit(1)}
console.log('\nPreflight passed. External providers still require valid credentials and live testing.');
