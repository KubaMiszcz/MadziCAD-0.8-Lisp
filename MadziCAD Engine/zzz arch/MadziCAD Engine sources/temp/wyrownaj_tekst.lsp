(defun c:wyrownaj_tekst()
  (graphscr)
  (initget 0 "L P")
  (setq a (getkword "\nWyrównanie [L-do lewej/P-do prawej]:"))
  (if (= a "L")
      (progn			;wyrownywanie do lewej
        (princ "\nWska¿ pierwszy tekst:")
        (setq bazatxt (cdr (assoc 10 (entget (ssname (ssget "_:S") 0)))))
        (princ "\nWska¿ teksty do wyrównania:")
        (setq ss (ssget))
        (setq n (sslength ss))
        (selection_to_list ss)
        (repeat n
          (setq n (- n 1))



          (setq temp_entlist (entget (nth n sslist)))
          (command "_mtext" bazatxt "w" "dl" "k" wysokosc bazatxt tresc "")
          (command "_matchprop" (nth n sslist) (ssget "_L") "")
          (command "_erase" (nth n sslist) "")
        )

      )
      (progn			;wyrownywanie do prawej




      )
  )
)
koniec

  (setq ss (ssget))
  (setq n (sslength ss))
  (selection_to_list ss)

  (repeat n
    (setq n (- n 1))
    (setq temp_entlist (entget (nth n sslist)))
    (setq dtext_flag (cdr (assoc 0 temp_entlist)))
    (if (= dtext_flag "TEXT")
        (progn
          (setq bazatxt (cdr (assoc 10 temp_entlist)))
          (setq wysokosc (cdr (assoc 40 temp_entlist)))
          (setq tresc (cdr (assoc 1 temp_entlist)))	
          (command "_mtext" bazatxt "w" "dl" "k" wysokosc bazatxt tresc "")
          (command "_matchprop" (nth n sslist) (ssget "_L") "")
          (command "_erase" (nth n sslist) "")
        )
        ()
    )
  )
)