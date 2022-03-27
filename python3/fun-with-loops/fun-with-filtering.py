
import json;
myJSON=None;
from pprint import pprint;

with open("./data.json",'r') as fh:
    myJSON=json.loads(fh.read())

# pprint(myJSON)

def shouldShowItem(item):
    return (not item['hidden']) and (not item['ignore'])

productsICareAbout = [x for x in filter(shouldShowItem, myJSON['products'])]

pprint(productsICareAbout)