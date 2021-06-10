gluster peer probe 192.168.0.2
gluster peer probe 192.168.0.4
gluster peer probe 192.168.0.3

gluster volume create gv0 replica 2 arbiter 1 alma-kubemaster:/data/brick1/gv0 alma-kubeworker1:/data/brick1/gv0 alma-ansiblemaster:/data/brick1/gv0
gluster volume start gv0