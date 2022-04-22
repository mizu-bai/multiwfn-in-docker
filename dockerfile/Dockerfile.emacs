FROM mizubai/multiwfn:latest

LABEL maintainer="mizu-bai <shiragawa4519@outlook.com>"

RUN set -x; apt update \
	&& apt install -y \
		emacs \
		--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/* 

ENTRYPOINT [ "bash" ]
