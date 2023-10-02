from typing import Coroutine, Dict, List
import asyncio 
import httpx
import time
from pprint import pprint

async def get_data(i:int=0) -> Dict:
    async with httpx.AsyncClient() as client:
        response = await client.get("http://ipinfo.io")
        data = response.json()

    data['timestamp'] = time.time()
    data['id'] = i
    print("Finished getting data for id={}".format(i))

    return data

async def main_function():
    # schedule 10 async tasks
    tasks: List[Coroutine] = [get_data(i) for i in range(0, 10)]
    
    # run tasks
    my_data: List[Dict] = await asyncio.gather(*tasks)
    
    # print data
    pprint(my_data)

if __name__ == '__main__':
    asyncio.run(main_function())
