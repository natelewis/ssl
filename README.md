## Quick self signed ssl creator
This repo is intended to pulled into a a project and allow you to quickly make self signed certs.

```sh
git clone git@github.com:natelewis/ssl.git
cd ssl
createCert.sh www.thethingimtesting.com
```

The end result is you will have a ssl directory in your project with a cert.pem and key.pem.
