(defun C:szybkie_lustro_bez_kasowania_oryginalow (/ temp_selection)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (princ
    "\n Wska� obiekty z kt�rych utworzy� lustrzane odbicie: "
  )
  (setq temp_selection (ssget))
  (command "_mirror" temp_selection "" pause pause "_no")
  (princ (strcat "\n Odbito "
		 (rtos (sslength temp_selection))
		 " obiekt�w bez kasowania orygina��w. "
	 )
  )
  (princ)
)
