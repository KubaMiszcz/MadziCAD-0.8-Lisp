(defun c:purge_unused_groups (/ cdrs dct ent del)
; Copyright (c) 2000 Michael Puckett
; All Rights Reserved
  (defun cdrs (key lst / pair rtn)
    (reverse
      (progn
	(while (setq pair (assoc key lst))
	  (setq
	    rtn	(cons (cdr pair) rtn)
	    lst	(cdr (member pair lst))
	  )
	)
	rtn
      )
    )
  )
  (setq	dct (dictsearch (namedobjdict) "acad_group")
	ent (cdr (assoc -1 dct))
  )
  (foreach x (cdrs 3 dct)
    (if	(null (cdrs 340 (dictsearch ent x)))
      (progn
	(setq del (cons x del))
	(entdel (dictremove ent x))
      )
    )
  )
  (if del
    (princ
      (strcat "\n Usunięto następujące nieużywane (puste) grupy: \n"
	      (last del)
	      (apply 'strcat
		     (mapcar '(lambda (x) (strcat ", " x)) (cdr (reverse del)))
	      )
      )
    )
  
    (princ "\n Nie wykryto nieużywanych (pustych) grup. ")
  )
;(if del (alert "\t\n Usunięto wszystkie nieużywane (puste) grupy. \t\n"))


  
  (princ)
)