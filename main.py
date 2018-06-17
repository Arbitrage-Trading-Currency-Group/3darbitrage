import argparse
import json

# specifies configuration file:
configFile = 'arbitrage_config.json'
f = open(configFile)
config = json.load(f)
f.close()

# Suggestions:
# f = open('arbitrage_config.json')
# config = json.load(f)
# f.close()  << Why used?

# Research argsparse package <store-true?>
# Adds flag options for running main.py
parser = argparse.ArgumentParser(description='Crypto Arbitrage')
parser.add_argument('-m', '--mode', help='Arbitrage mode: triangular or exchange', required=True)
parser.add_argument('-p', '--production', help='Production mode', action='store_true')
args = parser.parse_args()

# creates variable called engines
engine = None
# creates a boolean for mockmode
isMockMode = True if not args.production else False

# based on mode - import package from folder structure
# set engine to class of corresponding mode package
if args.mode == 'triangular':
    from engines.triangular_arbitrage import CryptoEngineTriArbitrage
    engine = CryptoEngineTriArbitrage(config['triangular'], isMockMode)
elif args.mode == 'exchange':
    from engines.exchange_arbitrage import CryptoEngineExArbitrage
    engine = CryptoEngineExArbitrage(config['exchange'], isMockMode)
else:
    print 'Mode {0} is not recognized'.format(args.mode)

# I don't know what this does.. executes itself if it has been changed?
if engine:
    engine.run()
