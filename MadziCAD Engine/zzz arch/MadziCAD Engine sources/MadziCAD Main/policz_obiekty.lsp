(defun c:policz_obiekty(/ temp_selection)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana ")
  )
  (princ "\n Wybierz obiekty do policzenia: ")
  (setq temp_selection (ssget))
  ;(setq n (sslength temp_selection))
  (princ (strcat "\n Zaznaczono " (itoa (sslength temp_selection)) " obiekt�w."))
  (alert (strcat "\n Zaznaczono " (itoa (sslength temp_selection)) " obiekt�w."))    
  (princ)
)