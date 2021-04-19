import socket
import requests

def get_hostname():
    return socket.gethostname()

def get_local_ip():
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    s.connect(("8.8.8.8", 80))
    ip = s.getsockname()[0]
    s.close()
    return ip

def register_self():
    url = 'http://smallwings.cc/api/node/?skt=7mA9gI9D3DO3Pdf1NhtcFOJg0P1OnD'
    # name=hk15&password=ikebo&ip=209.103.181.250&port=8588&is_abroad=0&bandwidth=1
    meta = {
        "name": get_hostname(),
        "password": "ikebo",
        "ip": get_local_ip(),
        "port": 8588,
        "is_abroad": 0,
        "bandwidth": 1
    }
    res = requests.post(url, data=meta)
    print(res.json())

if __name__ == '__main__':
    register_self()

