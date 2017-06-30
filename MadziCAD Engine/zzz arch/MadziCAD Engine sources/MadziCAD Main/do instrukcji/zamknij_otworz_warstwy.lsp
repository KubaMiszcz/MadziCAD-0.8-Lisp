(defun c:zamknij_otworz_warstwy	(/ layer layerstatus temp_selection)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (if
    (= layerproplistZOW nil)
     (progn
       (princ
	 "\n Wska¿ obiekt(y) którego warstwa ma pozostaæ bez zmian: "
       )
       (setq temp_selection (ssget "_:S"))

       
       (setq layer (cdr (assoc 8 (entget (ssname temp_selection 0)))))
       (setq layerstatus (cdr (assoc 70 (tblsearch "layer" layer))))


       (setq layerprop (tblnext "layer" t))
       (while (/= layerprop nil)
	 (progn
	   (setq layerproplistZOW
		  (cons	(list (cdr (assoc 2 layerprop))
			      (cdr (assoc 70 layerprop))

			)
			layerproplistZOW
		  )
	   )
	   (setq layerprop (tblnext "layer"))
				
	 )
       )


       
       (if
	 (= layerstatus 0)		;0-warstwa otwarta
	  (progn
	    (command "_Layer" "_lock" "*" "")
	    (command "_Layer" "_unlock" layer "")
	    (princ (strcat "\n Zamkniêto wszystkie warstwy oprócz \""
			   layer
			   "\". "
		   )
	    )
	  )
       )
       (if
	 (= layerstatus 4)		;4-warstwa zamknieta
	  (progn
	    (command "_Layer" "_unlock" "*" "")
	    (command "_Layer" "_lock" layer "")
	    (princ (strcat "\n Otwarto wszystkie warstwy oprócz \""
			   layer
			   "\". "
		   )
	    )
	  )
       )
     )

    


    (progn
       (foreach	item layerproplistZOW
	 (progn
	   (setq layerprop (entget (tblobjname "layer" (car item))))
	   (setq layerprop (subst (cons 70 (cadr item)) (assoc 70 layerprop) layerprop))
	   (entmod layerprop)
	 )
       )
					;(command "_Layer" "_on" "*" "")
       (princ "\n Przywrócono poprzedni stan warstw. ")
       (setq layerproplistZOW nil)
     )
  )
  (princ)
)