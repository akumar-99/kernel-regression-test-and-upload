#!/usr/bin/python
import sys 
from fedora.client import OpenIdBaseClient,AuthError
 
username=sys.argv[1]
password=sys.argv[2]
try:
    submitclient = OpenIdBaseClient(
        base_url='https://apps.fedoraproject.org/kerneltest/',
        login_url='https://apps.fedoraproject.org/kerneltest/login',
        username=username,
    )

    flag = submitclient.login(
        submitclient.username,
        password=password
    )
    print(flag.status_code)
except AuthError:
    print("0")
