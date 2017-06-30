(defun c:maski_off (/ temp_selection n n2 sslist entlist dim_last dim_style_name)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  ;wylaczanie masek w tekstach
  (setq temp_selection (ssget "_X" '((0 . "MTEXT"))))
  (selection_to_list temp_selection)
  (setq n 0)
  (foreach item sslist 
    (progn 
      (setq entlist (entget item))
      (setq entlist
        (subst 
          (cons 90 2) 
          (assoc 90 entlist) 
          entlist
        )
      )
      (entmod entlist)
      (setq n (1+ n))
    )
  )
; wylaczanie masek w stylach wymiarowania
  (setq dim_last (getvar "dimstyle"))
  (setq dim_style_name (cdr (assoc 2 (tblnext "dimstyle" t))))
  (command "_dimstyle" "_restore" dim_style_name)
  (setvar "dimtfill" 0)
  (command "_dimstyle" "_save" dim_style_name "_yes")
  (setq n2 1)
  (while (/= dim_style_name nil)
    (setq dim_style_name (cdr (assoc 2 (tblnext "dimstyle"))))
    (command "_dimstyle" "_restore" dim_style_name)
    (setvar "dimtfill" 0)
    (command "_dimstyle" "_save" dim_style_name "_yes")
    (setq n2 (1+ n2))
  )
  (command "_dimstyle" "_restore" dim_last)
  (alert (strcat " MadziCAD: Maski w tekstach i stylach wymiarowania usuniete. "))
    
  (princ)
)