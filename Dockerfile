#Grab the latest alpine image
FROM paperspace/fastai:1.0-CUDA9.2-base-3.0-v1.0.6

RUN /bin/bash -c "source activate fastai && conda install -c fastai fastai=1.0.52"
RUN /bin/bash -c "source activate fastai && pip install SQLAlchemy psycopg2-binary"
RUN /bin/bash -c "source activate fastai && pip install sklearn lightgbm xgboost seaborn boto3 hyperopt"
RUN /bin/bash -c "source activate fastai && pip install --upgrade tables"
RUN /bin/bash -c "source activate fastai && conda install cudatoolkit=9.0 pytorch=1.1.0 -c pytorch"

WORKDIR /opt/host

ENTRYPOINT [ "/bin/bash", "-c" ]
