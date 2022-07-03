#!/bin/sh
echo "">/home/admin/App/OMS/properties/customer_overrides.properties
/home/admin/App/OMS/bin/buildear.sh -Dappserver=websphere -Dwarfiles=smcfs,sbc,sma,isccsdev,wscdev -Dearfile=smcfs.ear -Ddevmode=true -Dnowebservice=true -Dnodocear=true create-ear
mv /home/admin/App/OMS/external_deployments/smcfs.ear /home/admin/App/wlp/usr/servers/OMS/dropins/
