(defun c:pole_powierzchni()
  (defun *error* (errorlevel)
    (setvar "clayer" layerprev)			;zmienia na poprz warstwe
    (setvar "osmode" osmodeprev)
    (setvar "orthomode" orthoprev)
    (selection_to_list boundary_ss)
    (setq boundary_sslist sslist)
    (selection_to_list hatch_ss)
    (setq hatch_sslist sslist)
    (foreach item boundary_sslist (entdel item))
    (foreach item hatch_sslist (entdel item))
    (princ "\n MadziCAD error: Funkcja przerwana. ")
    (princ)
  )
  (graphscr)
  (setq layerprev (getvar "clayer"))        ;zapamietuje biezaca warstwe
  (setq osmodeprev (getvar "osmode"))       ;zapamietuje stale tryby lokalizacji
  (setq orthoprev (getvar "orthomode"))     ;zapamietuje status orto
  (setvar "clayer" "0")
  (setvar "osmode" 0)
  (setvar "orthomode" 0)
  (setq area 0)
  
  (setq boundary_ss (ssadd))
  (setq hatch_ss (ssadd))
    
  (setq pkt (getpoint "\n Wska¿ punkt w œrodku pierwszego obszaru: "))
  (while (/= pkt nil) 
    (command "_boundary" pkt "")
    (ssadd (entlast) boundary_ss)
    (command "_hatch" "ansi37" (getvar "dimscale") 0 (entlast) "")
    (ssadd (entlast) hatch_ss)
    (setq pkt (getpoint "\n Wska¿ punkt w œrodku kolejnego obszaru: "))
  )
  (selection_to_list boundary_ss)
  (setq boundary_sslist sslist)
  (selection_to_list hatch_ss)
  (setq hatch_sslist sslist)
  (foreach item boundary_sslist 
    (progn
      (command "_area" "o" item)
      (setq area (+ area (/ (getvar "area") 1000000)))  ;pole w m2
    )
  )
  (if (< area 1)
      (setq tempvar "0")
      (setq tempvar "")
  )
  (alert 
    (strcat 
      "\nSuma zakreskowanych obszarów:\t" tempvar
      (rtos area 2 2) "m2"
    )
  )
  (foreach item boundary_sslist (entdel item))
  (foreach item hatch_sslist (entdel item))
  
  (setvar "clayer" layerprev)       ;zmienia na poprz warstwe
  (setvar "osmode" osmodeprev)
  (setvar "orthomode" orthoprev)
  (princ)
)
