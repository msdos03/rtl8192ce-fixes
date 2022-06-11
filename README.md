# rtl8192ce-fixes
<a href="https://996.icu"><img src="https://img.shields.io/badge/link-996.icu-red.svg" alt="996.icu" /></a>
DEPRECIATED
rtlwifi unstable problem have been solved. I am going to send it to linux kernel.

The mac80211 driver of rtl8192ce is very unstable, so this rtl871x driver is to solve this problem. Currently support the latest kernel(5.15). Only support WEXT interface now, planning to fix cfg80211 support later.

The current rtlwifi and rtl8192ce the old released driver by realtek are both mac80211 drivers, they seemed to be greatly reduced and without many functions. 

This driver is found in some custom 3.0 kernel repos, If anyone have a newer version of this driver, please make a pull request. 

Important: The default endian config is little endian, if you are going to build it on a big endian machine, replace "ccflags-y += -DCONFIG_LITTLE_ENDIAN" with "ccflags-y += -DCONFIG_BIG_ENDIAN" in Makefile.
