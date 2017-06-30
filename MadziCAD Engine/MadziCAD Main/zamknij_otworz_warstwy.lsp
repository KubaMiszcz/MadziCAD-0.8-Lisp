(defun c:zamknij_otworz_warstwy(/ layer layerstatus)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (if 
    (= command_ZOW_status 0) 
    (progn
      (princ "\n Wska¿ obiekt którego warstwa ma pozostaæ bez zmian: ")
      (setq layer (cdr (assoc 8 (entget ( car (entsel))))))
      (setq layerstatus (cdr (assoc 70 (tblsearch "layer" layer))))
      (if 
        (= layerstatus 0) 				;0-warstwa otwarta
        (progn
          (command "_Layer" "m" "*" "") 
          (command "_Layer" "a" layer "")
          (princ (strcat "\n Zamkniêto wszystkie warstwy oprócz \"" layer "\". "))
          (setq command_ZOW_status 1)
        )
      )
      (if 
        (= layerstatus 4) 				;4-warstwa zamknieta
        (progn
          (command "_Layer" "a" "*" "")
          (command "_Layer" "m" layer "")
          (princ (strcat "\n Otwarto wszystkie warstwy oprócz \"" layer "\". "))
          (setq command_ZOW_status 1)
        )
      )
    )
    (progn
      (command "_Layer" "a" "*" "")
      (princ "\n Otwarto wszystkie warstwy. ")
      (setq command_ZOW_status 0)
    )
  )
  (princ)
)