(defun c:typowy_tekst(/ layerprev osmodeprev pkt)
  (defun *error* (errorlevel)
    (setvar "osmode" osmodeprev)
    (setvar "clayer" layerprev)			;zmienia na poprz warstwe
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq layerprev (getvar "clayer"))			;zapamietuje biezaca warstwe
  (setq osmodeprev (getvar "osmode"))
  (setvar "clayer" warwym)			;ustala akt warstwe na 'wymiary'
  (setq pkt (getpoint "\n Wska¿ punkt wstawienie tekstu: "))
  (setvar "osmode" 0)
  (initdia)
  (command "_mtext" 
    pkt
    "w" "dl" 
    "k" (* (getvar "dimscale") txta)			;wysokosc tekstu
    pkt
  )
  (setvar "osmode" osmodeprev)
  (setvar "clayer" layerprev)			;zmienia na poprz warstwe
  (princ)  
)
