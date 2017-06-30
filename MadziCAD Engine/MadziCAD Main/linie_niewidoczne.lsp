(defun c:linie_niewidoczne(/ layerprev)
  (defun *error* (errorlevel)
    (setvar "clayer" layerprev)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq layerprev (getvar "clayer"))			;zapamietuje biezaca warstwe
  (setvar "clayer" warstwanr5)
  (princ "\n Narysuj linie niewidoczn¹: ")
  (command "_pline")
  (while (= (logand (getvar "cmdactive") 1) 1)
    (princ "\n Wska¿ kolejny punkt lub zakoñcz. ")
    (command pause)
  )
  (setvar "clayer" layerprev)
  (princ)
)


