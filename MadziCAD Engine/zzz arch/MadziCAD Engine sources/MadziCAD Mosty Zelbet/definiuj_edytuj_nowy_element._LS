(defun c:definiuj_edytuj_nowy_element ()

  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana ")
  )

;;;  (princ "\n Wska¿ poliliniê z której utworzyæ nowy prêt: ")
;;;  (setq temp_selection (ssget "_:S"))
;;;  (setq ent (entget (ssname temp_selection 0) '("*")))

					;wczytanie okienka
  (setq
    dcl_id (load_dialog
	     (strcat path "\\DCL\\definiuj_edytuj_nowy_element.dcl")
	   )
  )					; Load the DCL file.
  (if (not (new_dialog "definiuj_edytuj_nowy_element" dcl_id))
					; Initialize the dialog.
    (exit)				; Exit if this doesn't work.
  )

;;;;definioawnie popup list
  (setq klasa_betonu '("B-20" "B-30" "B-35" "B-40"))
  (start_list "klasa_betonu")
  (mapcar 'add_list klasa_betonu)
  (end_list)


;;;  zapelnianie listboxow
;;;ladowanie listy elementow
  (start_list "lista_elementow")
  (mapcar 'add_list madzicad_lista_elementow)
  (end_list)

  ;;tworzenie listy z klasami betonow
  (setq temp_list '())
  (foreach item	madzicad_lista_elementow
    (setq
      temp_list	(cons (cdr (nth 10 (dictsearch madzicad_dict item)))
		      temp_list
		)
    )
  )
  (start_list "lista_klasa_betonu")
  (mapcar 'add_list temp_list)
  (end_list)



  ;;tworzenie listy z V betonow  
  (setq temp_list '())
  (foreach item	madzicad_lista_elementow
    (setq
      temp_list	(cons (cdr (nth 11 (dictsearch madzicad_dict item)))
		      temp_list
		)
    )
  )
  (start_list "lista_V_betonu")
  (mapcar 'add_list temp_list)
  (end_list)


  ;;tworzenie listy z liczbami elementow  
  (setq temp_list '())
  (foreach item	madzicad_lista_elementow
    (setq
      temp_list	(cons (cdr (nth 12 (dictsearch madzicad_dict item)))
		      temp_list
		)
    )
  )
  (start_list "lista_liczba_elementow")
  (mapcar 'add_list temp_list)
  (end_list)


;;;nizej zebranie danych z okienka
  (action_tile
    "dodaj"
    "(dictadd madzicad_dict
	 (get_tile \"nazwa_elementu\")
	 (entmakex
	   (append (list '(0 . \"XRECORD\") '(100 . \"AcDbXrecord\"))
		   (list (cons 1 (get_tile \"nazwa_elementu\"))
			 (cons 1 (nth (atoi (get_tile \"klasa_betonu\")) klasa_betonu))
			 (cons 1 (get_tile \"V_betonu\"))
			 (cons 1 (get_tile \"liczba_elementow\"))
			 (cons 1 \"PRETY\")
		   )
	   )
	 )
)
  (princ
    (strcat \"\n Utworzono nowy element : \" (get_tile \"nazwa_elementu\") \" . \")
  )
  (alert
    (strcat \"\n Utworzono nowy element : \" (get_tile \"nazwa_elementu\") \" . \")
  )
    (done_dialog)"
  )

  (action_tile "anuluj" "(princ \"\n Anulowano.\")")


  (start_dialog)			; Display the dialog  box.
  (unload_dialog dcl_id)		; Unload the DCL file.

;;;towrzenei zmiennej z lista nazw elementow zeby szybciej sobei je znajdowac w prysszlosci od razu po nazwie
  (setq madzicad_LISTA_ELEMENTOW '())
  (foreach item	(entget madzicad_dict)
    (if	(eq 3 (car item))
      (setq madzicad_LISTA_ELEMENTOW
	     (cons (cdr item)
		   madzicad_LISTA_ELEMENTOW
	     )
      )
    )
  )
  (setq madzicad_LISTA_ELEMENTOW (reverse madzicad_LISTA_ELEMENTOW))

;;;odczyt XDATA
;;;(entget (car (entsel)) '("ACAD"))

  (princ)
)

