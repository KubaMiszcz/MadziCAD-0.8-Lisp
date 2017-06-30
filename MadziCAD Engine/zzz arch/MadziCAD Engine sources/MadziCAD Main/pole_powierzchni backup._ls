(defun c:pole_powierzchni(/ layerprev osmodeprev orthoprev boundary_ss hatch_ss kat_kreskowania pkt dim1 dim2 skala_kreskowania    boundary_sslist hatch_sslist area tempvar)
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
  
  (setq kat_kreskowania 0)   ;poczatkowy kat kreskowania zeby przez pomylke nie zanzczyc obszaru dwa razy
  
  (setq pkt (getpoint "\n Wska¿ punkt w œrodku pierwszego obszaru: "))
  (while (/= pkt nil) 
    (command "_boundary" "_advanced" "_object" "_region" "" "_advanced" "_island" "_no" "" "" pkt "")  
    (vla-getboundingbox (vlax-ename->vla-object (cdr(car(entget (entlast))))) 'bbox1 'bbox2) ;narozniki boundingboxa
    (setq dim1 (vlax-safearray->list bbox1))
    (setq dim2 (vlax-safearray->list bbox2))
    (setq skala_kreskowania (/ (max (abs (- (car dim1) (car dim2))) (abs (- (cadr dim1) (cadr dim2)))) 50))  ;ustalenie skali kreskowania
    
    (ssadd (entlast) boundary_ss)
    (command "_hatch" "ansi37" skala_kreskowania kat_kreskowania (entlast) "")
    (ssadd (entlast) hatch_ss)
    (setq pkt (getpoint "\n Wska¿ punkt w œrodku kolejnego obszaru: "))
    (setq kat_kreskowania (+ kat_kreskowania 10))
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
      (setq tempvar "")       ;tutaj "0" zeby pisalo np 0.21 zamiast .21
      (setq tempvar "")
  )
  (alert 
    (strcat 
      "\nSuma zakreskowanych obszarów:\t" tempvar
      (rtos area 2 2) "m2\n"      
      "\nDok³adne pole powierzchni zakreskowanych obszarów:\t" tempvar
      (rtos (* area 1000000) 2 4) " jednostek kwadratowych."    
    )
  )
  (foreach item boundary_sslist (entdel item))
  (foreach item hatch_sslist (entdel item))
  
  (setvar "clayer" layerprev)       ;zmienia na poprz warstwe
  (setvar "osmode" osmodeprev)
  (setvar "orthomode" orthoprev)
  (princ)
)
