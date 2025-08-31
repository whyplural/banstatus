![BanStatus icon](https://raw.githubusercontent.com/whyplural/banstatus/main/res/icon.ico)
# BanStatus
Программа для проверки доступности заблокированных и/или недоступных сайтов. Вы можете использовать её для проверки вашего VPN или DNS-сервера.
## Использование
[Скачайте](https://github.com/whyplural/banstatus/releases/latest) архив с последней версией, распакуйте в удобную папку и запустите файл banstatus-gui.exe. Чтобы проверить обновления запустите файл update.bat. При нажатии на кнопку "Переключить список" программа переключает список проверяемых сайтов. Вы можете сделать свои списки, изменив любой файл по пути res/list-banned.txt, list-banned2.txt или list-general.txt и проверять выбранные вами сайты.
> [!IMPORTANT]  
> На данный момент программа может отображать доступные сайты как недоступные при работе zapret cо списком сайтов, совпадающих с list-banned.txt (к примеру, MisterFish DPI), но правильно отображает доступность сайтов со включенным VPN.
## Принцип работы
Программа пингует определенный сайт через
```batch
ping -n 1 nyaa.si
```
затем проверяет пинг на наличие ошибок, при их отсутствии выводит сообщение о доступности.
## Известные ошибки
[Все ошибки с тегом willfix](https://github.com/whyplural/banstatus/issues?q=is%3Aissue%20state%3Aopen%20label%3Awillfix)
____
Сайты будут добавляться.
*Заблокированные сайты как cloudflare-ech.com, yt4.ggpht.com, googlevideo.com и т.д., могут отображаться доступными в любом случае.*
*Программа НЕ даёт доступ к каким-либо заблокированным на территории РФ сайтам.*

![GitHub Created At](https://img.shields.io/github/created-at/whyplural/banstatus) ![GitHub Release](https://img.shields.io/github/v/release/whyplural/banstatus) 
![Static Badge](https://img.shields.io/badge/platform-windows-blue)
