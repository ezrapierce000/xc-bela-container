FROM --platform=linux/amd64 debian:bullseye
ENV DEBIAN_FRONTEND noninteractive

ADD cmake /home/cmake
ADD iree /home/iree
ADD bela-iree-runtime /home/bela-iree-runtime

ADD scripts/docker-build/build_packages.sh /home/scripts/docker-build/build_packages.sh
RUN /home/scripts/docker-build/build_packages.sh

ADD scripts/docker-build/build_bela.sh /home/scripts/docker-build/build_bela.sh
ADD scripts/docker-build/build_settings /home/scripts/docker-build/build_settings

ADD scripts/docker-build/build_env.sh /home/scripts/docker-build/build_env.sh
RUN /home/scripts/docker-build/build_env.sh

ADD scripts/docker-build/build_iree.sh /home/scripts/docker-build/build_iree.sh
RUN /home/scripts/docker-build/build_iree.sh

ADD scripts/benchmark_test.sh /home/scripts/benchmark_test.sh

CMD /bin/bash
