import hashlib
import os
from urllib import urlretrieve

CHECKSUMS = {
    "x86": {
        "iojs.exe": "47d67f1b828010a3472c84ec39b9f526e784d7c6707aa85aff371a8cf21049f8",
        "iojs.lib": "7cbceda422a1df22760cef632d4db3b97ef9c4f508cccc494a7df8cf482ca9b3",
    },

    "x64": {
        "iojs.exe": "114b92aa8061dae6b8443694bbba2aabb100aff81ab6508064afddc5af237eb0",
        "iojs.lib": "95ff61556461cb8f864d9958889e9387cd58961e466c1f73b67203acefbf2c26",
    }

}

ARCH = {
    "32": "x86",
    "64": "x64",
}[os.environ["ARCH"]]

ROOT_URL = "https://iojs.org/dist/v1.0.3/win-{}/".format(ARCH)
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
