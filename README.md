
NDK EnvHelper
=============

About
-----

This mini-project extracts environment variables that should useful
to porting projects to Android using the Android NDK's toolchains
where converting the build system to Android.mk is not practical.
It discovers the information by running a jni build via `ndk-build`.

This is useful due to the myriad of toolchains, targets, and build
configurations that the NDK supports (in addition to different NDK
versions).


Using
-----

Run `ndk-build` to generate the output files: `setenv-<target>.sh`.
These can then be sourced as part of your build process.

If `$ANDROID_NDK_ROOT` is set, then you can simply run make.

Optional: customize project/ndk settings first, for example via
jni/Application.mk.


Example
-------

```
# set ndk location
% export ANDROID_NDK_ROOT=~/Development/android-ndk

# generate environ vars
% cd ndk-envhelper
% make
make[1]: Entering directory `/Users/atong/work/ndk-envhelper'
Generating ./setenv-armeabi-v7a.sh
[armeabi-v7a] Install        : libndk-make-dummy.so => libs/armeabi-v7a/libndk-make-dummy.so
Generating ./setenv-armeabi.sh
[armeabi] Install        : libndk-make-dummy.so => libs/armeabi/libndk-make-dummy.so
Generating ./setenv-x86.sh
[x86] Install        : libndk-make-dummy.so => libs/x86/libndk-make-dummy.so
Generating ./setenv-mips.sh
[mips] Install        : libndk-make-dummy.so => libs/mips/libndk-make-dummy.so
make[1]: Leaving directory `/Users/atong/work/ndk-envhelper'
% cd ..
```

```
# build a autoconf library project
% cd libfoobar
% autoconf

# source toolchain specific variables
% . ../ndk-envhelper/setenv-armeabi-v7a.sh

# source helper script for autoconf
% . ../ndk-envhelper/setenv_helper_autoconf.sh	

% ./configure --host=arm-linux-android
% make
# TADA!
```


Alternatives
------------

See NDK's docs/STANDALONE-TOOLCHAIN.html, specifically the
`build/tools/make-standalone-toolchain.sh` script.

droid-gcc from https://github.com/tmurakam/droid-wrapper/


TODO
----

...


Author
------
http://github.com/atong

