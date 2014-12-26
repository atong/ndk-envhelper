
NDK EnvHelper
=============

About
-----

This mini-project aims to assist porting projects to Android using
the Android NDK's toolchains, but without having to convert a project's
build system to Android.mk.  It works by discovering and then exporting
relevant environment variables by running a test JNI build.

This mechanism is useful due to the myriad of toolchains, targets,
and build configurations that the NDK potentially supports, and the
build related changes that updated NDK versions may bring.


Using
-----

Run `ndk-build` to generate the output files: `setenv-<target>.sh`.
These can then be sourced as part of your build process per target,
and to generate additional build configurables.

If `$ANDROID_NDK_ROOT` is set, then you can simply run make.

Optional: customize project/ndk settings first, for example setting
`APP_OPTIM` via `jni/Application.mk`.


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

# source toolchain specific variables (for arm v7)
% . ../ndk-envhelper/setenv-armeabi-v7a.sh

# source included helper script for autoconf
% . ../ndk-envhelper/setenv_helper_autoconf.sh	

% ./configure --host=arm-linux-android
% make
# TADA!
```


Sample Output
-------------

```
% cat ndk-envhelper/setenv-armeabi-v7a.sh
# NDK toolchain env vars for armeabi-v7a using /Users/atong/Development/android-ndk-r9c
export ANDROID_NDK_ROOT=/Users/atong/Development/android-ndk-r9c
export ARCH=arm
export TOOLCHAIN_PREFIX=/Users/atong/Development/android-ndk-r9c/toolchains/arm-linux-androideabi-4.6/prebuilt/darwin-x86_64/bin/arm-linux-androideabi-
export SYSROOT=/Users/atong/Development/android-ndk-r9c/platforms/android-3/arch-arm
export CFLAGS="-fpic -ffunction-sections -funwind-tables -fstack-protector -no-canonical-prefixes -march=armv7-a -mfloat-abi=softfp -mfpu=vfpv3-d16 --sysroot=/Users/atong/Development/android-ndk-r9c/platforms/android-3/arch-arm"
export CXXFLAGS="-fpic -ffunction-sections -funwind-tables -fstack-protector -no-canonical-prefixes -march=armv7-a -mfloat-abi=softfp -mfpu=vfpv3-d16 -fno-exceptions -fno-rtti --sysroot=/Users/atong/Development/android-ndk-r9c/platforms/android-3/arch-arm"
export LDFLAGS="-no-canonical-prefixes -march=armv7-a -Wl,--fix-cortex-a8 --sysroot=/Users/atong/Development/android-ndk-r9c/platforms/android-3/arch-arm"
export ARFLAGS="crsD"
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

