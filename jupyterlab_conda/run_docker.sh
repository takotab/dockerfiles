
docker build . -t jupyterlab --build-arg AUID=$(id -u $(whoami))

docker run -it \
	-p 8888:8888 \
	-v $PWD/dockervolume/:/home/jluser/data jupyterlab 
