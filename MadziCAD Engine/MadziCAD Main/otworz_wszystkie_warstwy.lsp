(defun c:otworz_wszystkie_warstwy()
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (command "_Layer" "a" "*" "")
  (princ "\n Otwarto wszystkie warstwy. ")
  (princ)
)