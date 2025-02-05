FROM --platform=linux/amd64 debian:bullseye
ENV DEBIAN_FRONTEND noninteractive

ADD cmake /home/cmake
ADD scripts /home/scripts
ADD iree /home/iree

RUN /home/scripts/docker-build/build_packages.sh

RUN /home/scripts/docker-build/build_bela.sh

RUN /home/scripts/docker-build/conda_install.sh

RUN /home/scripts/docker-build/build_iree.sh

CMD /bin/bash && /home/scripts/docker-build/build_env.sh
