include $(THEOS)/makefiles/common.mk

GO_EASY_ON_ME = 1

TWEAK_NAME = AppStoreNoMoreBtn
AppStoreNoMoreBtn_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 AppStore"
