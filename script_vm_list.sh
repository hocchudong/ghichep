#!/bin/sh
# os-vm-state.sh, ABr, 20141029
# List of all VMs and their state

# get list of all vms
l_all_vms=$(nova list --all-tenants | tail -n +4 | head -n -1 | cut -d'|' -f 2 | sed -e 's# ##g')

l_tmp="/tmp/$(basename $0).$$"
echo "vm_id|vm_host|vm_tenant|vm_name|vm_state"
for vm in $l_all_vms; do
  # get info
  if nova show $vm 2>/dev/null > $l_tmp; then
    # must be on stan
    l_vm_host=$(grep -e "^| OS-EXT-SRV-ATTR:host" $l_tmp | cut -d'|' -f 3 | sed -e 's#^ \+##; s#[ \t]*$##')
    if echo "$l_vm_host" | grep --quiet -e "$1"; then
      # read the name and the tenant
      l_vm_name=$(grep -e "^| name" $l_tmp | cut -d'|' -f 3 | sed -e 's#^ \+##; s#[ \t]*$##')
      l_vm_tenant_id=$(grep -e "^| tenant_id" $l_tmp | cut -d'|' -f 3 | sed -e 's#^ \+##; s#[ \t]*$##')
      l_vm_state=$(grep -e "^| OS-EXT-STS:vm_state" $l_tmp | cut -d'|' -f 3 | sed -e 's#^ \+##; s#[ \t]*$##')
      l_vm_tenant=$(keystone tenant-get $l_vm_tenant_id | grep -e '  name  ' | cut -d'|' -f 3 | sed -e 's#^ \+##; s#[ \t]*$##')
      # print output
      echo "$vm|$l_vm_host|$l_vm_tenant|$l_vm_name|$l_vm_state"
    fi
  fi
done
rm -f $l_tmp
