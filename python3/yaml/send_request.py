import yaml
from typing import Dict
import requests

def get_config() -> Dict:
  content = None
  with open("./config.yml", 'r') as fh:
    content = yaml.load(fh)
  return content

config = get_config()

requests.get(config['url'])




