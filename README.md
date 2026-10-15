# Habeshan Dating — V120

Global Mobile Platform Edition. This package is cumulative from V100 through V120 and includes the V101–V120 production, mobile, international, safety, community, enterprise, and reliability foundations.

# Habeshan Dating V9

**V9 is the launch candidate.** It includes the V8 deployment foundation plus a PostgreSQL migration baseline, account security endpoints, role-aware admin access, launch configuration, and a go-live checklist.

## Local
Node 20+, then:
1. `npm install`
2. copy `.env.example` to `.env`
3. set `JWT_SECRET`
4. `npm start`
5. open `http://localhost:3000`

SQLite remains the local fallback.

## Production
Use managed PostgreSQL and run `migrations/001_initial_postgres.sql`. The existing application code is still intentionally conservative: the PostgreSQL schema is supplied as the migration baseline, but a full repository switch must be completed and tested before running multiple app instances.

V9 has provider boundaries for email, storage and payments. A demo payment provider never charges money. Real payment credentials, webhooks and subscription state must be implemented and tested with the selected provider.

See `V9_GO_LIVE_CHECKLIST.md`.

## V22 growth
V22 adds referral/invite links, referral rewards, sharing helpers, SEO routes, and a growth-focused launch checklist. Set `BASE_URL` in production so generated invite links and sitemap entries use the public domain.

## V31
Real Production Infrastructure. See `V31_LAUNCH_NOTES.md` and `V31_PRODUCTION_CHECKLIST.md`.

## V32
Real-Time Dating Experience. See `V32_LAUNCH_NOTES.md` and `V32_PRODUCTION_CHECKLIST.md`.

## V33
Smart Compatibility 2.0. See `V33_LAUNCH_NOTES.md` and `V33_PRODUCTION_CHECKLIST.md`.

## V34
Safety & Trust. See `V34_LAUNCH_NOTES.md` and `V34_PRODUCTION_CHECKLIST.md`.

## V35
Premium 2.0. See `V35_LAUNCH_NOTES.md` and `V35_PRODUCTION_CHECKLIST.md`.

## V36
Events & Community. See `V36_LAUNCH_NOTES.md` and `V36_PRODUCTION_CHECKLIST.md`.

## V37
Ethiopian/Habesha Localization. See `V37_LAUNCH_NOTES.md` and `V37_PRODUCTION_CHECKLIST.md`.

## V38
Mobile App Foundation. See `V38_LAUNCH_NOTES.md` and `V38_PRODUCTION_CHECKLIST.md`.

## V39
Admin & Business Intelligence. See `V39_LAUNCH_NOTES.md` and `V39_PRODUCTION_CHECKLIST.md`.

## V40
Habeshan Dating 2.0. See `V40_LAUNCH_NOTES.md` and `V40_PRODUCTION_CHECKLIST.md`.

## V41
Real Cloud Deployment. See `V41_LAUNCH_NOTES.md` and `V41_PRODUCTION_CHECKLIST.md`.

## V42
Email & Verification. See `V42_LAUNCH_NOTES.md` and `V42_PRODUCTION_CHECKLIST.md`.

## V43
Push Notifications. See `V43_LAUNCH_NOTES.md` and `V43_PRODUCTION_CHECKLIST.md`.

## V44
Advanced Chat. See `V44_LAUNCH_NOTES.md` and `V44_PRODUCTION_CHECKLIST.md`.

## V45
Trust & Verification. See `V45_LAUNCH_NOTES.md` and `V45_PRODUCTION_CHECKLIST.md`.

## V46
Advanced Discovery. See `V46_LAUNCH_NOTES.md` and `V46_PRODUCTION_CHECKLIST.md`.

## V47
Dating Events 2.0. See `V47_LAUNCH_NOTES.md` and `V47_PRODUCTION_CHECKLIST.md`.

## V48
Monetization 3.0. See `V48_LAUNCH_NOTES.md` and `V48_PRODUCTION_CHECKLIST.md`.

## V49
Mobile App Release. See `V49_LAUNCH_NOTES.md` and `V49_PRODUCTION_CHECKLIST.md`.

## V50
Habeshan Dating 3.0. See `V50_LAUNCH_NOTES.md` and `V50_PRODUCTION_CHECKLIST.md`.

## V61
Production Deployment. See `V61_LAUNCH_NOTES.md` and `V61_PRODUCTION_CHECKLIST.md`.

## V62
Real Email System. See `V62_LAUNCH_NOTES.md` and `V62_PRODUCTION_CHECKLIST.md`.

## V63
Real Media Storage. See `V63_LAUNCH_NOTES.md` and `V63_PRODUCTION_CHECKLIST.md`.

## V64
Real Payments. See `V64_LAUNCH_NOTES.md` and `V64_PRODUCTION_CHECKLIST.md`.

## V65
Real Push Notifications. See `V65_LAUNCH_NOTES.md` and `V65_PRODUCTION_CHECKLIST.md`.

## V66
Security & Anti-Abuse. See `V66_LAUNCH_NOTES.md` and `V66_PRODUCTION_CHECKLIST.md`.

## V67
Ethiopian Launch & Localization. See `V67_LAUNCH_NOTES.md` and `V67_PRODUCTION_CHECKLIST.md`.

## V68
Mobile App Release. See `V68_LAUNCH_NOTES.md` and `V68_PRODUCTION_CHECKLIST.md`.

## V69
Growth Engine. See `V69_LAUNCH_NOTES.md` and `V69_PRODUCTION_CHECKLIST.md`.

## V70
Habeshan Dating Live. See `V70_LAUNCH_NOTES.md` and `V70_PRODUCTION_CHECKLIST.md`.

## V121–V130
The V130 release adds AI copilot/conversation/profile foundations, advanced safety signals, identity workflows, mobile device APIs, multi-currency payment intents, global communities, analytics, and scale operations. See `ROADMAP_V121_V130.md` and `V130_PRODUCTION_CHECKLIST.md`.
