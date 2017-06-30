(defun c:skaluj_poprzednie()
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (command "_scale"
    "_previous" 				;poprzedni wybor
    "" 
    (getpoint "\n Wska¿ punkt bazowy: ")
  )
(princ)
)


