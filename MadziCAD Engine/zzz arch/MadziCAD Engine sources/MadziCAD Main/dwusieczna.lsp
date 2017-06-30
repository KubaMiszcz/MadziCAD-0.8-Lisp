(defun c:dwusieczna(/ layerprev pt1 pt2 pt3 pt4 pr11 pr12 pr21 pr22 elst ename pt preparam postparam intersectionpt dist1 dist2 angle2 midangle)
  (defun *error* (errorlevel)
    (setvar "clayer" layerprev)
    (command "_ucs" "_previous")
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq layerprev (getvar "clayer"))
  (setvar "clayer" "0")

  (command "_ucs" "_world")

  (setq elst (nentsel "\n Wska¿ pierwsze ramiê k¹ta: "))
  (setq ename (car elst))
  (setq pt (cadr elst))
  (setq pt (vlax-curve-getClosestPointTo ename pt))
  (setq param (vlax-curve-getParamAtPoint ename pt))
  (setq preparam (fix param))
  (setq postparam (1+ preparam))
  (setq pt1 (vlax-curve-getPointAtParam ename preparam))
  (setq pt2 (vlax-curve-getPointAtParam ename postparam))
  
  (if (= (cdr (assoc 0 (entget (car elst)))) "LINE")
    (progn 
      (setq pt1 (cdr (assoc 10 (entget (car elst)))))
      (setq pt2 (cdr (assoc 11 (entget (car elst)))))
    )
  )
  
  
  (setq elst (nentsel "\n Wska¿ drugie ramiê k¹ta: "))
  (setq ename (car elst))
  (setq pt (cadr elst))
  (setq pt (vlax-curve-getClosestPointTo ename pt))
  (setq param (vlax-curve-getParamAtPoint ename pt))
  (setq preparam (fix param))
  (setq postparam (1+ preparam))
  (setq pt3 (vlax-curve-getPointAtParam ename preparam))
  (setq pt4 (vlax-curve-getPointAtParam ename postparam))
  
    (if (= (cdr (assoc 0 (entget (car elst)))) "LINE")
    (progn 
      (setq pt3 (cdr (assoc 10 (entget (car elst)))))
      (setq pt4 (cdr (assoc 11 (entget (car elst)))))
    )
  )
  
  
  (setq intersectionpt (inters pt1 pt2 pt3 pt4 nil)) ;punkt przeciecia 
  
  (setq pt1 (trans pt1 0 1))
  (setq pt2 (trans pt2 0 1))  ;z  G do L  
  (setq pt3 (trans pt3 0 1))
  (setq pt4 (trans pt4 0 1))  
  (setq intersectionpt (trans intersectionpt 0 1))
  
  
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
  
  (command "_ucs" "_new" "3" pr11 pr12 pr22)
  
  (setq pr11 (trans pr11 0 1))
  (setq pr12 (trans pr12 0 1))  
  (setq pr21 (trans pr21 0 1)) ;z G do L
  (setq pr22 (trans pr22 0 1))  
  (setq intersectionpt (trans intersectionpt 0 1))
  
  (setq angle2 (angle intersectionpt pr22))
  
  (setq midangle (cvunit (/ angle2 2) "radians" "degrees"))
  
  (command "_ray" intersectionpt pr12 "")
  (command "_rotate" (entlast) "" intersectionpt midangle)
  
  (command "_ucs" "_previous")
  (command "_ucs" "_previous")
  (setvar "clayer" layerprev)
  (princ)
)




