FROM python:3.10.5-bullseye
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
COPY downloader /downloader
CMD ["/downloader"]
