FROM bytesmith/rclient:3.4.1
MAINTAINER info@bytesmith.de

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		microsoft-mlserver-all-9.2.1 \
	&& /opt/microsoft/mlserver/9.2.1/bin/R/activate.sh -a -l \
	&& rm -rf /tmp/* \
	&& apt-get autoremove -y \
	&& apt-get autoclean -y \
	&& rm -rf /var/lib/apt/lists/*
CMD ["/bin/bash"]
