#cs ----------------------------------------------------------------------------

 AutoIt Version : 3.3.14.2
 Auteur:         Kevin

 Fonction du Script :
	Modèle de Script AutoIt.

#ce ----------------------------------------------------------------------------

; Début du script - Ajouter votre code ci-dessous.
#pragma compile(Icon, C:\Program Files (x86)\AutoIt3\Icons\au3.ico)

#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <TabConstants.au3>
#include <ColorConstants.au3>

#Region ### START Koda GUI section ### Form=C:\Users\Kevin\Desktop\Bot_Tofus.kxf
Global $COLOR_LIMEBLUE = 0x3399FF
Global $COLOR_LIMEGREEN = 0x33FF00
Global $Bot_Tofus = GUICreate("Tofux 1.0", 250, 350, 1150, 10)
Global $Labe1 = GUICtrlCreateLabel("Console:", 7, 10, 101, 25)
Global $Labe2 = GUICtrlCreateLabel("Total de Combats Session :", 7, 190, 200, 17)
Global $Labe3 = GUICtrlCreateLabel("Coded by Magi_Oxygène", 120, 335)
Global $Labe4 = GUICtrlCreateLabel("", 155, 230,80,17)
Global $Labe5 = GUICtrlCreateLabel("Total de Combats Global :", 7, 210, 200, 17)
Global $Labe6 = GUICtrlCreateLabel("Début de la session : ", 7, 230, 100, 17)
Global $Labe7 = GUICtrlCreateLabel("Etat du Bot : ", 7, 250, 100, 17)
Global $Labe8 = GUICtrlCreateLabel("En Attente !", 93, 250, 71, 14,$SS_CENTER)
GUICtrlSetColor($Labe8,$COLOR_RED)
GUICtrlSetBkColor($Labe8, $COLOR_BLACK)
Global $Console = GUICtrlCreateEdit("", 5, 28, 240, 148, BitOR($ES_AUTOVSCROLL,$ES_READONLY,$WS_VSCROLL))
GUICtrlSetData(-1, @HOUR & ":" & @MIN & ":" & @SEC & " : " & "Ouverture du programme"& @CRLF)
GUICtrlSetColor($Console,$COLOR_LIMEGREEN)
GUICtrlSetBkColor($Console, $COLOR_BLACK)
Global $Button1 = GUICtrlCreateButton("Connexion", 25, 270, 198, 25)
Global $Button2 = GUICtrlCreateButton("Démarrer ECHAP pour Stop", 25, 305, 198, 25)
Global $TotalCombatSession = GUICtrlCreateInput("0", 155, 187, 71, 20)
GUICtrlSetState(-1, $GUI_DISABLE)
Global $TotalCombatGlobal = GUICtrlCreateInput("0", 155, 207, 71, 20)
GUICtrlSetState(-1, $GUI_DISABLE)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

Global $Mode_Auto = False
Global $CompteurSession = 0
Global $LocalTime = @HOUR & ":" & @MIN & ":" & @SEC
GUICtrlSetData($Labe4, $LocalTime)
Global $CompteurGlobal = 0

Func Stop()
	$Mode_Auto = False
	GUICtrlSetData($Labe8, "En Attente !")
	GUICtrlSetColor($Labe8,$COLOR_RED)

	EndFunc

Func Sauvegarde()
		IniWrite(@ScriptDir & "\dofbotSauvegarde.ini", "Stats", "CompteurGlobal", $CompteurGlobal)


	EndFunc

Func Chargement()
		 $CompteurGlobal = IniRead(@ScriptDir & "\dofbotSauvegarde.ini", "Stats", "CompteurGlobal", "")



	EndFunc

HotKeySet("{ESC}", "Stop")
Chargement()
GUICtrlSetData($TotalCombatGlobal,$CompteurGlobal)
GUICtrlSetData($Console, @HOUR & ":" & @MIN & ":" & @SEC & " : " & "Chargement du Compteur Global"& @CRLF,1)

While 1

 $nMsg = GUIGetMsg()
 Switch $nMsg
  Case $GUI_EVENT_CLOSE
   Exit



	Case $Button1

		 Run("C:\Users\Kevin\Downloads\Dofus Modifs\Dofus.exe"); on lance Dofus

		 WinWaitActive("Dofus") ; on attend que la fenetre de dofus s'ouvre

		 Sleep(5000)
		 Send("user")
		 Sleep(1000)
		 GUICtrlSetData($Console, @HOUR & ":" & @MIN & ":" & @SEC & " : " & "Connexion en cours"& @CRLF,1)
		 Sleep(1000)
		 Send("{TAB}")
		 Sleep(1000)
		 Send("password")
		 Sleep(1000)
		 Send("{ENTER}")
		 Sleep(1000)
		GUICtrlSetData($Console, @HOUR & ":" & @MIN & ":" & @SEC & " : " & "Connecté"  & @CRLF,1)
		WinMove("Dofus", "", 0, 0, 1091, 860)

	 Case $Button2
		 $LocalTime = @HOUR & ":" & @MIN & ":" & @SEC
		 GUICtrlSetData($Labe8, "En Action !")
		 GUICtrlSetColor($Labe8,$COLOR_LIMEGREEN)
		 GUICtrlSetData($Labe4, $LocalTime)
		 $Mode_Auto = True
		 GUICtrlSetData($Console, @HOUR & ":" & @MIN & ":" & @SEC & " : " & "Mode Auto Activé"  & @CRLF,1)
		 $Compteur = 0
		 GUICtrlSetData($TotalCombatSession,$Compteur)
		 Do

			 Sleep(1000)

			 MouseClick("left",607,365) ; Lancement du combat
				GUICtrlSetData($Console, @HOUR & ":" & @MIN & ":" & @SEC & " : " & "Lancement d'un combat"  & @CRLF,1)
			 Sleep(500)
			 MouseClick("left",978,601) ; verrouillage
			 Sleep(500)
			 MouseClick("left",545,363) ; placement
			 Sleep(500)
			 MouseClick("left",1001,638) ; bouton pret
				GUICtrlSetData($Console, @HOUR & ":" & @MIN & ":" & @SEC & " : " & "Début du combat"  & @CRLF,1)
			 Sleep(3000)
			 Send("&") ; tir éloigné
				GUICtrlSetData($Console, @HOUR & ":" & @MIN & ":" & @SEC & " : " & "Sort 1"  & @CRLF,1)
			 Sleep(1000)
			 MouseClick("left",973,643) ; cible perso
			 Sleep(2000)
			 Send("é") ; tir magique
				GUICtrlSetData($Console, @HOUR & ":" & @MIN & ":" & @SEC & " : " & "Sort 2"  & @CRLF,1)
			 Sleep(1000)
			 MouseClick("left",1024,644) ; cible ennemie
			 Sleep(4000)
			 MouseClick("left",867,523) ; fermeture du combat
				GUICtrlSetData($Console, @HOUR & ":" & @MIN & ":" & @SEC & " : " & "Fin du combat"  & @CRLF,1)
			 Sleep(1000)
			  $CompteurGlobal = $CompteurGlobal + 1
			  $Compteur = $Compteur + 1
			 GUICtrlSetData($TotalCombatSession,$Compteur)
			 GUICtrlSetData($TotalCombatGlobal,$CompteurGlobal)
			Sauvegarde()


			Until ($Mode_Auto = False)








 EndSwitch



WEnd
