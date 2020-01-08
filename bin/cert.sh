#!/bin/sh

/usr/bin/lego -a --dns ${DNS_PROVIDER:-cloudflare} --domains ${FULL_DOMAIN} --domains "*.${FULL_DOMAIN}" --email demo@1e20.com renew || /usr/bin/lego --dns  ${DNS_PROVIDER:-cloudflare} --domains ${FULL_DOMAIN} --domains "*.${FULL_DOMAIN}" --email demo@1e20.com -a run

