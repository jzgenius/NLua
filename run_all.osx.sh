#!/bin/sh
cd Core/KeraLua
make -f Makefile.OSX
xbuild KeraLua.sln /p:Configuration=Release
cd ../../
cp Core/KeraLua/external/lua/osx/lib/liblua52.dylib tests/liblua52.dylib
xbuild NLua.sln /p:Configuration=Release
cd tests/
nunit-console NLuaTest.dll -xml=$1
