(defun c:zoom_poprzedni()
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  ;(command "_regen")
  (command "_zoom" "_previous")
  (princ "\n Przywrócono poprzedni zoom. ")
  (princ)
)

