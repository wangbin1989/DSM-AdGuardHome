SPK_NAME = AdGuardHome
SPK_VERS = 0.107.61
SPK_REV = 1
SPK_ICON = src/AdGuardHome.png

DEPENDS = cross/AdGuardHome

MAINTAINER = wangbin1989
MAINTAINER_URL = https://github.com/wangbin1989

DESCRIPTION = AdGuard Home is a network-wide software for blocking ads & trackers.
DISPLAY_NAME = AdGuardHome
CHANGELOG = Initial package release.
STARTABLE = yes

LICENSE  = GPLv3

REQUIRED_MIN_DSM = 7.2

SPK_DEPENDS = WebStation

include ../../mk/spksrc.archs.mk

UNSUPPORTED_ARCHS = $(PPC_ARCHS) $(i686_ARCHS) $(ARMv5_ARCHS) $(ARMv7L_ARCHS)

CONF_DIR = src/conf/
DSM_UI_DIR = app
DSM_UI_CONFIG = src/app/config

SERVICE_USER = auto
SERVICE_SETUP = src/service-setup.sh
SERVICE_PORT = 53
SERVICE_PORT_TITLE = AdGuardHome manage port

INSTUNINST_RESTART_SERVICES = nginx.service

POST_SERVICE_TARGET = adguardhome_custom_service_target

include ../../mk/spksrc.spk.mk

.PHONY: adguardhome_custom_service_target
adguardhome_custom_service_target:
	@mkdir -p $(STAGING_DIR)/synology
	cat src/synology/alias-aghome > $(STAGING_DIR)/synology/alias-aghome
	@mkdir -p $(STAGING_DIR)/usr/local/AdGuardHome
	cat src/AdGuardHome.yaml > $(STAGING_DIR)/usr/local/AdGuardHome/AdGuardHome.yaml
