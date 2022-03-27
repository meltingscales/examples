
import json;
from pprint import pprint;

def shouldShowItem(item):
    return (not item['hidden']) and (not item['ignore'])

if __name__ == "__main__":
    

    myJSON=None;
    with open("./data.json",'r') as fh:
        myJSON=json.loads(fh.read())

    # pprint(myJSON)


    productsICareAbout = [x for x in filter(shouldShowItem, myJSON['products'])]

    pprint(productsICareAbout)