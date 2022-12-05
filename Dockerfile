# OS
FROM ubuntu:22.04
#FROM jbarlow83/ocrmypdf

# Install Build Utilities
RUN\
	apt-get update && yes | apt-get install git autotools-dev automake libtool zlib1g-dev make g++
	


# Install dependencies
RUN\
	apt-get update && yes | apt-get install tesseract-ocr-spa poppler-utils libleptonica-dev 

RUN\
	git clone https://github.com/agl/jbig2enc && cd jbig2enc &&\
	./autogen.sh && ./configure && make &&\
	make install

	

# Install OCRMYPDF
RUN\
	apt-get update && yes | apt-get install ocrmypdf python3-pip

# Install Nodejs
RUN\
	apt-get update && yes | apt-get install nodejs &&\
	apt-get update && yes | apt-get install npm

# Create app directory
RUN\
	mkdir /usr/src/app

# Set Work Directory
WORKDIR /usr/src/app

# Node dependcies
COPY package.json .

RUN\ 
	npm install

# copy app
COPY . .

# Expose the port
EXPOSE 4000

# start
CMD ["npm","start"]
