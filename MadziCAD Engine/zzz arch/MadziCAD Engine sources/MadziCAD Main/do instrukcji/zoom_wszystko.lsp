(defun c:zoom_wszystko()
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (command "_regen")
  ;(command "_zoom" "_all")
  (princ "\n Powiększono do granic rysunku. ")
  (princ)
)

