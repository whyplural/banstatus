![BanStatus icon](https://raw.githubusercontent.com/whyplural/banstatus/gui-beta/res/icon.ico)
# BanStatus
Программа для проверки доступности заблокированных и/или недоступных сайтов. Вы можете использовать её для проверки вашего VPN или DNS-сервера.
> [!NOTE]  
> Поддержка старой версии, основаной на Batch, прекращена. Если вы хотите продолжить использовать Batch-версию BanStatus, скачайте её из [этого](https://github.com/whyplural/banstatus-lite/) репозитория.
## Использование
[Скачайте](https://github.com/whyplural/banstatus/releases/latest) архив с последней версией, распакуйте в удобную папку и запустите файл banstatus-gui.exe. Чтобы проверить обновления запустите файл update.bat.
## Проверяемые сайты
Все сайты, проверяемые программой перечислены в списках в папке **res**.
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
![Static Badge](https://img.shields.io/badge/platform-windows-blue)
