# TODO: check ndk.dir or NDK_ROOT if ndk-build not in PATH

all:
	@${ANDROID_NDK_ROOT}/ndk-build

clean:
	@${ANDROID_NDK_ROOT}/ndk-build clean
	rm -f -r setenv-*sh libs obj
