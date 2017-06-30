(defun c:zamknij_otworz_warstwe_obiektu(/ layer layerstatus)
  (princ "\n Wska¿ obiekt którego warstwa ma zostaæ zamkniêta/otwarta: ")
  (setq layer (cdr (assoc 8 (entget ( car (entsel))))))
  (setq layerstatus (cdr (assoc 70 (tblsearch "layer" layer))))
  (if 
    (= layerstatus 0)         ;0-otwarta 4-zamknieta
    (command "_Layer" "m" layer "")  
  )
  (if 
    (= layerstatus 4) 
    (command "_Layer" "a" layer "")
  )
  (princ)
)