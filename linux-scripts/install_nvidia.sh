apt-get install -y nvidia-driver-510
systemctl set-default multi-user
wget https://raw.githubusercontent.com/keylase/nvidia-patch/master/patch.sh
chmod a+x ./patch.sh
./patch.sh
apt-mark hold nvidia-driver-510      
apt-mark hold nvidia-cuda-dev
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)       && curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg       && curl -s -L https://nvidia.github.io/libnvidia-container/$distribution/libnvidia-container.list |             sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' |             sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
apt-get update
apt-get install -y nvidia-docker2
systemctl restart docker
echo ""
nvidia-smi
echo ""
docker -v
echo ""
docker info
echo ""
docker run --gpus all nvidia/cuda:11.0.3-devel-ubuntu18.04 nvidia-smi