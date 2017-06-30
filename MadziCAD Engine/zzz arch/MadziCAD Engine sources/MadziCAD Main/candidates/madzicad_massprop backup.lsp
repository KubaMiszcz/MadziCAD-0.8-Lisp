; PARAMETRY FIZYCZNE 
(defun c:madzicad_massprop(/ layerprev osmodeprev orthoprev boundary_ss hatch_ss temp_ss kat_kreskowania pkt dim1 dim2 skala_kreskowania boundary_sslist hatch_sslist area perimeter momentofinertia centroid principaldirections principalangle principalmoments properties pt1 pt2 entlist)
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
  
  (setq boundary_ss (ssadd))
  (setq hatch_ss (ssadd))
  (setq temp_ss (ssadd))
  
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
  
  (defun *error* (errorlevel)
    (setvar "clayer" layerprev)			;zmienia na poprz warstwe
    (setvar "osmode" osmodeprev)
    (setvar "orthomode" orthoprev)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
    (princ)
  )
  
  
  (selection_to_list hatch_ss)
  (setq hatch_sslist sslist)

  ;(foreach item hatch_sslist (entdel item))

  (command "_hatch" "ansi37" skala_kreskowania kat_kreskowania boundary_ss "")
  (ssadd (entlast) temp_ss)
  (command "_hatchedit" (entlast) "o" "r" "n")
  (ssadd (entlast) temp_ss)
  
  (selection_to_list boundary_ss)
  (setq boundary_sslist sslist)
  (foreach item boundary_sslist (entdel item))
  
  
  
  (setq area (vlax-get (vlax-ename->vla-object (cdr(car(entget (entlast))))) 'area)) ;powerchnia
  (setq perimeter (vlax-get (vlax-ename->vla-object (cdr(car(entget (entlast))))) 'perimeter)) ;obwod
  (setq centroid (vlax-get (vlax-ename->vla-object (cdr(car(entget (entlast))))) 'centroid)) ;srodek ceizkosci
  (setq momentofinertia (vlax-get (vlax-ename->vla-object (cdr(car(entget (entlast))))) 'momentofinertia)) ;momenty bezwladnosci
  (setq principalmoments (vlax-get (vlax-ename->vla-object (cdr(car(entget (entlast))))) 'principalmoments)) ;glowne momenty bezwladnosci
  (setq principaldirections (vlax-get (vlax-ename->vla-object (cdr(car(entget (entlast))))) 'principaldirections)) ;glowne kierunki osi centrlanych
  (vla-getboundingbox (vlax-ename->vla-object (cdr(car(entget (entlast))))) 'bbox1 'bbox2)
  (setq dim1 (vlax-safearray->list bbox1))
  (setq dim2 (vlax-safearray->list bbox2))
  
  (command "_erase" temp_ss "")
  
  ;kat obrotu osi centralnych
  (setq principalangle (cvunit (atan (/ (caddr principaldirections) (car principaldirections))) "radians" "degrees"))
  
  (setq temp_ss (ssadd))
  ;srodek ciekosci:
  (command "_circle" centroid (/ (distance dim1 dim2) 20))
  (ssadd (entlast) temp_ss)
  ;(command "_line" dim1 dim2 "") ;linia bboxa
  
  ;pierwsza os
  (command "_line" '(-10 0) '(10 0) "")
  (ssadd (entlast) temp_ss)
  (command "_rotate" (entlast) "" '(0 0) principalangle)
  (command "_scale" (entlast) "" '(0 0) (getvar "dimscale"))
  (command "_move" (entlast) "" '(0 0) centroid)
  
  (setq entlist (entget (entlast)))
  (setq pt1 (inters 
    (cdr (assoc 10 entlist))
    (cdr (assoc 11 entlist))
    dim1
    (list (car dim1) (+ (cadr dim1) 10) (caddr dim1)) 
    nil
  ))
  
  (setq pt2 (inters 
    (cdr (assoc 10 entlist))
    (cdr (assoc 11 entlist))
    dim2
    (list (car dim2) (+ (cadr dim2) 10) (caddr dim2)) 
    nil
  ))
  
  (setq entlist
    (subst 
      (cons 10 pt1) 
      (assoc 10 entlist) 
      entlist
    )
  )
  (setq entlist
    (subst 
      (cons 11 pt2) 
      (assoc 11 entlist) 
      entlist
    )
  )
  
  (entmod entlist)

  ;druga os
  (command "_line" '(0 -10) '(0 10) "")
  (ssadd (entlast) temp_ss)
  (command "_rotate" (entlast) "" '(0 0) principalangle)
  (command "_scale" (entlast) "" '(0 0) (getvar "dimscale"))
  (command "_move" (entlast) "" '(0 0) centroid)
  
  (setq entlist (entget (entlast)))
  (setq pt1 (inters 
    (cdr (assoc 10 entlist))
    (cdr (assoc 11 entlist))
    dim1
    (list (+ (car dim1) 10) (cadr dim1) (caddr dim1)) 
    nil
  ))
  
  (setq pt2 (inters 
    (cdr (assoc 10 entlist))
    (cdr (assoc 11 entlist))
    dim2
    (list (+ (car dim2) 10) (cadr dim2) (caddr dim2)) 
    nil
  ))
  
  (setq entlist
    (subst 
      (cons 10 pt1) 
      (assoc 10 entlist) 
      entlist
    )
  )
  (setq entlist
    (subst 
      (cons 11 pt2) 
      (assoc 11 entlist) 
      entlist
    )
  )
  
  (entmod entlist)
  

  
  (setq properties (strcat "W³aœciwoœci obszarów: \n"
    "Pole powierzchni:  " (rtos (/ area 100))      " cm2   (" (rtos area) " jedn^2)\n"
    "Obwód (sumaryczny):  "            (rtos (/ perimeter 10)) " cm   (" (rtos perimeter) " jedn)\n\n"
    "Centralne momenty bezw³adnoœci (wzglêdem LUW):\n"
    ;(rtos (car centroid)) "\t" (rtos (cadr centroid)) "\n"
    "Jx:  " (rtos (/ (car momentofinertia) 10000)) " cm4   (" (rtos (car momentofinertia))" jedn^4)\n"
    "Jy:  " (rtos (/ (cadr momentofinertia) 10000)) " cm4   (" (rtos (cadr momentofinertia)) " jedn^4)\n\n"
    "G³ówne centralne momenty bezw³adnosæi:\n"
    "Jx:  " (rtos (/ (car principalmoments) 10000)) " cm4   (" (rtos (car principalmoments)) " jedn^4)\n"
    "Jy:  " (rtos (/ (cadr principalmoments) 10000)) " cm4   (" (rtos (cadr principalmoments)) " jedn^4)\n\n"
    ;"Kierunki g³ówne:   " (rtos principalangle) " stopni\n"
  ))
  
  (generuj_losowa_nazwe "MadziCAD_mass_properties")
  (setq block_temp losowa_nazwa)
  (setq base_pt (trans (cdr(assoc 10(entget (ssname temp_ss 0))))0 1))
  (command "_block" block_temp base_pt temp_ss "")
  (command "_insert" block_temp base_pt 1 1 0)
  
  (command "_mtext" 
    '(0 0)
    "_justify" "_bl" 
    "_height" (* (getvar "dimscale") txta)			;wysokosc tekstu
    '(0 0)
    properties
    ""
  )
  
  (command "_move" (entlast) "" '(0 0) pause)

  (princ properties)
  (alert properties)
  
  (setvar "clayer" layerprev)       ;zmienia na poprz warstwe
  (setvar "osmode" osmodeprev)
  (setvar "orthomode" orthoprev)
  (princ)
)
