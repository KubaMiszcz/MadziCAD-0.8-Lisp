(defun c:przenies_obiekty_na_warstwe (/ pri_obj pri_layer temp_selection)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (princ
    "\n Wska� obiekt na warstwie na kt�r� przenie�� obiekty: "
  )
  (setq pri_obj (ssget "_:S"))
  (setq pri_layer (cdr (assoc 8 (entget (ssname pri_obj 0)))))
  (princ
    "\n Wska� obiekt lub obiekty do przeniesienia na inn� warstw�: "
  )
  (setq temp_selection (ssget))
  (command "_chprop" temp_selection "" "_layer" pri_layer "")
  (princ (strcat "\n "
		 (itoa (sslength temp_selection))
		 " obiekt�w przeniesiono na warstw� "
		 pri_layer
		 ". "
	 )
  )
  (princ)
)
