;;;przygotowuje modul mosty zelbetowe do dzialania i ustawia potzrebne zmienne
(vl-load-reactors)
(regapp "MADZICAD_XDATA")		; rejestracaja madzicad do XDATA
(setvar "fielddisplay" 0)		; to to wywala "regenaracja modelu"

;;;towrzenie slownika do listy ellementow i pretow ale to juz w lementach
(if (= (dictsearch (namedobjdict) "madzicad_dictionary") nil)
  (dictadd (namedobjdict)
	   "madzicad_dictionary"
	   (entmakex
	     (list '(0 . "DICTIONARY") '(100 . "AcDbDictionary"))
	   )
  )
)
					;nazwa entycji slwonika madzicada
(setq madzicad_dict
       (cdar (dictsearch (namedobjdict) "madzicad_dictionary"))
)

;;;twortzenie pierwszego elementu "bez nazwy"
(dictadd madzicad_dict
	 "BEZ NAZWY"
	 (entmakex
	   (append (list '(0 . "XRECORD") '(100 . "AcDbXrecord"))
		   (list (cons 1 "Bez nazwy")
			 (cons 1 "B-30")
			 (cons 1 "0.0")
			 (cons 1 "1")
			 (cons 1 "PRETY")
		   )
	   )
	 )
)


;;;towrzenei zmiennej z lista nazw elementow zeby szybciej sobei je znajdowac w prysszlosci od razu po nazwie
(setq madzicad_LISTA_ELEMENTOW '())
(foreach item (entget madzicad_dict)
  (if (eq 3 (car item))
    (setq madzicad_LISTA_ELEMENTOW
	   (cons (cdr item)
		 madzicad_LISTA_ELEMENTOW
	   )
    )
  )
)

(setq madzicad_LISTA_ELEMENTOW (reverse madzicad_LISTA_ELEMENTOW))

