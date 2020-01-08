FROM sentry:9

RUN apt-get update -y && apt-get install -y --no-install-recommends libsasl2-dev python-dev libldap2-dev libssl-dev && \
    pip install sentry-ldap-auth && \
    rm -rf /var/lib/apt/lists/*
ADD sentry.conf.py /etc/sentry/sentry.conf.py
