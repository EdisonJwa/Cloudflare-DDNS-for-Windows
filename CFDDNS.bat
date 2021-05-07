@echo off

:: Define Your Email Address
set email=user@example.com

:: Define Your Cloudflare API Key
set api_key=xxxxx

:: Define Your Zone ID
set zoneid=xxxxxxx

:: Define Your Record ID
set record_id=xxxxxx

:: Full domain address used for DDNS
set domain=abc.example.com

:: IPv4 DDNS
::Get IPv4 Address by fetch API
for /F %%i in ('curl -k -s "http://ipv4.whatismyip.akamai.com"') do ( set ipv4=%%i)

curl -X PUT "https://api.cloudflare.com/client/v4/zones/%zoneid%/dns_records/%record_id%" -H "X-Auth-Email: %email%" -H "X-Auth-Key: %api_key%" -H "Content-Type: application/json" --data "{\"type\":\"A\",\"name\":\"%domain%\",\"content\":\"%ipv4%\"}"

:: IPv6 DDNS

:: Get IPv6 Address by fetch API
for /F %%i in ('curl -k -s "http://ipv6.whatismyip.akamai.com"') do ( set ipv6=%%i)

curl -X PUT "https://api.cloudflare.com/client/v4/zones/%zoneid%/dns_records/%record_id%" -H "X-Auth-Email: %email%" -H "X-Auth-Key: %api_key%" -H "Content-Type: application/json" --data "{\"type\":\"AAAA\",\"name\":\"%domain%\",\"content\":\"%ipv6%\"}"
