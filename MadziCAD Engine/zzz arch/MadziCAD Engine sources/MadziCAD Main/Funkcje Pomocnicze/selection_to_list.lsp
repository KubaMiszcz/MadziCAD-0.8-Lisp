;;funkcja zamienia zaznaczenie na liste

(defun Selection_To_List (ss / sscnt)
  (setq sscnt 0)
  (setq sslist nil)
  (repeat (sslength ss)
    (setq sslist (cons (ssname ss sscnt) sslist))
    (setq sscnt (1+ sscnt))
  )
  (princ)
)