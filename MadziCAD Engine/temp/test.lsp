(defun SelectionToList (ss / sscnt)
 (setq sscnt 0 sslist nil)
 (repeat (sslength ss)
  (setq sslist (cons (ssname ss sscnt) sslist))
  (setq sscnt (1+ sscnt))
 )
 (princ)
)