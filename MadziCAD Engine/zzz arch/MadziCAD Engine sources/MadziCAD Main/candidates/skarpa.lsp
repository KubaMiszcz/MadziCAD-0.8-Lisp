

;=================================
;skarpa
;=================================

(defun c:madzicad_skarpa_z_krawedzi() ;(/ layerprev pt1 pt2 pt3 pt4 pr11 pr12 pr21 pr22 elst ename pt preparam postparam intersectionpt dist1 dist2 angle2 midangle)
  (defun *error* (errorlevel)
    (setvar "clayer" layerprev)
    (command "_ucs" "_previous")
    (setvar "osmode" osmodeprev)
    (setvar "orthomode" orthoprev)  
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq layerprev (getvar "clayer"))
  (setvar "clayer" warkresk)
  (setq osmodeprev (getvar "osmode"))       ;zapamietuje stale tryby lokalizacji
  (setq orthoprev (getvar "orthomode"))     ;zapamietuje status orto
  (setvar "osmode" 0)
  (setvar "orthomode" 0)
  (setq kreskowanie_skarpy (ssadd))

  (command "_ucs" "_world")
  
  (setq elst (nentsel "\n Wska� g�rn� kra�d� skarpy: "))
  
  ;jesli luk
  (if (= (cdr (assoc 0 (entget (car elst)))) "ARC")
    (progn 
      (setq kindofslope "slopearc")
      (setq arc_center1 (cdr (assoc 10 (entget (car elst))))) ;srodek luku
      (setq arc_radius1 (cdr (assoc 40 (entget (car elst))))) ;promien luku
      (setq angle1 (cvunit (cdr (assoc 50 (entget (car elst)))) "radians" "degrees")) ;poczatkowy kat
      (setq angle2 (cvunit (cdr (assoc 51 (entget (car elst)))) "radians" "degrees")) ;poczatkowy kat

      (command "_ucs" "_new" arc_center1)
      (setq arc_center1 (trans arc_center1 0 1))
      (command "_line" arc_center1 (list arc_radius1 0) "")
      (command "_rotate" (entlast) "" arc_center1 angle1)
      (setq pt1 (cdr (assoc 11 (entget (entlast)))))
      (entdel(entlast))
      
      (command "_line" arc_center1 (list arc_radius1 0) "")
      (command "_rotate" (entlast) "" arc_center1 angle2)
      (setq pt2 (cdr (assoc 11 (entget (entlast)))))
      (entdel(entlast))
      
      (setq arc_center1 (trans arc_center1 1 0))
      (command "_ucs" "_previous")
    )
  )
    
    ;jesli polilinia
  (if (= (cdr (assoc 0 (entget (car elst)))) "LWPOLYLINE")
    (progn
      (setq kindofslope "slopeline")
      (setq ename (car elst))
      (setq pt (cadr elst))
      (setq pt (vlax-curve-getClosestPointTo ename pt))
      (setq param (vlax-curve-getParamAtPoint ename pt))
      (setq preparam (fix param))
      (setq postparam (1+ preparam))
      (setq pt1 (vlax-curve-getPointAtParam ename preparam))
      (setq pt2 (vlax-curve-getPointAtParam ename postparam))
    )
  )
  
  ;jelsi linia
  (if (= (cdr (assoc 0 (entget (car elst)))) "LINE")
    (progn 
      (setq kindofslope "slopeline")
      (setq pt1 (cdr (assoc 10 (entget (car elst)))))
      (setq pt2 (cdr (assoc 11 (entget (car elst)))))
    )
  )

  
  (setq elst (nentsel "\n Wskaż dolną krawędź skarpy: "))
  
    ;jesli luk
  (if (= (cdr (assoc 0 (entget (car elst)))) "ARC")
    (progn 
      (setq arc_center2 (cdr (assoc 10 (entget (car elst))))) ;srodek luku
      (setq arc_radius2 (cdr (assoc 40 (entget (car elst))))) ;promien luku
      (setq angle3 (cvunit (cdr (assoc 50 (entget (car elst)))) "radians" "degrees")) ;poczatkowy kat
      (setq engle4 (cvunit (cdr (assoc 51 (entget (car elst)))) "radians" "degrees")) ;poczatkowy kat

      (command "_ucs" "_new" arc_center2)
      (setq arc_center2 (trans arc_center2 0 1))
      (command "_line" arc_center2 (list arc_radius2 0) "")
      (command "_rotate" (entlast) "" arc_center2 angle3)
      (setq pt3 (cdr (assoc 11 (entget (entlast)))))
      (entdel(entlast))
      
      (command "_line" arc_center2 (list arc_radius2 0) "")
      (command "_rotate" (entlast) "" arc_center2 angle4)
      (setq pt4 (cdr (assoc 11 (entget (entlast)))))
      (entdel(entlast))
      
      (setq arc_center2 (trans arc_center2 1 0))
      (command "_ucs" "_previous")
    )
  )
  
  ;jesli polinia
  (if (= (cdr (assoc 0 (entget (car elst)))) "LWPOLYLINE")
    (progn
      (setq ename (car elst))
      (setq pt (cadr elst))
      (setq pt (vlax-curve-getClosestPointTo ename pt))
      (setq param (vlax-curve-getParamAtPoint ename pt))
      (setq preparam (fix param))
      (setq postparam (1+ preparam))
      (setq pt3 (vlax-curve-getPointAtParam ename preparam))
      (setq pt4 (vlax-curve-getPointAtParam ename postparam))
    )
  )
      
      ;jesli linia
  (if (= (cdr (assoc 0 (entget (car elst)))) "LINE")
    (progn 
      (setq pt3 (cdr (assoc 10 (entget (car elst)))))
      (setq pt4 (cdr (assoc 11 (entget (car elst)))))
    )
  )

  (if (= kindofslope "slopeline")  ;tzn ze elelmnt liniowy linia labo polilinia
    (progn
      (setq intersectionpt (inters pt1 pt2 pt3 pt4 nil)) ;punkt przeciecia 
      (if (= intersectionpt nil)
        (setq intersectionpt pt1)
      )

      (setq dist1 (distance intersectionpt pt1))
      (setq dist2 (distance intersectionpt pt2))
      
      (if (< dist1 dist2)
        (progn
          (setq pr11 pt1)
          (setq pr12 pt2)
        )
        (progn
          (setq pr11 pt2)
          (setq pr12 pt1)
        )
      )
      
      (setq dist1 (distance intersectionpt pt3))
      (setq dist2 (distance intersectionpt pt4))
      
      (if (< dist1 dist2)
        (progn
          (setq pr21 pt3)
          (setq pr22 pt4)
        )
        (progn
          (setq pr21 pt4)
          (setq pr22 pt3)
        )
      )
      
      
      (command "_ucs" "n" "3" pr11 pr12 pr22)
      
      (setq pr11 (trans pr11 0 1)) ; z G do L
      (setq pr12 (trans pr12 0 1))
      (setq pr21 (trans pr21 0 1))
      (setq pr22 (trans pr22 0 1))
      (setq intersectionpt (trans intersectionpt 0 1))
      
            ;rysowanie krotkiej kreski
      (setq rozstaw (* (getvar "dimscale") 10)) ;rozstaw kresek malych i duzych tzn duza kreska co 2*rozstaw
      (setq kreska (* (* (getvar "dimscale") 10) 1))
      (setq slope_length (- (distance pr11 pr12) kreska))
      (setq nn (+ (fix (/ slope_length (* rozstaw 2))) 1))
      
      (repeat nn
        (setq pt1 (list kreska 0))
        (setq pt2 (list kreska 100))
        (setq pt2 (inters pt1 pt2 pr21 pr22 nil)) ;punkt przeciecia 
        (command "_pline" pt1 pt2 "")
        (command "_scale" (entlast) "" pt1 0.55) ; tutaj 0.6 to skala kreski 
        (ssadd (entlast) kreskowanie_skarpy)
        ;(setq pt2 (inters (getpoint)(getpoint)(getpoint)(getpoint) nil) 
        (setq kreska (+ kreska (* rozstaw 2)))
      )
      
      ;rysowanie dlugiej kreski
      (setq kreska (* (* (getvar "dimscale") 10) 2))
      (setq slope_length (- (distance pr11 pr12) kreska))
      (setq nn (+ (fix (/ slope_length (* rozstaw 2))) 1))
      
      (repeat nn
        (setq pt1 (list kreska 0))
        (setq pt2 (list kreska 100))
        (setq pt2 (inters pt1 pt2 pr21 pr22 nil)) ;punkt przeciecia 
        (command "_pline" pt1 pt2 "")
        (command "_scale" (entlast) "" pt1 0.85) ; tutaj 0.6 to skala kreski 
        (ssadd (entlast) kreskowanie_skarpy)
        ;(setq pt2 (inters (getpoint)(getpoint)(getpoint)(getpoint) nil) 
        (setq kreska (+ kreska (* rozstaw 2)))
      )
    )
  )
  
  (if (= kindofslope "slopearc")      ;tzn ze luk
    (progn
      (setq rozstaw 5) ;rozstaw w stopniach
      (command "_ucs" "_new" arc_center1)
      (setq arc_center1 (trans arc_center1 0 1))
      (command "_pline" (list arc_radius1 0) (list (+ arc_radius1 arc_radius2) 0) "")
      (command "_rotate" (entlast) "" arc_center1 angle1)      
      
      
      
      
      (ssadd (entlast) kreskowanie_skarpy)
    
    
    
      (command "_ucs" "_previous")
    )
  )
  
  
  
      
  (generuj_losowa_nazwe "MadziCAD_skarpa")
  (setq block_temp losowa_nazwa)
  (command "_block" block_temp pr11 kreskowanie_skarpy "")
  (command "_insert" block_temp pr11 1 1 0)
  
  (command "_ucs" "_previous")
  (command "_ucs" "_previous")
  
  ;(command "_circle" intersectionpt (* 10 (getvar "dimscale")))
  
  (setvar "clayer" layerprev)
  (setvar "osmode" osmodeprev)
  (setvar "orthomode" orthoprev)  
  (princ)
)









(defun c:asd () ; / elst ename pt param preparam postparam)
  (setq elst (nentsel "\nSelect pline segment: "))
  (setq ename (car elst))
  (setq pt (cadr elst))
  (setq pt (vlax-curve-getClosestPointTo ename pt))
  (setq param (vlax-curve-getParamAtPoint ename pt))
  (setq preparam (fix param))
  (setq postparam (1+ preparam))
  (setq pt 
    (list (vlax-curve-getPointAtParam ename preparam) (vlax-curve-getPointAtParam ename postparam))
  )
  (command "_circle" (car pt) 75)
  (command "_circle" (cadr pt) 150)
) ;end











(defun c:dwusieczna_oryginal(/ layerprev dimscaleprev pt1 pt2 pt3 pr11 pr12 pr21 pr22 ent endpt intersectionpt)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
    (setvar "clayer" layerprev)
    (setvar "dimscale" dimscaleprev)
  )
  (graphscr)
  (setq layerprev (getvar "clayer"))
  (setvar "clayer" "0")
  (setq dimscaleprev (getvar "dimscale"))
  (setvar "dimscale" 0.001)

  (command "_dimangular"
    (progn
      (princ "\n Wskaż pierwsze ramię kąta: ")
      pause
    )
    (progn 
      (setq pt1 (getvar "lastpoint"))
      (princ "\n Wskaż drugie ramię kąta: ")
      pause
    )
    (progn
      (setq pt2 (getvar "lastpoint"))
      (setq pt3 (polar pt1 (angle pt1 pt2) (/ (distance pt1 pt2) 2.0)))
      pt3
    )
  )

  
  (setq ent (entget (entlast)))
  (if (= (cdr (assoc 100 (reverse ent))) "AcDb2LineAngularDimension")
    (entdel (entlast))
  )
  
  (setq pr11 (cdr(assoc 10 ent)))
  (setq pr12 (cdr(assoc 15 ent)))
  (setq pr21 (cdr(assoc 13 ent)))
  (setq pr22 (cdr(assoc 14 ent)))
  (setq endpt (cdr(assoc 11 ent)))
  
  (setq pr11 (trans pr11 0 1))
  (setq pr12 (trans pr12 0 1))  
  (setq pr21 (trans pr21 0 1)) ;z G do L
  (setq pr22 (trans pr22 0 1))  
  
  (setq intersectionpt (inters pr11 pr12 pr21 pr22 nil)) ;punkt przeciecia 
  (command "_ray" intersectionpt endpt "")
  
  ;(command "_circle" intersectionpt (* 10 (getvar "dimscale")))
  

  (setvar "clayer" layerprev)
  (setvar "dimscale" dimscaleprev)
  (princ)
)



;=================================
;skarpa
;=================================

(defun c:ss() ;(/ layerprev pt1 pt2 pt3 pt4 pr11 pr12 pr21 pr22 elst ename pt preparam postparam intersectionpt dist1 dist2 angle2 midangle)
  (defun *error* (errorlevel)
    (setvar "clayer" layerprev)
    ;(command "_ucs" "_previous")
    (setvar "osmode" osmodeprev)
    (setvar "orthomode" orthoprev)  
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq layerprev (getvar "clayer"))
  (setvar "clayer" warkresk)
  (setq osmodeprev (getvar "osmode"))       ;zapamietuje stale tryby lokalizacji
  (setq orthoprev (getvar "orthomode"))     ;zapamietuje status orto
  (setvar "osmode" 0)
  (setvar "orthomode" 0)
  (setq kreskowanie_skarpy (ssadd))

  ;(command "_ucs" "_world")
  
  (setq upper_edge (nentsel "\n Wskaż górną krawędź skarpy: "))
  (command "_measure" upper_edge 500)
  (setq upper_edge_points (ssget "_P"))
  (setq bottom_edge (nentsel "\n Wskaż górną krawędź skarpy: "))
  (command "_divide" bottom_edge 3)
  (setq bottom_edge_points (ssget "_P"))
  
  (command "_ucs" "_new" "3" 
    (trans (cdr (assoc 10 (entget (ssname upper_edge_points 0)))) 0 1)
    (trans (cdr (assoc 10 (entget (ssname upper_edge_points 1)))) 0 1)
    (trans (cdr (assoc 10 (entget (ssname bottom_edge_points 0)))) 0 1)
  )
  
  (setq n 0)
  (repeat (fix (/ (+ (sslength upper_edge_points) 1) 2))
    (setq pt1 (trans (cdr (assoc 10 (entget (ssname upper_edge_points n)))) 0 1))
    (setq pt2 
      (inters 
        pt1
        (list (car pt1) 10)
        (trans (cdr (assoc 10 (entget (ssname bottom_edge_points 0)))) 0 1)
        (trans (cdr (assoc 10 (entget (ssname bottom_edge_points 1)))) 0 1)
      nil)
    )
    (command "_pline" pt1 pt2 "")
    (command "_scale" (entlast) "" pt1 1) ; tutaj 0.6 to skala kreski 
    (ssadd (entlast) kreskowanie_skarpy)
    (setq n (+ n 2))  
  )
    
  (setq n 1)
  (repeat (fix (/ (sslength upper_edge_points) 2))
    (setq pt1 (trans (cdr (assoc 10 (entget (ssname upper_edge_points n)))) 0 1))
    (setq pt2 
      (inters 
        pt1
        (list (car pt1) 10)
        (trans (cdr (assoc 10 (entget (ssname bottom_edge_points 0)))) 0 1)
        (trans (cdr (assoc 10 (entget (ssname bottom_edge_points 1)))) 0 1)
      nil)
    )
    (command "_pline" pt1 pt2 "")
    (command "_scale" (entlast) "" pt1 0.5) ; tutaj 0.6 to skala kreski 
    (ssadd (entlast) kreskowanie_skarpy)
    (setq n (+ n 2))  
  )

  
  (generuj_losowa_nazwe "MadziCAD_skarpa")
  (setq block_temp losowa_nazwa)
  (setq base_pt (trans (cdr(assoc 10(entget (ssname kreskowanie_skarpy 0)))) 0 1))
  (command "_block" block_temp base_pt kreskowanie_skarpy "")
  (command "_insert" block_temp base_pt 1 1 0)
  
  ;(command "_erase" upper_edge_points bottom_edge_points "")
  
  
  (command "_ucs" "_previous")
  (setvar "clayer" layerprev)
  (setvar "osmode" osmodeprev)
  (setvar "orthomode" orthoprev)  
  (princ)
  
)  
  
  
  
  
  
  
  
  
  
  
  
  
(defun c:asdasd()
  ;jesli luk
  (if (= (cdr (assoc 0 (entget (car elst)))) "ARC")
    (progn 
      (setq kindofslope "slopearc")
      (setq arc_center1 (cdr (assoc 10 (entget (car elst))))) ;srodek luku
      (setq arc_radius1 (cdr (assoc 40 (entget (car elst))))) ;promien luku
      (setq angle1 (cvunit (cdr (assoc 50 (entget (car elst)))) "radians" "degrees")) ;poczatkowy kat
      (setq angle2 (cvunit (cdr (assoc 51 (entget (car elst)))) "radians" "degrees")) ;poczatkowy kat

      (command "_ucs" "_new" arc_center1)
      (setq arc_center1 (trans arc_center1 0 1))
      (command "_line" arc_center1 (list arc_radius1 0) "")
      (command "_rotate" (entlast) "" arc_center1 angle1)
      (setq pt1 (cdr (assoc 11 (entget (entlast)))))
      (entdel(entlast))
      
      (command "_line" arc_center1 (list arc_radius1 0) "")
      (command "_rotate" (entlast) "" arc_center1 angle2)
      (setq pt2 (cdr (assoc 11 (entget (entlast)))))
      (entdel(entlast))
      
      (setq arc_center1 (trans arc_center1 1 0))
      (command "_ucs" "_previous")
    )
  )
    
    ;jesli polilinia
  (if (= (cdr (assoc 0 (entget (car elst)))) "LWPOLYLINE")
    (progn
      (setq kindofslope "slopeline")
      (setq ename (car elst))
      (setq pt (cadr elst))
      (setq pt (vlax-curve-getClosestPointTo ename pt))
      (setq param (vlax-curve-getParamAtPoint ename pt))
      (setq preparam (fix param))
      (setq postparam (1+ preparam))
      (setq pt1 (vlax-curve-getPointAtParam ename preparam))
      (setq pt2 (vlax-curve-getPointAtParam ename postparam))
    )
  )
  
  ;jelsi linia
  (if (= (cdr (assoc 0 (entget (car elst)))) "LINE")
    (progn 
      (setq kindofslope "slopeline")
      (setq pt1 (cdr (assoc 10 (entget (car elst)))))
      (setq pt2 (cdr (assoc 11 (entget (car elst)))))
    )
  )

  
  (setq elst (nentsel "\n Wskaż dolną krawędź skarpy: "))
  
    ;jesli luk
  (if (= (cdr (assoc 0 (entget (car elst)))) "ARC")
    (progn 
      (setq arc_center2 (cdr (assoc 10 (entget (car elst))))) ;srodek luku
      (setq arc_radius2 (cdr (assoc 40 (entget (car elst))))) ;promien luku
      (setq angle3 (cvunit (cdr (assoc 50 (entget (car elst)))) "radians" "degrees")) ;poczatkowy kat
      (setq engle4 (cvunit (cdr (assoc 51 (entget (car elst)))) "radians" "degrees")) ;poczatkowy kat

      (command "_ucs" "_new" arc_center2)
      (setq arc_center2 (trans arc_center2 0 1))
      (command "_line" arc_center2 (list arc_radius2 0) "")
      (command "_rotate" (entlast) "" arc_center2 angle3)
      (setq pt3 (cdr (assoc 11 (entget (entlast)))))
      (entdel(entlast))
      
      (command "_line" arc_center2 (list arc_radius2 0) "")
      (command "_rotate" (entlast) "" arc_center2 angle4)
      (setq pt4 (cdr (assoc 11 (entget (entlast)))))
      (entdel(entlast))
      
      (setq arc_center2 (trans arc_center2 1 0))
      (command "_ucs" "_previous")
    )
  )
  
  ;jesli polinia
  (if (= (cdr (assoc 0 (entget (car elst)))) "LWPOLYLINE")
    (progn
      (setq ename (car elst))
      (setq pt (cadr elst))
      (setq pt (vlax-curve-getClosestPointTo ename pt))
      (setq param (vlax-curve-getParamAtPoint ename pt))
      (setq preparam (fix param))
      (setq postparam (1+ preparam))
      (setq pt3 (vlax-curve-getPointAtParam ename preparam))
      (setq pt4 (vlax-curve-getPointAtParam ename postparam))
    )
  )
      
      ;jesli linia
  (if (= (cdr (assoc 0 (entget (car elst)))) "LINE")
    (progn 
      (setq pt3 (cdr (assoc 10 (entget (car elst)))))
      (setq pt4 (cdr (assoc 11 (entget (car elst)))))
    )
  )

  (if (= kindofslope "slopeline")  ;tzn ze elelmnt liniowy linia labo polilinia
    (progn
      (setq intersectionpt (inters pt1 pt2 pt3 pt4 nil)) ;punkt przeciecia 
      (if (= intersectionpt nil)
        (setq intersectionpt pt1)
      )

      (setq dist1 (distance intersectionpt pt1))
      (setq dist2 (distance intersectionpt pt2))
      
      (if (< dist1 dist2)
        (progn
          (setq pr11 pt1)
          (setq pr12 pt2)
        )
        (progn
          (setq pr11 pt2)
          (setq pr12 pt1)
        )
      )
      
      (setq dist1 (distance intersectionpt pt3))
      (setq dist2 (distance intersectionpt pt4))
      
      (if (< dist1 dist2)
        (progn
          (setq pr21 pt3)
          (setq pr22 pt4)
        )
        (progn
          (setq pr21 pt4)
          (setq pr22 pt3)
        )
      )
      
      
      (command "_ucs" "n" "3" pr11 pr12 pr22)
      
      (setq pr11 (trans pr11 0 1)) ; z G do L
      (setq pr12 (trans pr12 0 1))
      (setq pr21 (trans pr21 0 1))
      (setq pr22 (trans pr22 0 1))
      (setq intersectionpt (trans intersectionpt 0 1))
      
      (setq slope_length (- (distance pr11 pr12) 500))
      (setq nn (+ (fix (/ slope_length 1000)) 1))
      (setq rozstaw 500) ;rozstaw kresek malych i duzych tzn duza kreska co 1000
      
      ;rysowanie krotkiej kreski
      (repeat nn
        (setq pt1 (list rozstaw 0))
        (setq pt2 (list rozstaw 100))
        (setq pt2 (inters pt1 pt2 pr21 pr22 nil)) ;punkt przeciecia 
        (command "_pline" pt1 pt2 "")
        (command "_scale" (entlast) "" pt1 0.55) ; tutaj 0.6 to skala kreski 
        (ssadd (entlast) kreskowanie_skarpy)
        ;(setq pt2 (inters (getpoint)(getpoint)(getpoint)(getpoint) nil) 
        (setq rozstaw (+ rozstaw 1000))
      )
      
      ;rysowanie dlugiej kreski
      (setq slope_length (- (distance pr11 pr12) 1000))
      (setq nn (+ (fix (/ slope_length 1000)) 1))
      (setq rozstaw 500) ;rozstaw kresek malych i duzych tzn duza kreska co 1000
      (setq rozstaw (+ 500 500)) ;rozstaw kresek malych i duzych tzn duza kreska co 1000
      (repeat nn
        (setq pt1 (list rozstaw 0))
        (setq pt2 (list rozstaw 100))
        (setq pt2 (inters pt1 pt2 pr21 pr22 nil)) ;punkt przeciecia 
        (command "_pline" pt1 pt2 "")
        (command "_scale" (entlast) "" pt1 0.85) ; tutaj 1 to skala kreski - q do dolnej krawe
        (ssadd (entlast) kreskowanie_skarpy)
        ;(setq pt2 (inters (getpoint)(getpoint)(getpoint)(getpoint) nil) 
        (setq rozstaw (+ rozstaw 1000))
      )
    )
  )
  
  (if (= kindofslope "slopearc")      ;tzn ze luk
    (progn
      (setq rozstaw 5) ;rozstaw w stopniach
      (command "_ucs" "_new" arc_center1)
      (setq arc_center1 (trans arc_center1 0 1))
      (command "_pline" (list arc_radius1 0) (list (+ arc_radius1 arc_radius2) 0) "")
      (command "_rotate" (entlast) "" arc_center1 angle1)      
      
      
      
      
      (ssadd (entlast) kreskowanie_skarpy)
    
    
    
      (command "_ucs" "_previous")
    )
  )
  
  
  
      
  (generuj_losowa_nazwe "MadziCAD_skarpa")
  (setq block_temp losowa_nazwa)
  (setq base_pt (cdr(assoc 10(entget (ssname kreskowanie_skarpy 0)))))
  (command "_block" block_temp base_pt kreskowanie_skarpy "")
  (command "_insert" block_temp base_pt 1 1 0)
  
  (command "_ucs" "_previous")
  (command "_ucs" "_previous")
  
  ;(command "_circle" intersectionpt (* 10 (getvar "dimscale")))
  
  (setvar "clayer" layerprev)
  (setvar "osmode" osmodeprev)
  (setvar "orthomode" orthoprev)  
  (princ)
)














