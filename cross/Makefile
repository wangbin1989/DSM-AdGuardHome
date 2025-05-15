PKG_NAME = AdGuardHome
PKG_VERS = 0.107.61
PKG_EXT = tar.gz
PKG_DIST_NAME = $(PKG_NAME)_linux_$(PKG_DIST_ARCH).$(PKG_EXT)
PKG_DIST_SITE = https://github.com/AdguardTeam/AdGuardHome/releases/download/v$(PKG_VERS)
PKG_DIR = AdGuardHome

DEPENDS =

HOMEPAGE = https://github.com/AdguardTeam/AdGuardHome
COMMENT  = AdGuard Home is a network-wide software for blocking ads & trackers.
LICENSE  = GPLv3

REQUIRED_MIN_DSM = 7.0

include ../../mk/spksrc.archs.mk

UNSUPPORTED_ARCHS = $(PPC_ARCHS) $(i686_ARCHS) $(ARMv5_ARCHS) $(ARMv7L_ARCHS)

# PKG_DIST_ARCH_LIST = 386 amd64 arm64 armv7 arm6 arm5
PKG_DIST_ARCH_LIST = amd64 arm64 armv7

ifeq ($(findstring $(ARCH),$(x64_ARCHS)),$(ARCH))
PKG_DIST_ARCH = amd64
else ifeq ($(findstring $(ARCH),$(ARMv8_ARCHS)),$(ARCH))
PKG_DIST_ARCH = arm64
else ifeq ($(findstring $(ARCH),$(ARMv7_ARCHS)),$(ARCH))
PKG_DIST_ARCH = armv7
endif

ifeq ($(PKG_DIST_ARCH),)
$(info PKG_DIST_ARCH is null. ARCH = [$(ARCH)])
ifneq ($(findstring $(ARCH),$(UNSUPPORTED_ARCHS)),$(ARCH))
$(error Unsupported ARCH $(ARCH))
endif
endif

INSTALL_TARGET = adguardhome_custom_install

include ../../mk/spksrc.install-resources.mk

.PHONY: adguardhome_custom_install
adguardhome_custom_install: 
	@mkdir -p $(STAGING_INSTALL_PREFIX)/usr/local/AdGuardHome
	@install -m 755 $(EXTRACT_PATH)/AdGuardHome/AdGuardHome $(STAGING_INSTALL_PREFIX)/usr/local/AdGuardHome
