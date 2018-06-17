import sys
import os
sys.path.append(os.path.dirname(__file__))

class EngineLoader(object):
    @staticmethod
    # What is happening here? _import_?:
    def getEngine(exchange, keyFile):
        mod = __import__(exchange)
        engine = mod.ExchangeEngine()
        engine.load_key(keyFile)
        return engine
