#
# Copyright (C) 2013 OpenWrt.org
# Copyright (C) 2021 kenjiuno
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ipip6
PKG_VERSION:=0.1
PKG_RELEASE:=6
PKG_LICENSE:=GPL-2.0
PKG_MAINTAINER:=kenjiuno

include $(INCLUDE_DIR)/package.mk

define Package/ipip6
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=@IPV6 +kmod-ip6-tunnel +resolveip
  TITLE:=ipip6 configuration support
  MAINTAINER:=kenjiuno <ku@digitaldolphins.jp>
  PKGARCH:=all
endef

define Package/ipip6/description
Provides support for ipip6 (RFC2473) in /etc/config/network.
endef

define Build/Compile
endef

define Build/Configure
endef

define Package/ipip6/install
	$(INSTALL_DIR) $(1)/lib/netifd/proto
	$(INSTALL_BIN) ./files/ipip6.sh $(1)/lib/netifd/proto/ipip6.sh
	$(INSTALL_DIR) $(1)/www/luci-static/resources/protocol/
	$(INSTALL_BIN) ./files/ipip6.js $(1)/www/luci-static/resources/protocol/ipip6.js
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/network
	$(INSTALL_BIN) ./files/ipip6_reg.lua $(1)/usr/lib/lua/luci/model/network/proto_ipip6.lua
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi/admin_network
	$(INSTALL_BIN) ./files/ipip6.lua $(1)/usr/lib/lua/luci/model/cbi/admin_network/proto_ipip6.lua

endef

$(eval $(call BuildPackage,ipip6))
