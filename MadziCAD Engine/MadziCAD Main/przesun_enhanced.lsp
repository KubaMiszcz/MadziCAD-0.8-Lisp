(defun c:przesun_enhanced(/ temp_selection base_pt new_base_pt dx dy)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq temp_selection (ssget))
  (setq base_pt (cdr (assoc 10 (entget (ssname temp_selection 0)))))
  (command "_move" temp_selection "" 
  (progn
    (getpoint "\n Wska¿ punkt bazowy: ")
    (princ "\n Wska¿ punkt docelowy: ")
  )
  pause) 
  (setq new_base_pt (cdr (assoc 10 (entget (ssname temp_selection 0)))))
  (setq dx (abs (- (car base_pt) (car new_base_pt))))
  (setq dy (abs (- (cadr base_pt) (cadr new_base_pt))))
  (princ (strcat " \n Przesuniêto obiekty o " (rtos dx) " jednostek w kierunku X, i o " (rtos dy) " jednostek w kierunku Y. "))
  (princ)
)


