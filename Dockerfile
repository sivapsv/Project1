FROM ubuntu:16.04

WORKDIR /opt/mkdocs

ENV LC_ALL=C.UTF-8 \
    LANG=C.UTF-8

# weasy dependencies
RUN set -ex && \
    apt-get update && apt-get install -y \
        build-essential \
        python3-dev \
        python3-pip \
        python3-setuptools \
        python3-wheel \
        python3-cffi \
        libcairo2 \
        libpango-1.0-0 \
        libpangocairo-1.0-0 \
        libgdk-pixbuf2.0-0 \
        libffi-dev \
        shared-mime-info

COPY run.sh .	
	
# mkdocs
RUN set -ex && \
    pip3 install mkdocs && \
    pip3 install mkdocs-material && \
    pip3 install mkdocs-pdf-export-plugin && \
	chmod +x run.sh



ENTRYPOINT ["./run.sh"]
#ENTRYPOINT ["weasyprint http://weasyprint.org ./weasyprint-website.pdf"]
