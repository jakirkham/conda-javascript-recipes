import hashlib
import os
from urllib import urlretrieve

CHECKSUMS = {
    "x86": {
        "iojs.exe": "f7fe7d4d716e4a8fda72b4c162e785a84e7650d27d49d02fff57164fe38404e1",
        "iojs.lib": "c50d5a3716f88d58f4604a39e1209bc321528237f3fed1a5bdb5acf535b23cb2",
    },

    "x64": {
        "iojs.exe": "08c40c11df9a4d8e096e929ad16855ba13669672e368d7de670331ea44cac2d1",
        "iojs.lib": "53cd9d149d6517383e2e4c003c08bfb0790f977ebf8f240f45b61247a40b9919",
    }

}

ARCH = {
    "32": "x86",
    "64": "x64",
}[os.environ["ARCH"]]

ROOT_URL = "https://iojs.org/dist/v1.2.0/win-{}/".format(ARCH)
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
