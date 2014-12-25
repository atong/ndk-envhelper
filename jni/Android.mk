LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE	:= ndk-make-dummy

.PHONY := setenv-$(TARGET_ARCH_ABI).phony
$(TARGET_OUT): setenv-$(TARGET_ARCH_ABI).phony

define rule_tmpl
setenv-$(TARGET_ARCH_ABI).phony:
	$(eval OUT=$$(APP_PROJECT_PATH)/$$(@:%.phony=%).sh)
	@echo Generating $$(OUT)
	@echo \# NDK toolchain env vars for $(TARGET_ARCH_ABI) using $(NDK_ROOT) > $$(OUT)

	@echo export ANDROID_NDK_ROOT=$(NDK_ROOT) >> $$(OUT)
	@echo export ARCH=$(TARGET_ARCH) >> $$(OUT)

	@echo export TOOLCHAIN_PREFIX=$(TOOLCHAIN_PREFIX) >> $$(OUT)
	@echo export SYSROOT=$(SYSROOT_INC) >> $$(OUT)

	@echo export CFLAGS=\"$(TARGET_CFLAGS) --sysroot=$(SYSROOT_INC)\" >> $$(OUT)
	@echo export CXXFLAGS=\"$(TARGET_CXXFLAGS) --sysroot=$(SYSROOT_INC)\" >> $$(OUT)
	@echo export LDFLAGS=\"$(TARGET_LDFLAGS) --sysroot=$(SYSROOT_LINK)\" >> $$(OUT)
	@echo export ARFLAGS=\"$(TARGET_ARFLAGS)\" >> $$(OUT)
endef

$(eval $(call rule_tmpl, $(TARGET_ARCH_ABI)))

include $(BUILD_SHARED_LIBRARY)

