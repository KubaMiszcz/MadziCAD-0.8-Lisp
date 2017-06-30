;czy prtet istnieje?

(defun czy_pret_istnieje (numer / name wszystkie_prety n opis_preta ent_opis_preta attag)
  (setq numer (rtos numer))
  (setq exist_flag nil)
  (setq name "none")
  (setq wszystkie_prety (ssget "_X" '((0 . "insert")(2 . "opis preta w widoku"))))
  (selection_to_list wszystkie_prety)
  (setq n (length sslist))  
  (repeat n
    (setq n (- n 1))
    (setq opis_preta (nth n sslist))
    (setq name (cdr (assoc 0 (entget opis_preta))))
    (while (not (equal name "SEQEND"))  ;szuka zagniezdzonych
      (setq ent_opis_preta (entget opis_preta))           ;entycja lista zgniezdzonego atrybutu
      (setq attag (cdr (assoc 2 ent_opis_preta)))
      (setq attag (strcase attag))
      (if (= attag "NUMER_PRETA") 
          (progn
            (if (= (cdr (assoc 1 ent_opis_preta)) numer)
                (setq exist_flag 1)
            )
          )
      )
      (setq opis_preta (entnext opis_preta))
      (setq name (cdr (assoc 0 (entget opis_preta))))
    )
  )
)