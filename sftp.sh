sudo docker rm -f sftp-server

sudo docker run \
    --name sftp-server \
    -v /home/container-program-files/fileserver_share_files:/home/foo/upload \
    -p 8092:22 -d atmoz/sftp \
    foo:pass:2002