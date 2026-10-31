Dockerfile with the vulnerable version of ffmpeg and a malicious .idx file which can be used to exploit CVE-2026-64830.

To build the image, make sure you have Docker installed. (https://docs.docker.com/get-started/get-docker/)

Run the following command to build the image:
```docker build -t ffmpeg_vuln .```

Run the following command to start and open a shell on the container:
```docker run -it --name=ffmpeg_vuln ffmpeg_vuln /bin/bash```

Run the following command within the container to execute the payload:
```./ffmpeg_g -i ./crash.idx -f null -```