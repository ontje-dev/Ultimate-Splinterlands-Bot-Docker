# Ultimate-Splinterlands-Bot-Docker

This is a lightweight alpine docker image which runs the allmighty bot from https://github.com/PCJones/Ultimate-Splinterlands-Bot-V2

> --------------------------------------------
>
> NOTE THAT THIS IMAGE WILL **ONLY WORK WITH LIGHTNING MODE - BROWSER MODE IS NOT SUPPORTED**
>
> --------------------------------------------

# build the image
```
docker build -t splinterlands-bot --build-arg BOT_VERSION=2.7.3 . 
```

# run the container
The config files need to be mounted into the container.

Replace "/PATH_TO_BOT/config" with the absolute config file path on your harddisk
```
docker run -v /PATH_TO_BOT/config:/bot/config splinterlands-bot
```