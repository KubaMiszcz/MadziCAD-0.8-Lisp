(defun c:convert_to_uppercase(/ temp_selection n sslist entlist new_text)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (princ "\n Wska¿ tekst lub teksty do zamiany z ma³ych liter na du¿e: ")
  (setq temp_selection (ssget))
  (selection_to_list temp_selection)
  (setq n 0)
  (foreach item sslist 
    (progn 
      (setq entlist (entget item))
      (if (or (= (cdr (assoc 0 entlist)) "TEXT") (= (cdr (assoc 0 entlist)) "MTEXT"))
        (progn
          (setq new_text (strcase(cdr (assoc 1 entlist))))
          (setq entlist
            (subst 
              (cons 1 new_text) 
              (assoc 1 entlist) 
              entlist
            )
          )
        (entmod entlist)
        (setq n (1+ n))
        )
      )
    )
  )
  (princ (strcat " " (rtos n)  " obiekty tekstowe przekonwertowano na du¿e litery. "))
  (princ)
)