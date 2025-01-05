import datetime
import json

class Test:
    pass


def func(a:str, b:int) -> str:
    """comment"""
    now = datetime.datetime.now()

    return a + str(b) + now.isoformat()

def test(a):
    return a

