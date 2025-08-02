![BanStatus icon](https://raw.githubusercontent.com/whyplural/banstatus/gui-beta/res/icon.ico)
<center># BanStatus
Программа для проверки доступности заблокированных и/или недоступных сайтов. Вы можете использовать её для проверки вашего VPN или DNS-сервера.</center>
## Использование
Запустите файл banstatus-gui.py. Чтобы проверить обновления запустите файл update.bat.
## Проверяемые сайты
Все сайты, проверяемые программой перечислены в **list-banned.txt**.
> [!IMPORTANT]  
> На данный момент программа может отображать доступные сайты как недоступные при работе zapret cо списком сайтов, совпадающих с list-banned.txt (к примеру, MisterFish DPI), но правильно отображает доступность сайтов со включенным VPN.
## Принцип работы
Программа пингует определенный сайт через
```batch
ping -n 1 nyaa.si
```
затем проверяет пинг на наличие ошибок, при их отсутствии выводит сообщение о доступности.
____
Сайты будут добавляться.
*Заблокированные сайты как cloudflare-ech.com, yt4.ggpht.com, googlevideo.com и т.д., могут отображаться доступными в любом случае.*
![GitHub Created At](https://img.shields.io/github/created-at/whyplural/banstatus) ![GitHub Release](https://img.shields.io/github/v/release/whyplural/banstatus) 
![GitHub last commit (branch)](https://img.shields.io/github/last-commit/whyplural/banstatus/main?label=last%20main%20commit)
