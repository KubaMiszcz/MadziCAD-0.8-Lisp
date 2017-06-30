(defun C:wymiar_szeregowy(/ layerprev)
  (defun *error* (errorlevel)
    (command "_layer" "u" layerprev "")			;zmienia na poprz warstwe
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq layerprev (getvar "clayer"))			;zapamietuje biezaca warstwe
  (setvar "clayer" warwym)			;ustala akt warstwe na 'wymiary'
  (command "_dimcontinue"
    "w" 
    (ssget "_:S")
    (while (= (logand (getvar "cmdactive") 1) 1)
      (command pause)
    )
  )
  (setvar "clayer" layerprev)			;zmienia na poprz warstwe
  (princ )
)
