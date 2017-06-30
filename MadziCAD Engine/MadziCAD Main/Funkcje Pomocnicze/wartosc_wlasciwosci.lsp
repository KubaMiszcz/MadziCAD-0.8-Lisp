(defun wartosc_wlasciwosci(zaznaczenie numer_wlasciwosci)
  (setq wlasciwosc 
    (cdr (assoc numer_wlasciwosci (entget (ssname zaznaczenie 0))))
  )
  (princ)
)

;(cdr (assoc 62 (entget (ssname (ssget "_:S") 0))))

