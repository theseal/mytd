FROM alpine:3.15.0
RUN apk --update-cache add py3-pip python3 build-base curl ffmpeg findutils
RUN pip3 install yt-dlp==2021.12.01
COPY downloader /downloader
CMD ["/downloader"]
