(defun zmiana_wlasciwosci (zaznaczenie numer_wlasciwosci nowa_wartosc / entlist)
  (if (= (listp zaznaczenie) nil)
    (setq entlist (entget (ssname zaznaczenie 0)))
    (setq entlist zaznaczenie)
  )
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

;(setq ent (subst (cons 10 3000) (assoc 10 ent) ent))


; to cos nei zawsze dziala nie wiem czemu://
;zmiana wlasciwosci VLA
(defun put_property (zaznaczenie nazwa_wlasciwosci nowa_wartosc / entlist)
  (if (= (listp zaznaczenie) nil)
    (setq entlist (entget (ssname zaznaczenie 0)))
    (setq entlist zaznaczenie)
  )
  
  (setq vlaobj (vlax-ename->vla-object (cdr(assoc -1 ent))))
  (princ vlaobj)
  (vlax-put-property vlaobj nazwa_wlasciwosci nowa_wartosc)
  (princ)

)

