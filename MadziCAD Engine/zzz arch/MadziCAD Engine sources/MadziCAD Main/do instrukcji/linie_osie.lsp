(defun c:linie_osie(/ layerprev)
  (defun *error* (errorlevel)
    (setvar "clayer" layerprev)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq layerprev (getvar "clayer"))    ;zapamietuje biezaca warstwe
  (setvar "clayer" warstwanr6)
  (princ "\n Narysuj o�: ")
  (command "_pline")
  (while (= (logand (getvar "cmdactive") 1) 1)
    (princ "\n Wska� kolejny punkt lub zako�cz. ")
    (command pause)
  )
  (setvar "clayer" layerprev)
  (princ)
)


