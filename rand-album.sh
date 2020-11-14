# I searched for this capability and I found a bunch of versions that do it with really complex full scripts which don't really add any more capabilities to what I offer here with a simple oneliner
# The important part of the command is this line, the rest is for the way I personally use this

# mpc findadd album "$(mpc list album | shuf -n 1)"

# You can't change the number of selected albums by changing the number after 'shuf -n', so maybe that could be an actual improvement

mpc clear && mpc random off && mpc findadd album "$(mpc list album | shuf -n 1)" && mpc play
