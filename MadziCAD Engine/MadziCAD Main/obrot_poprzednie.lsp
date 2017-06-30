(defun c:obrot_poprzednie()
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (command "_rotate"
    (ssget "_P") 				;poprzedni wybor
    "" 
    (getpoint "\n Wska¿ punkt bazowy: ")
  )
(princ)
)


