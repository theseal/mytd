FROM alpine:3.15.0
RUN apk --update-cache add py3-pip python3 build-base curl ffmpeg findutils build-base python3-dev
RUN pip3 install yt-dlp==2022.03.08.1
COPY downloader /downloader
CMD ["/downloader"]
