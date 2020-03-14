FROM minio/minio
COPY . /app
RUN mc ls
