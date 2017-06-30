(defun c:zmiana_nazwy_bloku (/ oldname ename	newname	blkrecord temp_selection nowy_tekst userclicked)


  (princ "\n Wska¿ blok o zmienianej nazwie: ")
  (setq temp_selection (ssget "_:S"))
  (setq oldname (cdr (assoc 2 (entget (ssname temp_selection 0)))))

  (setq userclicked nil)

  (setq	dcl_id (load_dialog
		 (strcat path "\\DCL\\zmiana_nazwy_bloku.dcl")
	       )
  )



  (new_dialog "zmiana_nazwy_bloku" dcl_id)

  (set_tile "oldname" oldname)
  
  (action_tile
    "accept"
    "(setq newname (get_tile \"newname\") userclicked T)(DONE_DIALOG)"
  )

  (action_tile
    "cancel"
    "(setq userclicked nil)(DONE_DIALOG)"
  )



  (start_dialog)			; Display the dialog 
  (unload_dialog dcl_id)		; Unload the DCL file.


  (if (= userclicked T)
    (progn
      (setq ename (tblobjname "block" oldname))
      (if newname
	(progn
	  (setq blkrecord (entget (cdr (assoc 330 (entget ename)))))
	  (entmod
	    (subst (cons 2 newname) (assoc 2 blkrecord) blkrecord)
	  )
	)
      )
      (princ (strcat "\n Zmieniono nazwê bloku z \"" oldname "\" na \""	newname	"\".")
      )
      (princ)
    )
    (princ "\n Anulowano. ")
  )
  (princ)
)
