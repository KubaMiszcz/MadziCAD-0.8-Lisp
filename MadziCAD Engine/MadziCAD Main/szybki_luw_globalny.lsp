(defun c:szybki_luw_globalny()
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (command "_ucs" "g")
  (princ)
)

