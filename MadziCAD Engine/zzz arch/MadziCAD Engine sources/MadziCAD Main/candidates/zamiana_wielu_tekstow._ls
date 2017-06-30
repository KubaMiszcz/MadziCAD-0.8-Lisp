(defun c:zmiana_tekstu_wymiarowego
       (/ temp_selection nowy_tekst userclicked)
  (princ "\n Wybierz wymiar z tekstem do zamiany: ")
  (setq temp_selection (ssget ":S"))

  (setq userclicked nil)
  (setq	tekst_wymiarowy
	 (cdr (assoc 1 (entget (ssname temp_selection 0))))
  )
  (setq	wartosc_wymiaru
	 (cdr (assoc 42 (entget (ssname temp_selection 0))))
  )

  (setq	dcl_id (load_dialog
		 (strcat path "\\DCL\\zmiana_tekstu_wymiarowego.dcl")
	       )
  )

  (new_dialog "zmiana_tekstu_wymiarowego" dcl_id)
					;(action_tile "nowy_tekst_wymiarowy" "(setq nowy_tekst $value userclicked T)")

  (set_tile "nowy_tekst_wymiarowy" tekst_wymiarowy)
  (set_tile "wartosc_wymiaru" (rtos wartosc_wymiaru))


  (action_tile
    "accept"
    "(setq nowy_tekst (get_tile \"nowy_tekst_wymiarowy\") userclicked T)(DONE_DIALOG)"
  )

  (action_tile
    "cancel"
    "(setq userclicked nil)(DONE_DIALOG)"
  )



  (start_dialog)			; Display the dialog 
  (unload_dialog dcl_id)		; Unload the DCL file.

  (if (= userclicked T)
    (progn
      (zmiana_wlasciwosci temp_selection 1 nowy_tekst)
      (princ "\n Tekst wymiarowy zmieniono. ")
    )
    (princ "\n Anulowano. ")
  )
  (princ)
)

(defun c:zmiana_tekstu_wymiarowego2 (/ temp_selection nowy_tekst)
  (princ "\n Wybierz wymiar z tekstem do zamiany: ")
  (setq temp_selection (ssget "_:S"))
  (setq nowy_tekst (getstring "\n Podaj nowy tekst wymiarowy: "))
  (zmiana_wlasciwosci temp_selection 1 nowy_tekst)
  (princ "\n Tekst wymiarowy zmieniono. ")
  (princ)
)


