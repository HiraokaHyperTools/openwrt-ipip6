local map, section, net = ...
local peeraddr, ip4ifaddr, ip6addr
local tunlink, encaplimit, defaultroute, metric, mtu

peeraddr = section:taboption("general", Value, "peeraddr", translate("Tunnel remote IPv6 address"))
peeraddr.datatype = "ip6addr"
peeraddr.rmempty  = false

ip4ifaddr = section:taboption("general", Value, "ip4ifaddr", translate("Your global IPv4 address"))
ip4ifaddr.datatype = "ip4addr"
ip4ifaddr.rmempty  = false

ip6addr = section:taboption("general", Value, "ip6addr", translate("Local IPv6 address"), translate("Leave empty to use the current WAN address"))
ip6addr.datatype = "ip6addr"
ip6addr.rmempty = true

tunlink = section:taboption("advanced", DynamicList, "tunlink", translate("Tunnel Link"))
tunlink.template = "cbi/network_netlist"
tunlink.nocreate = true

encaplimit = section:taboption("advanced", Value, "encaplimit", translate("Encapsulation limit"))
for i = 0, 255 do
    encaplimit:value(tostring(i))
end
encaplimit:value("ignore")
encaplimit.default = "ignore"
encaplimit.rmempty = false

defaultroute = section:taboption("advanced", Flag, "defaultroute", translate("Default gateway"), translate("If unchecked, no default route is configured"))
defaultroute.default = defaultroute.enabled

metric = section:taboption("advanced", Value, "metric", translate("Use gateway metric"))
metric.datatype = "uinteger"
metric:depends("defaultroute", defaultroute.enabled)
metric.placeholder = "0"

mtu = section:taboption("advanced", Value, "mtu", translate("Use MTU on tunnel interface"))
mtu.datatype = "max(9200)"
mtu.placeholder = "1280"
