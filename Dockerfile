FROM python:3.8-alpine

RUN apk update
RUN apk add build-base openldap-dev bzip2-dev openssl-dev

COPY requirements.txt .
RUN pip install -r requirements.txt
RUN wget https://raw.githubusercontent.com/amfl/mumble-scripts/b2d5353176e608b478a175056ec92e92cb43e857/Authenticators/LDAP/LDAPauth.py

VOLUME /config

CMD python LDAPauth.py --app --ini /config/LDAPauth.ini
