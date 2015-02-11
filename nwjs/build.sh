#!/bin/sh

BIN=$PREFIX/bin
EXEC=$BIN/node-webkit

mkdir -p $BIN
mkdir -p $PREFIX/node-webkit

if [[ (`uname` == Darwin) ]]; then
	mv $SRC_DIR/node-webkit.app/* $PREFIX/node-webkit
	rm $PREFIX/node-webkit/Contents/Info.plist

	chmod +x $PREFIX/node-webkit/Contents/MacOS/node-webkit
	cat <<EOF >$EXEC
#!/bin/sh

$PREFIX/node-webkit/Contents/MacOS/node-webkit "\$@"

EOF
fi

if [[ (`uname` == Linux) ]]; then
	mv $SRC_DIR/* $PREFIX/node-webkit
	chmod +x $PREFIX/node-webkit/nw

	cat <<EOF >$EXEC
#!/bin/sh

$PREFIX/node-webkit/nw "\$@"

EOF
fi

chmod +x $EXEC