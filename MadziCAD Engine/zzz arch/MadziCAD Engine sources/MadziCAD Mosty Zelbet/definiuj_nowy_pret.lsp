(defun c:definiuj_nowy_pret (/		      temp_selection
			     dcl_id	      lista_elementow
			     lista_srednic    lista_klas_stali
			     vlaobj	      nazwa_elementu
			     numer_preta      klasa_stali
			     opis_stali	      xdata_list
			     ent
			    )		;tworzenie preta
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana ")
  )

  (princ "\n Wska¿ poliliniê z której utworzyæ nowy prêt: ")
  (setq temp_selection (ssget "_:S"))
  (setq ent (entget (ssname temp_selection 0) '("*")))

					;wczytanie okienka
  (setq
    dcl_id (load_dialog (strcat path "\\DCL\\definiuj_nowy_pret.dcl"))
  )					; Load the DCL file.
  (if (not (new_dialog "definiuj_nowy_pret" dcl_id))
					; Initialize the dialog.
    (exit)				; Exit if this doesn't work.
  )

					;definioawnie popup list

					;caly slwonik razem ze smieciami pozniej robienie listy tylko z assoc 3 cyzli nazwy elementow



  (start_list "lista_elementow")
  (mapcar 'add_list madzicad_lista_elementow)
					;Specify the AutoLISP list.
  (end_list)


  (setq	lista_srednic
	 '("4"	  "6"	 "8"	"10"   "12"   "14"   "16"   "18"
	   "20"	  "22"	 "24"	"26"   "28"   "30"   "32"   "34"
	   "36"	  "38"	 "40"
	  )
  )
  (start_list "lista_srednic")
  (mapcar 'add_list lista_srednic)	;Specify the AutoLISP list.
  (end_list)


  (setq lista_klas_stali '("A-I" "A-II" "A-III" "A-IIIN"))
  (start_list "lista_klas_stali")
  (mapcar 'add_list lista_klas_stali)	;Specify the AutoLISP list.
  (end_list)

					;========================
					;tutaj moze dorobic zeby sie srednica sama ustawiala na szerokosc polilinii lub najblizsza jej typu 12 14 16 itp a jesli grub 0 to to na 12mm
					;========================



					;nizej zebranie danych z okienka
					;zmiana grubosci polilnii na srednice

  (action_tile
    "dodaj"


    "(setq	nazwa_elementu
	 (nth (atoi (get_tile \"lista_elementow\"))
	      lista_elementow
	 )
  )
  (setq numer_preta (get_tile \"numer_preta\"))
  (setq	srednica_preta
	 (nth (atoi (get_tile \"lista_srednic\"))
	      lista_srednic
	 )
  )
  (setq	klasa_stali
	 (nth (atoi (get_tile \"lista_klas_stali\"))
	      lista_klas_stali
	 )
  )
  (setq opis_stali (get_tile \"opis_stali\"))

  (setq vlaobj (vlax-ename->vla-object (cdr (assoc -1 ent))))
  (vlax-put-property
    vlaobj
    'constantwidth
    (atof srednica_preta)
  )

  (setq	xdata_list
	 (list (list -3
		     (list \"MADZICAD_XDATA\"
			   (cons 1000 nazwa_elementu)
			   (cons 1000 numer_preta)
			   (cons 1000 klasa_stali)
			   (cons 1000 opis_stali)
		     )
	       )
	 )
  )

  (setq ent (append ent xdata_list))
  (entmod ent)
  (princ
    (strcat \"\n Utworzono prêt numer: \" numer_preta \" . \")
  )
  (alert
    (strcat \"\n Utworzono prêt numer: \" numer_preta \" . \")
  )
    (done_dialog)"
  )

  (action_tile "cancel" "(princ \"\n Anulowano.\")")

  (start_dialog)			; Display the dialog  box.
  (unload_dialog dcl_id)		; Unload the DCL file.

;;;odczyt XDATA
;;;(entget (car (entsel)) '("ACAD"))

  (princ)
)


