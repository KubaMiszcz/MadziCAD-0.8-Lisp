(defun c:zoom_okno()
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (command "_zoom" "o" pause)
  (princ)
)

