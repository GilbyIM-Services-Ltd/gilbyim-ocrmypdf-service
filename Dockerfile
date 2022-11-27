# OS
FROM ubuntu:22.04

# Install dependencies
RUN\
	apt-get update && yes | apt-get install tesseract-ocr-spa 
	# poppler-utils

# Install OCRMYPDF
RUN\
	apt-get update && yes | apt-get install ocrmypdf

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
