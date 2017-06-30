(defun c:papier_model()
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (if
    (= (getvar "tilemode") 1)
    (progn
      (setvar "tilemode" 0)
      (setvar "ltscale" skalalinii)
    )
    (progn
      (setvar "tilemode" 1)
      (setvar "ltscale" (* skalalinii 100))
    )
  )
  (command "_regenall")
  (setvar "psltscale" 1)
  (princ)
)

