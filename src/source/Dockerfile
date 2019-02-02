FROM alpine:3.8

ENV WORK_DIR /reddit/app
ENV REPO_DIR crzlol_microservices

RUN mkdir -p $WORK_DIR/comment && mkdir -p $WORK_DIR/post && mkdir -p $WORK_DIR/ui && apk add git bash \
&& git clone https://github.com/Otus-DevOps-2018-09/crzlol_microservices.git \
&& echo -e "#""!""/bin/bash\nwhile [ 1 = 1 ]; do cd /crzlol_microservices && git pull && cp -R src/* ../reddit/app/; sleep 10; done" \
> update_repo.sh && chmod +x update_repo.sh && cd /crzlol_microservices && cp -R src/* ../reddit/app/

CMD ["./update_repo.sh"]
