const Database=require('better-sqlite3');
const fs=require('fs');
const path=require('path');
const source=path.resolve(process.env.DB_FILE||'habeshan-v7.db');
if(!fs.existsSync(source)){console.error('Database file not found:',source);process.exit(1)}
const dir=path.resolve(process.env.BACKUP_DIR||'backups');fs.mkdirSync(dir,{recursive:true});
const stamp=new Date().toISOString().replace(/[:.]/g,'-');
const target=path.join(dir,`habeshan-${stamp}.db`);
const db=new Database(source,{readonly:true});
db.backup(target).then(()=>{db.close();console.log(`Backup created: ${target}`)}).catch(err=>{try{db.close()}catch{};console.error(err);process.exit(1)});
