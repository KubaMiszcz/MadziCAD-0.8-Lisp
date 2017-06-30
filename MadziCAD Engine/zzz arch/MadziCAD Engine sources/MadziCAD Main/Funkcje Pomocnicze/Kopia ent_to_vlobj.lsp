;szybka zmiana z entycji lub zaznaczenia na VLOBJ
(defun en->vl (zaznaczenie / entlist)
  (if (= (listp zaznaczenie) nil)
    (setq entlist (entget (ssname zaznaczenie 0)))
    (setq entlist zaznaczenie)
  )
  (setq vlobj (vlax-ename->vla-object (cdr(assoc -1 entlist))))
)