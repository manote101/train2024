## Traing MNIST model in Tensorflow
`cd cluster-demo/deployments/flask/test`

`srun --container-image=/dataset/squashfs/nvidia+tensorflow+22.12-tf2-py3.sqsh --container-name=tensorflow --container-workdir=$(pwd) --gpus=1 python train.py`


### Test prediction
`srun --container-image=/dataset/squashfs/nvidia+tensorflow+22.12-tf2-py3.sqsh --container-name=tensorflow --container-workdir=$(pwd) --gres=gpu:1g.10gb:1 python new_load.py eight.png`



## App Deployment
### 1. Deploy in DGX host
Start Flask and deploy modells -
#### create Virtual Environement for Flask
```Shell
python -m venv Flask
source Flask/bin/activate
pip install -r requirements.txt
srun --gpus=1 python main.py
```

# SSH to test on DGX node
```Shell
cd ~/train2024/5-Inference/flask
curl -F "file=@test/eight.png" http://127.0.0.1:5000
```


### Build Docker image
```Shell
cd cluster-demo/deployments/flask
docker build -t flask_app . 
docker images
```


### Start Docker container

```Shell
# $PORT is listening port of gunicorn, -p 8910:8900 will expose container port 8900 to host port 8910
docker run --gpus '"device=0:1"' -e "PORT=8900" -it --rm -p 8910:8900 flask_app
```

### Test prediction by sending file with curl command 

`curl -F "file=@test/three.png" http://<dgx-ip-address>:8910/`

