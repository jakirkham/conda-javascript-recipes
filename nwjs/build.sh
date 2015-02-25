#!/bin/sh

BIN=$PREFIX/bin
EXEC=$BIN/nwjs

mkdir -p $BIN
mkdir -p $PREFIX/nwjs

if [[ (`uname` == Darwin) ]]; then
	mv $SRC_DIR/nwjs.app/* $PREFIX/nwjs
	rm $PREFIX/nwjs/Contents/Info.plist

	chmod +x $PREFIX/nwjs/Contents/MacOS/nwjs
	cat <<EOF >$EXEC
#!/bin/sh

$PREFIX/nwjs/Contents/MacOS/nwjs "\$@"
EOF

fi

if [[ (`uname` == Linux) ]]; then
	mv $SRC_DIR/* $PREFIX/nwjs
	chmod +x $PREFIX/nwjs/nw

	cat <<EOF >$EXEC
#!/bin/sh

$PREFIX/nwjs/nw "\$@"

EOF
fi

chmod +x $EXEC
