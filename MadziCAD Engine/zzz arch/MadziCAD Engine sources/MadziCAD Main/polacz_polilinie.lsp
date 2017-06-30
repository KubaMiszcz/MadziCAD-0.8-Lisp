(defun c:polacz_polilinie (/ peditacceptprev temp_selection temp_selection2)
  (defun *error* (errorlevel)
    (setvar "peditaccept" peditacceptprev)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (setq peditacceptprev (getvar "peditaccept"))
  (setvar "peditaccept" 1)

  (princ
    "\n Wybierz �r�d�ow� polilini�/lini�/�uk (lub polilinie/linie/�uki do po��czenia): "
  )
  (setq temp_selection (ssget))
  (if (= (sslength temp_selection) 1)
    (progn
      (princ "\n Wybierz pozosta�e polilinie lub [ENTER]: ")
      (setq temp_selection2 (ssget))
      (if (/= temp_selection2 nil)
	(progn
	  (command "_pedit" temp_selection "_join" temp_selection2 "" "")
	  (princ (strcat "\nPo��czono "
			 (itoa (+ (sslength (ssget "_p")) 1))
			 " obiekt�w. "
		 )
	  )
	)
	(progn
	  (command "_pedit" temp_selection "")
	  (princ (strcat "\nZmieniono lini� w polilini�. "))

	)
      )
    )
    (progn
      (command "_pedit"	"_multiple" temp_selection "" "_join" "" "")
      (princ (strcat "\nPo��czono "
		     (itoa (sslength temp_selection))
		     " obiekt�w. "
	     )
      )
    )
  )

  (setvar "peditaccept" peditacceptprev)
  (princ)
)