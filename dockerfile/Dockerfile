FROM ubuntu:bionic

LABEL maintainer="mizu-bai <shiragawa4519@outlook.com>"

ENV MULTIWFN_PATH="/opt/Multiwfn_bin"

ARG SHELL_PROFILE="/root/.bash_profile"
ARG WORKSPACE="/opt/MultiwfnWorkspace"

RUN set -x; apt update \
    && apt install -y \
        libxm4 \
        libgl1 \
        --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p ${MULTIWFN_PATH} \
    && mkdir -p ${WORKSPACE} \
    && touch ${SHELL_PROFILE} \
    && echo "KMP_STACKSIZE=200M" >> ${SHELL_PROFILE} \
    && echo "ulimit -s unlimited" >> ${SHELL_PROFILE} \
    && echo "Multiwfnpath=${MULTIWFN_PATH}" >> ${SHELL_PROFILE} \
    && echo "export PATH=\$Multiwfnpath:\$PATH" >> ${SHELL_PROFILE} \
    && echo "kernel.shmmax=512000000" >> /etc/sysctl.conf

ENTRYPOINT [ "bash" ]
