# Habeshan Dating V7 Production Checklist

## Infrastructure
- [ ] Managed PostgreSQL configured and migrations automated
- [ ] HTTPS/TLS enforced
- [ ] Reverse proxy/load balancer configured
- [ ] Secrets stored in a secret manager
- [ ] Database backups and restore test completed
- [ ] Monitoring, logs and alerts configured

## Accounts
- [ ] Real email verification provider configured
- [ ] Optional SMS/phone verification configured
- [ ] Password reset email tested
- [ ] Session/device revocation tested
- [ ] Account deletion and data-retention policy reviewed
- [ ] Export/data-access process implemented where required

## Safety
- [ ] Community guidelines published
- [ ] Report/block flows monitored
- [ ] Moderator roles and least-privilege access configured
- [ ] Admin MFA enabled
- [ ] Audit logs retained
- [ ] Image/content moderation configured
- [ ] Spam/scam/rate-abuse detection enabled
- [ ] Law-enforcement/emergency escalation process documented

## Payments
- [ ] Provider availability confirmed for the business jurisdiction
- [ ] Merchant/KYC requirements completed
- [ ] Signed webhooks verified
- [ ] Subscription state comes from server-side events
- [ ] Refund/cancellation/chargeback process tested
- [ ] Pricing, terms and taxes reviewed

## Legal/privacy
- [ ] Terms of service
- [ ] Privacy policy
- [ ] Cookie/technology notice where required
- [ ] Community/safety policy
- [ ] Refund/cancellation policy
- [ ] Age gate and under-18 prevention
- [ ] Data retention/deletion rules
- [ ] Ethiopian and target-country legal review

## Launch
- [ ] Domain + DNS configured
- [ ] Production email domain authenticated
- [ ] App store/social links and support contact ready
- [ ] Error pages and maintenance mode ready
- [ ] Load/security testing completed
