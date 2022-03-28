FROM hiroshiturbo/hiroshi-userbot:buster
RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    curl \
    git \
    ffmpeg
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs && \
    npm i -g npm
RUN git clone -b Hiroshi-Userbot https://github.com/UserbotMaps/Hiroshi-Userbot /home/Hiroshi-Userbot/ \
    && chmod 777 /home/Hiroshi-Userbot \
    && mkdir /home/Hiroshi-Userbot/bin/
WORKDIR /home/Hiroshi-Userbot/
COPY ./sample_config.env ./config.env* /home/Hiroshi-Userbot
RUN pip install -r requirements.txt
CMD ["python3", "-m", "userbot"]
