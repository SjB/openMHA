FROM ubuntu:xenial

RUN apt-get update && apt-get dist-upgrade -y && \
    apt-get install \
    	    build-essential \
	    git \
	    libsndfile1-dev \
	    libjack-jackd2-dev \
	    portaudio19-dev -y && \
    apt-get clean -y


VOLUME ['/workspace']
WORKDIR /workspace
CMD ["/bin/sh", "-c", "./configure && make install"]
    	    
