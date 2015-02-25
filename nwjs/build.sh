#!/bin/sh

BIN=$PREFIX/bin
EXEC=$BIN/nwjs

mkdir -p $BIN
mkdir -p $PREFIX/nwjs

if [[ (`uname` == Darwin) ]]; then
	# Ensure permissions are perserved
	cp -Rp $SRC_DIR/nwjs.app/* $PREFIX/nwjs
	rm $PREFIX/nwjs/Contents/Info.plist

	chmod +x $PREFIX/nwjs/Contents/MacOS/nwjs
	chmod +x "$PREFIX/nwjs/Contents/Frameworks/nwjs Helper EH.app/Contents/MacOS/nwjs Helper EH"
	chmod +x "$PREFIX/nwjs/Contents/Frameworks/nwjs Helper EH.app/Contents/MacOS/nwjs Helper EH"
	chmod +x "$PREFIX/nwjs/Contents/Frameworks/nwjs Helper.app/Contents/MacOS/nwjs Helper"
	cat <<EOF >$EXEC
#!/bin/sh

$PREFIX/nwjs/Contents/MacOS/nwjs "\$@"
EOF

fi

if [[ (`uname` == Linux) ]]; then
	cp -Rp $SRC_DIR/* $PREFIX/nwjs
	chmod +x $PREFIX/nwjs/nw

	cat <<EOF >$EXEC
#!/bin/sh

$PREFIX/nwjs/nw "\$@"

EOF
fi

chmod +x $EXEC
