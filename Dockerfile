# download ubuntu 26.04
FROM ubuntu:26.04
LABEL description="Proof of Concept Container for CVE-2026-64830"

RUN apt update && apt install -y unzip
RUN apt upgrade -y clang
RUN apt install -y nasm
RUN apt install -y make
RUN mkdir /tmp/ffmpeg_vuln

WORKDIR /tmp/ffmpeg_vuln
COPY ffmpeg_vuln.zip .
COPY crash.idx .
COPY crash.sub .
RUN unzip ffmpeg_vuln.zip
RUN ./configure --enable-debug --disable-optimizations --cc=clang --extra-cflags="-fsanitize=address -fsanitize-recover=address" --extra-ldflags="-fsanitize=address" && make -j