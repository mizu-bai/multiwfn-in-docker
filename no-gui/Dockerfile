FROM ubuntu:bionic

LABEL maintainer="mizu-bai <shiragawa4519@outlook.com>"

ENV MULTIWFN_PATH="/opt/Multiwfn_bin"

ARG BASHRC="/root/.bashrc"
ARG WORKSPACE="/opt/MultiwfnWorkspace"

RUN set -x; apt update \
    && apt install -y libxm4 libgl1 \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p ${MULTIWFN_PATH} \
    && mkdir -p ${WORKSPACE} \
    && touch ${BASHRC} \
    && echo "KMP_STACKSIZE=200M" >> ${BASHRC} \
    && echo "ulimit -s unlimited" >> ${BASHRC} \
    && echo "Multiwfnpath=${MULTIWFN_PATH}" >> ${BASHRC} \
    && echo "export PATH=\$Multiwfnpath:\$PATH" >> ${BASHRC} \
    && echo "kernel.shmmax=512000000" >> /etc/sysctl.conf

ENTRYPOINT [ "bash" ]
