local netmod = luci.model.network
local interface = luci.model.network.interface
local proto = netmod:register_protocol("ipip6")

function proto.get_i18n(self)
	return luci.i18n.translate("IPv4 over IPv6 (ipip6)")
end

function proto.ifname(self)
	return "ipip6-" .. self.sid
end

function proto.get_interface(self)
	return interface(self:ifname(), self)
end

function proto.is_installed(self)
	return nixio.fs.access("/lib/netifd/proto/ipip6.sh")
end

function proto.opkg_package(self)
	return "ipip6"
end

function proto.is_floating(self)
	return true
end

function proto.is_virtual(self)
	return true
end

function proto.contains_interface(self, ifname)
	if self:is_floating() then
		return (netmod:ifnameof(ifc) == self:ifname())
	else
		return netmod.protocol.contains_interface(self, ifc)
	end
end

netmod:register_pattern_virtual("^ipip6%-%w")