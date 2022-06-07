# 스트림링크 자동 아카이브.bat

## Required
Streamlink https://streamlink.github.io/

```batch
@echo off
cd C:\Users\Administrator\Desktop\Archive\Streams
rem 파일 저장 경로
setlocal
set Link=
set Streamer=

:Link
set /p Link=Link : 
rem 방송 주소 입력
set /p Streamer=Streamer : 
rem 파일 이름 입력 // Output : yyyy-mm-dd-<Streamer>-hh-mm-ss.mp4
title %date%-%Streamer%
goto Down

:Down
streamlink --http-cookie "auth-token={tiwtch.tv 토큰}; __Secure-3PSID={youtube.com 토큰}" "%Link%" best -o "%date%-%Streamer%-%time::=-%.mp4" --retry-streams 30 --twitch-disable-hosting --twitch-disable-ads --hls-segment-threads 5
rem twitch.tv / youtube.com -> F12 -> Application -> Cookies -> auth-token(twitch.tv) / __Secure-3PSID(youtube.com) 토큰의 값 입력.
echo =========================
echo Finish %date%-%Streamer%-%time::=-%
echo =========================
goto Down
```
```sh
#!/bin/bash

while true; do
  LINK="https://twitch.tv/vrecord_choki"
  FNAME="CHOKI_twitch_$(date +"%Y%m%d_%H%M%S").mp4"
  streamlink --http-cookie "auth-token={tiwtch.tv 토큰}; __Secure-3PSID={youtube.com 토큰}" "$LINK" best -o "$FNAME" --retry-streams 10 --twitch-disable-hosting --twitch-disable-ads --hls-segment-threads 5
  FNAME="CHOKI_twitch_$(date +"%Y%m%d_%H%M%S").mp4"
done
```

대충써~ 
