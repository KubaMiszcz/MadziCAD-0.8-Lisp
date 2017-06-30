(cdr (assoc 62 (entget (ssname (ssget "_:S") 0))))        ;wybrana wlasciwosc


(entget (ssname (ssget "_:S") 0)) ;wszytskie wlasciwosci



**FUNKCJA ERROR** 

(DEFUN *ERROR* (MSG)
  (IF 
    (OR 
      (NOT MSG) 
      (MEMBER MSG '("console break" "Function cancelled" "quit / exit abort"))	;LIST MEMBER
    )										;end OR
  (PRINC)				;THEN
  (PRINC (STRCAT "\nError: " MSG))	;ELSE
  )					;end IF
)					;end DEFUN *ERROR*

**inna funcka error
(defun *error* (msg)(princ "error: ")(princ msg)(princ))


*** otwarcie dostepu do pliku
(setq f (open "c:\\skasuj.txt" "r"))

**nazwa grupy
(defun c:bb()
(setq ss (ssget "_:S"))
(setq a (ssname ss 0))
(setq b (entget a))
(setq c (cdr (assoc 330 b)))
(setq d (entget c))
(setq e (cdr (assoc 330 d)))
(setq f (entget e))
(setq g (cdr (assoc 3 (reverse f))))	; nazwa grupy
(princ g)
)







