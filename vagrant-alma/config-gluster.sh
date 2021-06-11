gluster peer probe alma-ansiblemaster
gluster peer probe alma-kubemaster
gluster peer probe alma-kubeworker1

sleep 30s

gluster volume create gv0 replica 2 arbiter 1 alma-kubemaster:/data/brick1/gv0 alma-kubeworker1:/data/brick1/gv0 alma-ansiblemaster:/data/brick1/gv0
gluster volume start gv0