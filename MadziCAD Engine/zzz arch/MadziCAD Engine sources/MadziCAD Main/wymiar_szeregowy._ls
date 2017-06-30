(defun C:wymiar_szeregowy(/ layerprev temp_selection pt1 pt2 begin_pt)
  (defun *error* (errorlevel)
    (command "_layer" "u" layerprev "")			;zmienia na poprz warstwe
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq layerprev (getvar "clayer"))			;zapamietuje biezaca warstwe
  (if (/= (tblsearch "layer" warwym) nil)
    (setvar "clayer" warwym)          			;ustala akt warstwe na 'wymiary'
  )
  (princ "\n Wska¿ wymiar pocz¹tkowy (lub ENTER aby wybraæ pocz¹tkowo utowrzony): ")
  (setq temp_selection (ssget "_:S"))
  
  (if (= temp_selection nil)
    (setq temp_selection (ssget "_L"))
  )
  
  (setq begin_pt (cdr (assoc 10 (entget (ssname temp_selection 0)))))   ;w GUW
  (setq begin_pt (trans begin_pt 0 1))
  (setq pt1 (cdr (assoc 13 (entget (ssname temp_selection 0)))))
  (setq pt1 (trans pt1 0 1))
  (setq pt2 (cdr (assoc 14 (entget (ssname temp_selection 0)))))
  (setq pt2 (trans pt2 0 1))

  (command "_ucs" "_new" "_3" begin_pt pt2 "")
  (command "_ucs" "_z" -90)

  (defun *error* (errorlevel)
    (setvar "clayer" layerprev)			;zmienia na poprz warstwe
    (command "_ucs" "_previous")
    (command "_ucs" "_previous")
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  
  (setq begin_pt (cdr (assoc 10 (entget (ssname temp_selection 0)))))   ;w GUW
  (setq begin_pt (trans begin_pt 0 1))
  (setq pt1 (cdr (assoc 14 (entget (ssname temp_selection 0)))))
  (setq pt1 (trans pt1 0 1))
  
  (command "_dimlinear" 
    pt1
    (getpoint "\n Wska¿ kolejny punkt: " begin_pt)
    begin_pt
  )
  
  (setq begin_pt (cdr (assoc 10 (entget (entlast)))))   ;w GUW
  (setq begin_pt (trans begin_pt 0 1))
  (setq pt1 (cdr (assoc 14 (entget (entlast)))))
  (setq pt1 (trans pt1 0 1))
  (setq pt2 (getpoint "\n Wska¿ kolejny punkt: " begin_pt))
  
  (while (/= pt2 nil) 
    (command "_dimlinear" 
      pt1
      pt2
      begin_pt
    )
    (setq begin_pt (cdr (assoc 10 (entget (entlast)))))   ;w GUW
    (setq begin_pt (trans begin_pt 0 1))
    (setq pt1 (cdr (assoc 14 (entget (entlast)))))
    (setq pt1 (trans pt1 0 1))
    (setq pt2 (getpoint "\n Wska¿ kolejny punkt: " begin_pt))
  )

  (command "_ucs" "_previous")
  (command "_ucs" "_previous")
  (setvar "clayer" layerprev)			;zmienia na poprz warstwe
  (princ )
)