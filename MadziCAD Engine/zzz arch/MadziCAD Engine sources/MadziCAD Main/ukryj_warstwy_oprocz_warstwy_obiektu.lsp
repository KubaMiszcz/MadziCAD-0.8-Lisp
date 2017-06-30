(defun c:ukryj_warstwy_oprocz_warstwy_obiektu (/ layer temp_selection layerprop message)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana ")
  )



  (if
    (= layerproplistUWOWO nil)
     (progn
       (princ
	 "\n Wska¿ obiekt(y) których warstwy maj¹ pozostaæ odkryte: "
       )
       (setq temp_selection (ssget))
       (selection_to_list temp_selection)

       (setq layerprop (tblnext "layer" t))
       (while (/= layerprop nil)
	 (progn
	   (setq layerproplistUWOWO
		  (cons	(list (cdr (assoc 2 layerprop))
			      (cdr (assoc 62 layerprop))

			)
			layerproplistUWOWO
		  )
	   )
	   (setq layerprop (tblnext "layer"))
					;(setq end_flag (car (car layerproplistUWOWO)))
	 )
       )
       (command "_Layer" "_off" "*" "_yes" "")
       (setq message (strcat "\n Ukryto wszystkie warstwy oprócz "))
       (foreach	item sslist
	 (progn
	   (setq layer (cdr (assoc 8 (entget item))))
	   (command "_Layer" "_on" layer "")
	   (setq message (strcat message
				 "\""
				 layer
				 "\" "
			 )
	   )
	 )
       )
       (princ (strcat message " ."))
     )





     (progn
       (foreach	item layerproplistUWOWO
	 (progn
	   (setq layerprop (entget (tblobjname "layer" (car item))))
	   (setq layerprop (subst (cons 62 (cadr item)) (assoc 62 layerprop) layerprop))
	   (entmod layerprop)
	 )
       )


					;(command "_Layer" "_on" "*" "")
       (setq layerproplistUWOWO nil)
       (princ "\n Przywrócono poprzedni stan warstw. ")
     )
  )
  (princ)
)