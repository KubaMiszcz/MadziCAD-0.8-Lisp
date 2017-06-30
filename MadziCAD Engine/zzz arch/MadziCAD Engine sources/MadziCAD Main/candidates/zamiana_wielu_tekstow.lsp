(defun c:ss ;;zamiana_wielu_tekstow
			       (/ temp_selection nowy_tekst userclicked)
  (princ "\n Wybierz teksty do zamiany: ")
  (setq temp_selection (ssget))

  (setq userclicked nil)

  (setq	dcl_id (load_dialog
		 (strcat path "\\DCL\\zamiana_wielu_tekstow.dcl")
	       )
  )

  (new_dialog "zamiana_wielu_tekstow" dcl_id)
					;(action_tile "nowy_tekst_wymiarowy" "(setq nowy_tekst $value userclicked T)")

  (action_tile
    "accept"
    "(setq nowy_tekst (get_tile \"nowy_tekst\") userclicked T)(DONE_DIALOG)"
  )

  (action_tile
    "cancel"
    "(setq userclicked nil)(DONE_DIALOG)"
  )



  (start_dialog)			; Display the dialog 
  (unload_dialog dcl_id)		; Unload the DCL file.

  (if (= userclicked T)
    (progn
      (selection_to_list temp_selection)
      (foreach item sslist
	(progn
	  (setq entlist (entget item))
	  (setq	entlist
		 (subst
		   (cons 1 nowy_tekst)
		   (assoc 1 entlist)
		   entlist
		 )
	  )
	  (entmod entlist)
	)
	(princ "\n Teksty zamieniono. ")
      )
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


