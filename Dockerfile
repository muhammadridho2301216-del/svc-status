FROM tsl0922/ttyd:latest
USER root
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
	ca-certificates curl dnsutils git gosu htop iproute2 jq nano net-tools \
	nodejs npm openssh-client procps python3 python3-pip sudo tmux tree \
	unzip vim wget zip \
	&& useradd --create-home --shell /bin/bash server \
	&& usermod --append --groups sudo server \
	&& printf 'server ALL=(ALL) NOPASSWD:ALL\n' > /etc/sudoers.d/server \
	&& chmod 0440 /etc/sudoers.d/server \
	&& rm -rf /var/lib/apt/lists/*
WORKDIR /workspace
VOLUME ["/workspace"]
COPY boot.sh /app/boot.sh
RUN chmod +x /app/boot.sh
EXPOSE 8080
ENTRYPOINT ["/app/boot.sh"]
