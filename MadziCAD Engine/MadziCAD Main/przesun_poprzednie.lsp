(defun c:przesun_poprzednie()
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (command "_move"
    (ssget "_P") 				;poprzedni wybor
    "" 
    (getpoint "\n Wska¿ punkt bazowy: ")		 
    pause
  ) 
(princ)
)


