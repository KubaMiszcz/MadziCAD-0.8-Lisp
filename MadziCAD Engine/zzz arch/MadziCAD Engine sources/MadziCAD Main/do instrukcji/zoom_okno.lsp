(defun c:zoom_okno()
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  ;(command "_regen")
  (command "_zoom" "_window" 
    (progn
      (princ "\n Wska¿ obszar do powiêkszenia: ")
      pause
    )
  )
  (princ)
)

