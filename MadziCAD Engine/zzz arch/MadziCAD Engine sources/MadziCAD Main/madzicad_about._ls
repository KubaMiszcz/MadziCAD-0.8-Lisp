(defun c:madzicad_about ()

  (setq	dcl_id (load_dialog
		 (strcat path "\\DCL\\madzicad_about.dcl")
	       )
  )
  (new_dialog "madzicad_about" dcl_id)
  (start_dialog)			; Display the dialog 
  (unload_dialog dcl_id)		; Unload the DCL file.
  (princ)
)