#SingleInstance

:?*:/phreload`n::
{
Send, {Enter}
Reload
}
Return

:?*:/phoff`n::
{
MsgBox, 4144, Prison Haste Reminder (by xsss\SoulSky), Вы действительно хотите отключить скрипт?`n`nВсе внутриигровые команды будут отключены до следующего запуска AHK-файла.
IfMsgBox, Yes
    {
     MsgBox, 4160, ❤, Спасибо за использование Prison Haste Reminder!`n(by xsss\SoulSky), 2
     ExitApp
    }
IfMsgBox, No
    {
     MsgBox, 4160, Prison Haste Reminder (by xsss\SoulSky), Работа скрипта продолжается!, 1
     Reload
    }
}
Return


:?*:/ph`n::
{
IfWinNotExist, VimeWorld.ru
    {
     MsgBox, 4112, Prison Haste Reminder (by xsss\SoulSky), Ошибка! VimeWorld.ru не запущен!
     Return
    }
Send, Скрипт успешно запущен{!}
Sleep, 300
sign := ""
GUI, Font, s12, Trebuchet MS
GUI, Add, Text, x50 y0, Ваш часовой пояс:
GUI, Add, Radio, vMoscow, Московский
GUI, Add, Radio, vMoscowPlus, Больше московского (+N)
GUI, Add, Radio, vMoscowMinus, Меньше московского (-N)
GUI, Add, Button, default, Подтвердить
GUI, Color, FFF7F7
GUI, Show, w300, PHR (by xsss\SoulSky)
Return

ButtonПодтвердить:
GUI, Submit
If Moscow = 1
{
Time := 0
MsgBox, 4144, Prison Haste Reminder (by xsss\SoulSky), Ваш часовой пояс: Московский`n`nЕсли часовой пояс неверен, то перезапустите скрипт командой /phreload
GUI, Destroy
Goto, mainmsg
}
If MoscowPlus = 1
{
sign := "+"
GUI, Destroy
Goto, number
}
If MoscowMinus = 1
{
sign := "-"
GUI, Destroy
Goto, number
}
If else
{
MsgBox, 4112, Prison Haste Reminder (by xsss\SoulSky), Вы убили скрипт.
Return
}

number:
GUI, Font, s12, Trebuchet MS
GUI, Add, Text, , Пожалуйста, введите цифру\число вашего часового пояса:
GUI, Add, Edit, vTime
GUI, Add, Button, x200 y40 w80 h30, OK
GUI, Color, FFF7F7
GUI, Show,, Prison Haste Reminder (by xsss\SoulSky)
Return
ButtonOK:
GUI, Submit
If (%Time% = 0 or Time > 24)
{
MsgBox, 4112, Prison Haste Reminder (by xsss\SoulSky), Ошибка! Перезапустите скрипт! (/phreload)
GUI, Destroy
Return
}
If (%Time% <> 0)
{
MsgBox, 4144, Prison Haste Reminder (by xsss\SoulSky), Ваш часовой пояс: %sign%%Time%`n`nЕсли часовой пояс указан неверно, перезапустите скрипт.`n/phreload
GUI, Destroy
Goto, mainmsg
}
Return

mainmsg:
MsgBox, 4160, Prison Haste Reminder (by xsss\SoulSky), Приятной игры! ❤, 1
WinActivate, VimeWorld.ru
Send, {vk11 Down}{vk41}
Sleep, 50
Send, {vk11 Up}❤
Sleep, 50
If (Time = 6 or Time = 12 or Time = 18 or Time = 24)
{Time := 0
}
If (Time = 7 or Time = 13 or Time = 19)
{Time := 1
}
If (Time = 8 or Time = 14 or Time = 20)
{Time := 2
}
If (Time = 9 or Time = 15 or Time = 21)
{Time := 3
}
If (Time = 10 or Time = 16 or Time = 22)
{Time := 4
}
If (Time = 11 or Time = 17 or Time = 23)
{Time := 5
}
If (sign = "+" or sign = "")
{
Goto, main
}
Return
If (sign = "-")
{
Goto, mainminus
}
Return

main:
Loop
{
If ((A_Hour = 0+Time or A_Hour = 6+Time or A_Hour = 12+Time or A_Hour = 18+Time) and (A_Min = 55))
    {
     GUI, +AlwaysOnTop
     GUI, Font, s10, Trebuchet MS
     GUI, Add, Text, , Скоро начнется запись на служение!
     GUI, Add, Button, default, Принять
     GUI, Color, FFF7F7
     GUI, Show, x0 y0, Prison Haste Reminder (by xsss\SoulSky)
     WinActivate, VimeWorld.ru
     Return
    }
If ((A_Hour = 0+Time or A_Hour = 6+Time or A_Hour = 12+Time or A_Hour = 18+Time) and (A_Min = 53))
    {
     GUI, +AlwaysOnTop
     GUI, Font, s10, Trebuchet MS
     GUI, Add, Text, , Запись на служение начнется через 2 минуты!
     GUI, Add, Button, default, Принять
     GUI, Color, FFF7F7
     GUI, Show, x0 y0, Prison Haste Reminder (by xsss\SoulSky)
     WinActivate, VimeWorld.ru
     Return
    }
If ((A_Hour = 0+Time or A_Hour = 6+Time or A_Hour = 12+Time or A_Hour = 18+Time) and (A_Min = 50))
    {
     GUI, +AlwaysOnTop
     GUI, Font, s10, Trebuchet MS
     GUI, Add, Text, , Запись на служение начнется через 5 минут!
     GUI, Add, Button, default, Принять
     GUI, Color, FFF7F7
     GUI, Show, x0 y0, Prison Haste Reminder (by xsss\SoulSky)
     WinActivate, VimeWorld.ru
     Return
    }
}
ButtonПринять:
{
GUI, Destroy
Sleep, 60000
Goto, main
}

mainminus:
Loop
{
If ((A_Hour = 0-Time or A_Hour = 6-Time or A_Hour = 12-Time or A_Hour = 18-Time) and (A_Min = 55))
    {
     GUI, +AlwaysOnTop
     GUI, Font, s10, Trebuchet MS
     GUI, Add, Text, , Скоро начнется запись на служение!
     GUI, Add, Button, default, ОК
     GUI, Color, FFF7F7
     GUI, Show, x0 y0, Prison Haste Reminder (by xsss\SoulSky)
     WinActivate, VimeWorld.ru
     Return
    }
If ((A_Hour = 0-Time or A_Hour = 6-Time or A_Hour = 12-Time or A_Hour = 18-Time) and (A_Min = 53))
    {
     GUI, +AlwaysOnTop
     GUI, Font, s10, Trebuchet MS
     GUI, Add, Text, , Запись на служение начнется через 2 минуты!
     GUI, Add, Button, default, ОК
     GUI, Color, FFF7F7
     GUI, Show, x0 y0, Prison Haste Reminder (by xsss\SoulSky)
     WinActivate, VimeWorld.ru
     Return
    }
If ((A_Hour = 0-Time or A_Hour = 6-Time or A_Hour = 12-Time or A_Hour = 18-Time) and (A_Min = 50))
    {
     GUI, +AlwaysOnTop
     GUI, Font, s10, Trebuchet MS
     GUI, Add, Text, , Запись на служение начнется через 5 минут!
     GUI, Add, Button, default, ОК
     GUI, Color, FFF7F7
     GUI, Show, x0 y0, Prison Haste Reminder (by xsss\SoulSky)
     WinActivate, VimeWorld.ru
     Return
    }
}
ButtonОК:
{
GUI, Destroy
Sleep, 60000
Goto, main
}
}
Return


GUIClose:
{
GUI, Destroy
MsgBox, 4112, Prison Haste Reminder (by xsss\SoulSky), Действие 'Prison Haste Reminder' отменено, 3
Reload
}
Return