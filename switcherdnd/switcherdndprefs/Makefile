ARCHS = armv7 arm64
include theos/makefiles/common.mk

BUNDLE_NAME = switcherdndprefs
switcherdndprefs_FILES = switcherdndprefs.mm
switcherdndprefs_INSTALL_PATH = /Library/PreferenceBundles
switcherdndprefs_FRAMEWORKS = UIKit
switcherdndprefs_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/switcherdndprefs.plist$(ECHO_END)
