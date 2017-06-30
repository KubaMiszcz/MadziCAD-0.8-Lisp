(defun c:przenies_na_aktualna_warstwe(/ layerprev temp_selection pri_obj pri_layer n entlist)
  (defun *error* (errorlevel)
  (setvar "clayer" layerprev)			;zmienia na poprz warstwe
  (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq layerprev (getvar "clayer"))			;zapamietuje biezaca warstwe
  (princ "\n Wska¿ obiekt lub obiekty do przeniesienia na inn¹ warstwê: ")
  (command "_select" pause)
  (setq temp_selection (ssget "_P"))
  (princ "\n Wska¿ obiekt na warstwie na któr¹ przenieœæ zaznaczone obiekty: ")
  (setq pri_obj (ssget "_:S"))
  (if (= pri_obj nil)
      (setq pri_layer (getvar "clayer"))
      (setq pri_layer (cdr(assoc 8(entget (ssname pri_obj 0)))))
  )
  (selection_to_list temp_selection)
  (setq n (length sslist))
  (repeat n
    (setq n (- n 1))
    (setq entlist (entget (nth n sslist)))
    (setq entlist
      (subst 
        (cons 8 pri_layer) 
        (assoc 8 entlist) 
        entlist
      )
    )
    (entmod entlist)
  )
  (princ (strcat "\n "(rtos (length sslist))" obiektów przeniesiono na warstwê " pri_layer ". "))
  (setvar "clayer" layerprev)			;zmienia na poprz warstwe
  (princ)
)
