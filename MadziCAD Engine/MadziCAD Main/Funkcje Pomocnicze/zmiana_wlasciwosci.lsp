(defun zmiana_wlasciwosci (zaznaczenie numer_wlasciwosci nowa_wartosc / entlist)
  (setq entlist (entget (ssname zaznaczenie 0)))
  (setq entlist
    (subst 
      (cons numer_wlasciwosci nowa_wartosc) 
      (assoc numer_wlasciwosci entlist) 
      entlist
    )
  )
 (entmod entlist)
 (princ)
)

