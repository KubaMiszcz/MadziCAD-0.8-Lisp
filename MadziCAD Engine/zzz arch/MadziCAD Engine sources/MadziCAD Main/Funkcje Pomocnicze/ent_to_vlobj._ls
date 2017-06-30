;szybka zmiana z entycji lub zaznaczenia na VLAOBJ
(defun en->vl (zaznaczenie / entlist)
  (if (= (listp zaznaczenie) nil)
    (setq entlist (entget (ssname zaznaczenie 0)))
    (setq entlist zaznaczenie)
  )
  (setq vlaobj (vlax-ename->vla-object (cdr(assoc -1 ent))))
)