(defun c:skaluj_poprzednie()
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (command "_scale"
    (ssget "_P") 				;poprzedni wybor
    "" 
    (getpoint "\n Wska¿ punkt bazowy: ")
  )
(princ)
)


