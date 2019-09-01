#!/usr/bin/env bash

# add openmpi to PATH
echo PATH=/usr/local/openmpi/bin:$PATH >> /root/.profile
source /root/.profile

# set password
echo "root:test" | chpasswd root

# permit root login
sed -i "/^PermitRootLogin/s/prohibit-password/yes/" /etc/ssh/sshd_config
/etc/init.d/ssh start

sleep 10

# set up password-less ssh
IFS='-' read -ra array <<< "$HOSTNAME"
my_id="${array[1]}"
prefix="root@node-"
for i in $(seq 0 $1)
do
#    if [[ "$i" != "$my_id" ]]; then
    host="$prefix$i"
    ssh-keygen -t rsa -N "" -f "/root/.ssh/$my_id$i"
    sshpass -p "test" ssh-copy-id -i "/root/.ssh/$my_id$i" -o "StrictHostKeyChecking=no" "$host"
    echo -e "Host node-$i\n  User root\n  HostName node-$i\n  IdentityFile /root/.ssh/$my_id$i" >> /root/.ssh/config
#    fi
done

# save all host names of non-master nodes to file
if  [[ "$2" ]]; then
    for i in $(seq 0 $1)
    do
        echo -e "node-$i" >> /hostfile
    done
fi

 tail -f /dev/null
#mpirun --allow-run-as-root -n 20 --hostfile /hostfile python3.6 /mpi4py_demo/hello_world.py
