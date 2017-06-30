(defun c:sd()
  (setq blk (ssget "_X" '((0 . "insert")(2 . "opis preta w widoku"))))
  (setq ent (ssname blk 0))
  (setq name "none")
  (setq name (cdr (assoc 0 (entget ent))))
  (while (not (equal name "SEQEND"))  ;szuka zagniezdzonych
    (setq LST (entget ent))         ;entycja lista zgniezdzonego atrybutu
    (setq attag (cdr (assoc 2 LST)))
    (setq attag (strcase attag))
    (if (= attag "DLUGOSC_PRETA") 
        (setq VAL (CDR (assoc 1 LST)))     ;val zwraca wartosc
    )
    (setq ent (entnext ent))
    (setq name (cdr (assoc 0 (entget ent))))
  )
  (princ val)
)