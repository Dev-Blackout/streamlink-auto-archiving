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
rem 파일 이름 입력 // 날자 - Streamer - 시간
title %date%-%Streamer%
goto Down

:Down
streamlink --http-cookie "auth-token={tiwtch.tv 토큰}; __Secure-3PSID={youtube.com 토큰}" "%Link%" best -o "%date%-%Streamer%-%time::=-%.mp4" --retry-streams 1 --twitch-disable-hosting --twitch-disable-ads --hls-segment-threads 5
rem twitch.tv / youtube.com -> F12 -> Application -> Cookies -> auth-token / __Secure-3PSID 토큰의 값 입력.
echo =========================
echo Finish %date%-%Streamer%-%time::=-%
echo =========================
goto Down