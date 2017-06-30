(defun c:przenies_na_aktualna_warstwe (/ temp_selection)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (princ
    "\n Wska� obiekt lub obiekty do przeniesienia na aktualn� warstw�: "
  )
  (setq temp_selection (ssget))
  (command "_chprop" temp_selection "" "_layer" (getvar "clayer") "")
  (princ (strcat "\n "
		 (itoa (sslength temp_selection))
		 " obiekt�w przeniesiono na warstw� "
		 (getvar "clayer")
		 ". "
	 )
  )
  (princ)
)
