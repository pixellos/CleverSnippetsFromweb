#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
F6::  ; CTRL+B hotkey
Send, {End}
Send, {Home}
Send, {Enter}
Send, {Up}
sleep, 50
Send, {Shift down}{Delete}{Shift up}
Send, {Down}
return  ; This ends the hotkey. The code below this point will not get triggered.

^F6::
Loop 50 {
Send, {End}
Send, {Home}
Send, {Enter}
Send, {Up}
sleep, 50
Send, {Shift down}{Delete}{Shift up}
Send, {Down}
}
return  ; This ends the hotkey. The code below this point will not get triggered.
