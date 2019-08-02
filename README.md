# ML Docker Image

This docker image can be used to quickly get into a ML development environment, and also as a base for deploying dockerized ML applications onto AWS services. It is based off the `paperspace/fastai` image, with additional packages that we need.

# Development

Build the docker image with `bash ./build.sh`

Then you can use something like

```
sudo docker run --runtime=nvidia -p 127.0.0.1:8888:8888/tcp --shm-size 8G -d --env-file .env -v ~/:/opt/host ml_nn_fastai "source activate fastai && jupyter notebook --ip 0.0.0.0 --port 8888 --no-browser --allow-root --NotebookApp.token=''"
```

This:
 - Starts the docker image with NVIDIA GPU support
 - Loads environment variables from a `.env` file
 - Mounts the host filesystem at the root directory, so you can persist Notebooks, cached files etc.
 - Boots a Jupyter notebook server and binds it to port 8888 on the host system
