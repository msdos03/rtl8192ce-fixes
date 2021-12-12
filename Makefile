ccflags-y += $(USER_EXTRA_CFLAGS)
ccflags-y += -O1
ccflags-y += -Wno-unused-variable
ccflags-y += -Wno-unused-value
ccflags-y += -Wno-unused-label
ccflags-y += -Wno-unused-parameter
ccflags-y += -Wno-unused-function
ccflags-y += -Wno-unused
ccflags-y += -Wno-uninitialized
ccflags-y += -I$(src)/include
ccflags-y += -DCONFIG_80211D
ccflags-y += -DCONFIG_LITTLE_ENDIAN


FW_FILES := hal/rtl8192c/pci/Hal8192CEHWImg.o

CHIP_FILES := hal/rtl8192c/rtl8192c_sreset.o
CHIP_FILES += $(FW_FILES)

_OS_INTFS_FILES :=	os_dep/osdep_service.o \
			os_dep/linux/os_intfs.o \
			os_dep/linux/pci_intf.o \
			os_dep/linux/pci_ops_linux.o \
			os_dep/linux/ioctl_linux.o \
			os_dep/linux/xmit_linux.o \
			os_dep/linux/mlme_linux.o \
			os_dep/linux/recv_linux.o \
			os_dep/linux/ioctl_cfg80211.o \
			os_dep/linux/rtw_android.o

_HAL_INTFS_FILES :=	hal/hal_init.o \
			hal/hal_com.o \
			hal/rtl8192c/rtl8192c_hal_init.o \
			hal/rtl8192c/rtl8192c_phycfg.o \
			hal/rtl8192c/rtl8192c_rf6052.o \
			hal/rtl8192c/rtl8192c_dm.o \
			hal/rtl8192c/rtl8192c_rxdesc.o \
			hal/rtl8192c/rtl8192c_cmd.o \
			hal/rtl8192c/pci/pci_halinit.o \
			hal/rtl8192c/pci/rtl8192ce_led.o \
			hal/rtl8192c/pci/rtl8192ce_xmit.o \
			hal/rtl8192c/pci/rtl8192ce_recv.o

_HAL_INTFS_FILES += hal/rtl8192c/pci/pci_ops_linux.o

_HAL_INTFS_FILES += $(CHIP_FILES)

rtk_core :=	core/rtw_cmd.o \
		core/rtw_security.o \
		core/rtw_debug.o \
		core/rtw_io.o \
		core/rtw_ioctl_query.o \
		core/rtw_ioctl_set.o \
		core/rtw_ieee80211.o \
		core/rtw_mlme.o \
		core/rtw_mlme_ext.o \
		core/rtw_wlan_util.o \
		core/rtw_pwrctrl.o \
		core/rtw_rf.o \
		core/rtw_recv.o \
		core/rtw_sta_mgt.o \
		core/rtw_xmit.o	\
		core/rtw_p2p.o \
		core/rtw_tdls.o \
		core/rtw_br_ext.o \
		core/rtw_iol.o \
		core/rtw_sreset.o

8192ce-y += $(rtk_core)

8192ce-y += core/efuse/rtw_efuse.o

8192ce-y += $(_HAL_INTFS_FILES)

8192ce-y += $(_OS_INTFS_FILES)

obj-$(CONFIG_8192CE) := 8192ce.o
