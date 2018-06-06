# start from a vanilla ubuntu 16.04 image
FROM ubuntu:16.04

# install python, pip, and grequests
RUN apt-get update
RUN apt-get install --yes python python-pip
RUN pip install grequests

# let's do everything in /tmp/s3arbitrage
WORKDIR /tmp/3darbitrage

# add all the files that we need into the container
ADD keys/bitfinex.key_sample keys/bitfinex.key
ADD keys/bitstamp.key_sample keys/bitstamp.key
ADD keys/bittrex.key_sample  keys/bittrex.key
ADD keys/gatecoin.key_sample keys/gatecoin.key
ADD keys/kraken.key_sample   keys/bitfinex.key
ADD arbitrage_config.json    arbitrage_config.json
ADD main.py                  main.py
ADD engines                  engines

# set the entrypoint equivalant of 'python main.py'
ENTRYPOINT ["python", "main.py"]

# run the '-m triangular' option by default
CMD ["-m", "triangular"]
