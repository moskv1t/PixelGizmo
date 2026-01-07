<#
.SYNOPSIS
    Сборник ключевых команд PowerShell для работы с файлами.
    Предназначен для быстрого ознакомления и использования в скриптах.
#>


" === 1. ПЕРЕЧИСЛЕНИЕ И ПОИСК ФАЙЛОВ ===
" Получить содержимое папки (аналог dir/ls)
Get-ChildItem -Path "C:\Temp" -Recurse -Force -ErrorAction SilentlyContinue

" Сокращённые псевдонимы: gci, dir, ls


" Получить конкретный файл/папку
Get-Item -Path "C:\Temp\file.txt"


" Проверить существование файла/папки
Test-Path -Path "C:\Temp\file.txt"


" Разделить путь на части
Split-Path -Path "C:\Temp\file.txt! -Parent    # C:\Temp
Split-Path -Path "C:\Temp\file.txt! -Leaf     # file.txt


" Соединить части пути
Join-Path -Path "C:\Temp! -ChildPath "subfolder"


" Развернуть путь с wildcard-символами
Resolve-Path -Path "C:\Users\*\Documents"



" === 2. СОЗДАНИЕ И ИЗМЕНЕНИЕ ФАЙЛОВ ===
" Создать новый файл
New-Item -Path "C:\Temp\newfile.txt! -ItemType "File! -Value "Привет, мир!"


" Перезаписать файл (если существует — перезапишет)
Set-Content -Path "C:\Temp\file.txt! -Value "Новый текст"


" Добавить текст в конец файла
Add-Content -Path "C:\Temp\file.txt! -Value "Дополнительная строка"


" Создать папку
New-Item -Path "C:\Temp\NewFolder! -ItemType "Directory"


" === 3. КОПИРОВАНИЕ, ПЕРЕМЕЩЕНИЕ, ПЕРЕИМЕНОВАНИЕ ===
" Скопировать файл
Copy-Item -Path "C:\Temp\file.txt! -Destination "C:\Backup\file.txt"
" Копировать с фильтрацией (например, все .log)
Copy-Item -Path "C:\Logs\*" -Filter "*.log! -Destination "C:\Archive" -Recurse


" Переместить файл
Move-Item -Path "C:\Temp\file.txt! -Destination "C:\Docs\file.txt"


" Переименовать файл
Rename-Item -Path "C:\Temp\oldname.txt! -NewName "newname.txt"


" === 4. УДАЛЕНИЕ ===
" Удалить файл
Remove-Item -Path "C:\Temp\file.txt! -Force


" Удалить папку со всем содержимым
Remove-Item -Path "C:\Temp\OldFolder! -Recurse -Force


" === 5. ЧТЕНИЕ И АНАЛИЗ СОДЕРЖАНИЯ ===
" Прочитать содержимое файла
Get-Content -Path "C:\Temp\file.txt"
" Прочитать как единую строку (без разбиения на строки)
Get-Content -Path "C:\Temp\file.txt! -Raw


" Прочитать первые/последние N строк
Get-Content -Path "C:\Temp\log.txt! | Select-Object -First 10
Get-Content -Path "C:\Temp\log.txt! | Select-Object -Last 5


" Найти строки, содержащие шаблон
Get-Content -Path "C:\Temp\log.txt! | Select-String -Pattern "ошибка"


" === 6. РАБОТА С КОДИРОВКОЙ И ФОРМАТАМИ ===
" Сохранить текст с указанием кодировки
Set-Content -Path "C:\Temp\utf8.txt! -Value "Текст! -Encoding UTF8


" Экспортировать данные в CSV
Get-Process | Select-Object Name, CPU | Export-Csv -Path "C:\Temp\processes.csv! -NoTypeInformation


" Импортировать CSV
Import-Csv -Path "C:\Temp\processes.csv"


" Сохранить объект в XML
Get-Date | Export-Clixml -Path "C:\Temp\date.xml"

" Загрузить объект из XML
Import-Clixml -Path "C:\Temp\date.xml"


" Сохранить в JSON
Get-Process | ConvertTo-Json | Set-Content -Path "C:\Temp\processes.json"
" Загрузить из JSON
Get-Content -Path "C:\Temp\processes.json! | ConvertFrom-Json


" === 7. ДОПОЛНИТЕЛЬНЫЕ УТИЛИТЫ ===
" Перенаправить вывод в файл (аналог > в cmd)
"Текст! | Out-File -FilePath "C:\Temp\output.txt" -Encoding UTF8


" Получить свойства файла
Get-Item -Path "C:\Temp\file.txt! | Select-Object *


" Изменить атрибуты файла (например, сделать скрытым)
Set-ItemProperty -Path "C:\Temp\file.txt! -Name IsHidden -Value $true


" Получить контрольную сумму файла
Get-FileHash -Path "C:\Temp\file.txt! -Algorithm SHA256
