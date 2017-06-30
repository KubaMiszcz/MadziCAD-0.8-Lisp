(defun c:zamknij_otworz_warstwe_obiektu(/ layer layerstatus)
  (princ "\n Wska� obiekt kt�rego warstwa ma zosta� zamkni�ta/otwarta: ")
  (setq temp_selection (ssget "_:S"))
  (setq layer (cdr (assoc 8 (entget (ssname temp_selection 0)))))
  (setq layerstatus (cdr (assoc 70 (tblsearch "layer" layer))))
  (if 
    (= layerstatus 0)         ;0-otwarta 4-zamknieta
    (progn 
      (command "_Layer" "_lock" layer "")  
      (princ (strcat "\n Zamkni�to warstw� \"" layer "\". "))
    )    
  )
  (if 
    (= layerstatus 4) 
    (progn
      (command "_Layer" "_unlock" layer "")
      (princ (strcat "\n Otwarto warstw� \"" layer "\". "))
    )
  )
  (princ)
)