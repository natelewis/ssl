#!/bin/sh

if [ -z "$1" ]
  then
    echo "Create a self signed cert for testing"
    echo "Usage: makeCert.sh www.thedomain.com"
    exit;
fi

echo "Creating certificate authority key"
openssl genrsa -out private-root-ca.privkey.pem 2048

echo "Creating certificiate authority"
openssl req -x509 -new -nodes \
  -key private-root-ca.privkey.pem \
  -days 1024 \
  -out private-root-ca.cert.pem \
  -subj '/C=US/ST=Massachusetts/L=Bedford/O=Foo Bar Signing Authority Inc/CN=foobar.com'

echo "Creating key for $1"
openssl genrsa -out key.pem 2048

# Create a request from your Device, which your Root CA will sign
echo "Creating self signed certificate for $1"
openssl req -new \
  -key key.pem \
  -out csr.pem \
  -subj "/C=US/ST=Utah/L=Provo/O=Foo Bar Inc/CN=$1"

echo "Signing certificate for $1"
openssl x509 \
  -req -in csr.pem \
  -CA private-root-ca.cert.pem \
  -CAkey private-root-ca.privkey.pem \
  -CAcreateserial \
  -out cert.pem \
  -days 500
