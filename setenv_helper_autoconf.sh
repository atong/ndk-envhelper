# helper: variables for autoconf
export AR=${TOOLCHAIN_PREFIX}ar
export AS=${TOOLCHAIN_PREFIX}as
export CC=${TOOLCHAIN_PREFIX}gcc
export CPP=${TOOLCHAIN_PREFIX}cpp
export CXX=${TOOLCHAIN_PREFIX}g++
export LD=${TOOLCHAIN_PREFIX}ld
export NM=${TOOLCHAIN_PREFIX}nm
export OBJCOPY=${TOOLCHAIN_PREFIX}objcopy
export OBJDUMP=${TOOLCHAIN_PREFIX}objdump
export RANLIB=${TOOLCHAIN_PREFIX}ranlib
export STRIP=${TOOLCHAIN_PREFIX}strip

export CPPFLAGS=${CFLAGS}
