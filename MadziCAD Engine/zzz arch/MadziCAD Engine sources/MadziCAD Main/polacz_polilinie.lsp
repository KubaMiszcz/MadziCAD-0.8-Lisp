(defun c:polacz_polilinie (/ peditacceptprev temp_selection temp_selection2)
  (defun *error* (errorlevel)
    (setvar "peditaccept" peditacceptprev)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (setq peditacceptprev (getvar "peditaccept"))
  (setvar "peditaccept" 1)

  (princ
    "\n Wybierz Ÿród³ow¹ poliliniê/liniê/³uk (lub polilinie/linie/³uki do po³¹czenia): "
  )
  (setq temp_selection (ssget))
  (if (= (sslength temp_selection) 1)
    (progn
      (princ "\n Wybierz pozosta³e polilinie lub [ENTER]: ")
      (setq temp_selection2 (ssget))
      (if (/= temp_selection2 nil)
	(progn
	  (command "_pedit" temp_selection "_join" temp_selection2 "" "")
	  (princ (strcat "\nPo³¹czono "
			 (itoa (+ (sslength (ssget "_p")) 1))
			 " obiektów. "
		 )
	  )
	)
	(progn
	  (command "_pedit" temp_selection "")
	  (princ (strcat "\nZmieniono liniê w poliliniê. "))

	)
      )
    )
    (progn
      (command "_pedit"	"_multiple" temp_selection "" "_join" "" "")
      (princ (strcat "\nPo³¹czono "
		     (itoa (sslength temp_selection))
		     " obiektów. "
	     )
      )
    )
  )

  (setvar "peditaccept" peditacceptprev)
  (princ)
)