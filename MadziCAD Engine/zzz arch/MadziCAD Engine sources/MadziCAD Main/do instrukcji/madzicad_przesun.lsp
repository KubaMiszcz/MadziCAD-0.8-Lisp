(defun c:madzicad_przesun ()		;/ temp_selection base_pt ent_table sslist n dimension_flag dimension_check target_pt dx dy)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq temp_selection (ssget))
  (setq base_pt (cdr (assoc 10 (entget (ssname temp_selection 0)))))
  (selection_to_list temp_selection)

  (setq n 0)
  (setq ent_table nil)
  (repeat (length sslist)
    (setq ent_table (cons (entget (nth n sslist)) ent_table))
    (setq n (1+ n))
  )
  (setq ent_table (reverse ent_table))

  (setq dimension_flag 1)
  (setq n 0)
  (repeat (length sslist)
    (setq dimension_check (cdr (assoc 0 (entget (nth n sslist)))))
    (if
      (/= dimension_check "DIMENSION")
       (setq dimension_flag 0)
    )
    (setq n (1+ n))
  )

  (command "_move"
	   temp_selection
	   ""
	   (progn
	     (getpoint "\n Wska¿ punkt bazowy: ")
	     (princ "\n Wska¿ punkt docelowy: ")
	   )
	   pause
  )

  (setq n 0)
  (if
    (= dimension_flag 1)		;jesli sa wymiary:
     (progn
       (foreach	item sslist
	 (progn
	   (if (= (cdr (assoc 100 (reverse (entget item))))
		  "AcDbOrdinateDimension"
	       )
	     (progn
	       (setq entlist (entget item))
	       (setq entlist
		      (subst
			(cons 10 (cdr (assoc 10 (nth n ent_table))))
			(assoc 10 entlist)
			entlist
		      )
	       )
	       (entmod entlist)
	       (setq n (1+ n))
	     )
	   )
	   (if (or
		 (= (cdr (assoc 100 (reverse (entget item))))
		    "AcDbRotatedDimension"
		 )
		 (= (cdr (assoc 100 (reverse (entget item))))
		    "AcDbAlignedDimension"
		 )
	       )
	     (progn
	       (setq entlist (entget item))
	       (setq entlist
		      (subst
			(cons 13 (cdr (assoc 13 (nth n ent_table))))
			(assoc 13 entlist)
			entlist
		      )
	       )
	       (setq entlist
		      (subst
			(cons 14 (cdr (assoc 14 (nth n ent_table))))
			(assoc 14 entlist)
			entlist
		      )
	       )
	       (entmod entlist)
	       (setq n (1+ n))
	     )
	   )
	 )
       )
     )
  )

  (setq target_pt (cdr (assoc 10 (entget (ssname temp_selection 0)))))
  (setq dx (- (car target_pt) (car base_pt)))
  (setq dy (- (cadr target_pt) (cadr base_pt)))
  (princ (strcat " \n Przesuniêto obiekty o "
		 (rtos dx)
		 " jednostek w kierunku X, i o "
		 (rtos dy)
		 " jednostek w kierunku Y. "
	 )
  )
  (princ)
)















































(defun c:ssssssssss (/ temp_selection base_pt target_pt dx dy)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq temp_selection (ssget))
  (setq base_pt (cdr (assoc 10 (entget (ssname temp_selection 0)))))
  (command "_move"
	   temp_selection
	   ""
	   (progn
	     (getpoint "\n Wska¿ punkt bazowy: ")
	     (princ "\n Wska¿ punkt docelowy: ")
	   )
	   pause
  )
  (setq new_base_pt (cdr (assoc 10 (entget (ssname temp_selection 0)))))
  (setq dx (abs (- (car base_pt) (car new_base_pt))))
  (setq dy (abs (- (cadr base_pt) (cadr new_base_pt))))
  (princ (strcat " \n Przesuniêto obiekty o "
		 (rtos dx)
		 " jednostek w kierunku X, i o "
		 (rtos dy)
		 " jednostek w kierunku Y. "
	 )
  )
  (princ)
)

