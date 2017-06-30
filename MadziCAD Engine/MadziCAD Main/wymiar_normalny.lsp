(defun c:wymiar_normalny(/ layerprev pkt1 pkt2)
  (defun *error* (errorlevel)
    (setvar "clayer" layerprev)			;zmienia na poprz warstwe
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq layerprev (getvar "clayer"))			;zapamietuje biezaca warstwe
  (setvar "clayer" warwym)			;ustala akt warstwe na 'wymiary'
  (setq pkt1 (getpoint "\n Wska¿ pierwszy punkt: "))
  (setq pkt2 (getpoint "\n Wska¿ drugi punkt: "))
  (princ "\n Wska¿ punkt wstawienia wymiaru: ")
  (command "_dimaligned" 
    pkt1 
    pkt2
    pause
  )
  (setvar "clayer" layerprev)			;zmienia na poprz warstwe
  (princ)
)
