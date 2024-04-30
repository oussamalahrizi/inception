FROM debian:bullseye

RUN apt update -y && apt upgrade -y

RUN apt install curl git hugo xz-utils  -y

WORKDIR /var/hugo

RUN hugo new site static -f yaml && \
	cd /var/hugo/static && \
	git clone https://gitlab.com/writeonlyhugo/up-business-theme.git themes/up-business-theme && \
	cp themes/up-business-theme/hugoBasicExample/config.yaml . && \
	cp -a themes/up-business-theme/hugoBasicExample/content/* content/ && \
	cp -a themes/up-business-theme/hugoBasicExample/data/* data/

EXPOSE 4040

WORKDIR /var/hugo/static

CMD     ["hugo", "server", \
         "--bind=0.0.0.0", \
         "--baseURL=https://olahrizi.42.fr/static", \
         "-p", "4040", \
         "--logFile=/dev/stdout", \
        "--appendPort=false"]