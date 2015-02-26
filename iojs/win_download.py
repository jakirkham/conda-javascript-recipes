import hashlib
import os
from urllib import urlretrieve

CHECKSUMS = {
    "x86": {
        "iojs.exe": "944bfdea819c5c0d85a90963fa619e58f725a16e744abfb4a7efb7c7a3cb26a4",
        "iojs.lib": "fe247fc592bc8c08eae1a3d2a3cce3cec385451acd724a05313895bd15875838",
    },

    "x64": {
        "iojs.exe": "0a856b86a3fdc7eb0fd0649218c00acee88db6e7fbb49f7790b2ce2c8acfca5a",
        "iojs.lib": "ab42ae57eb63722811b6b47be673e6add23a1b0a7ab1de043f7a06bd61e4abde",
    }
}

ARCH = {
    "32": "x86",
    "64": "x64",
}[os.environ["ARCH"]]

ROOT_URL = "https://iojs.org/dist/v1.3.0/win-{}/".format(ARCH)
FILES = ["iojs.exe", "iojs.lib"]
TARGET_DIR = os.path.join(os.environ["PREFIX"], "Scripts")
if not os.path.exists(TARGET_DIR):
    os.makedirs(TARGET_DIR)

for filename in FILES:
    url = "{}{}".format(ROOT_URL, filename)
    full_filename = os.path.join(TARGET_DIR, filename)
    urlretrieve(url, full_filename)

    with open(full_filename, "rb") as f:
        contents = f.read()
    assert hashlib.sha256(contents).hexdigest() == CHECKSUMS[ARCH][filename]
