# start from a vanilla ubuntu 16.04 image
FROM ubuntu:16.04

# install python, pip, and grequests
RUN apt-get update
RUN apt-get install --yes python python-pip
RUN pip install grequests

# let's do everything in /tmp/s3arbitrage
WORKDIR /tmp/3darbitrage

# add all the files that we need into the container
# removed _sample from first part keys

ADD keys/bitfinex.key keys/bitfinex.key
ADD keys/bitstamp.key keys/bitstamp.key
ADD keys/bittrex.key  keys/bittrex.key
# ADD keys/gatecoin.key keys/gatecoin.key
ADD keys/kraken.key   keys/bitfinex.key
ADD arbitrage_config.json    arbitrage_config.json
ADD main.py                  main.py
ADD engines                  engines

# set the entrypoint equivalant of 'python main.py' (disabled)
#ENTRYPOINT ["python", "main.py"]

# run the '-m triangular' option by default (disabled)
# CMD ["-m", "triangular"]
