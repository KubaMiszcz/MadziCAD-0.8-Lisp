(defun c:wymiar_liniowy(/ layerprev)
  (defun *error* (errorlevel)
    (setvar "clayer" layerprev)			;zmienia na poprz warstwe
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq layerprev (getvar "clayer"))			;zapamietuje biezaca warstwe
  (setvar "clayer" warwym)          			;ustala akt warstwe na 'wymiary'
  (command "_dimlinear" 
    (getpoint "\n Wska¿ pierwszy punkt: ")
    (progn 
      (getpoint "\n Wska¿ drugi punkt: ") 
      (princ "\n Wska¿ punkt wstawienia wymiaru: ")
    )
    pause
  )
  (setvar "clayer" layerprev)			;zmienia na poprz warstwe
  (princ)
)

