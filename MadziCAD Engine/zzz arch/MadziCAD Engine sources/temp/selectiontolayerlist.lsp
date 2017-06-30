;;funkcja zamienia zaznaczenie na liste

(defun SLay (ss / sscnt)
 (setq sscnt 0 sslist nil)
 (repeat (sslength ss)
  (setq sslist (cons (ssname ss sscnt) sslist))
  (setq sscnt (1+ sscnt))
 )
 (princ)
)

;(cdr (assoc 8 (entget ( car (entsel)))))

;(ssname ss sscnt)