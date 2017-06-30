(defun c:kopiuj_poprzednie()
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (command "_copy"
    "_previous" 				;poprzedni wybor
    "" 
    (getpoint "\n Wska� punkt bazowy: ")		 
    pause
  )
(princ)
)

(defun c:xxx()  ;kopiuj enhanced dokonczyc
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq temp_selection (ssget))
  (setq base_pt (cdr (assoc 10 (entget (ssname temp_selection 0)))))
  (command "_copy"
    temp_selection
    "" 
    base_pt
    pause
  )
(princ)
)

