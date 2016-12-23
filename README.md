## Quick self signed ssl creator
This repo is intended to be pulled into the root directory of a project and added to the .gitignore of the parent project.

```sh
git clone https://github.com/natelewis/ssl.git
cd ssl
makeCert.sh www.thethingimtesting.com
```

The end result is you will have a ssl directory in your project with a cert.pem and key.pem.  

```sh
ssl/cert.pem
ssl/key.pem
```

Also if you controlled the client and the server, you can use the root certificates also generated to create an warning free conversation.
