;funkcja genruje losowa nazwe z prefiksem i zapisuje do zmiennej: losowa_nazwa
;skladnia:  (generuj_losowa_nazwe "<prefix>")

(defun generuj_losowa_nazwe (prefix)  
  (setq luprecprev (getvar "luprec"))
  (setvar "luprec" 8)
  (setq losowa_nazwa
    (strcat prefix "_" (substr (rtos (getvar "date")) 12))
  )
  (setvar "luprec" luprecprev)
  (princ)
)