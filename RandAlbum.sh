#!/bin/bash

## I searched for this capability and I found a bunch of versions that do it with really complex
## full scripts, which also don't really add any more capabilities to what I offer here with a simple oneliner

## I don't know if you could consider this a bug but if you have more than one album with the same
## name (weird case, I know, but it happened to me with BADBADNOTGOOD's III and The Lumineers' III)
## all of them will be added to the queue


## This works
# mpc findadd album "$(mpc list album | shuf -n 1)"

## Made this one because I didn't remember the name of the xargs command so I had to come up with
## a different way to accomplish this task. When I remembered the name xargs I rewrote it


## This also works plus it gets rid of double quotes, so you can use more easily inside other commands
## AND you can do more albums at the same time by changing the number after "shuf -n"
# mpc list album | shuf -n 1 | xargs -I % mpc findadd album %

## The rest of the comands are what I have for my specific use case, but the important part is whats above
mpc clear && mpc random off && mpc list album | shuf -n 1 | xargs -I % mpc findadd album % && mpc play
