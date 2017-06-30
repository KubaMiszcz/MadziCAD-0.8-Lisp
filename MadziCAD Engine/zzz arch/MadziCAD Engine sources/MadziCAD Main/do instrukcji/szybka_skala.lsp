(defun C:Szybka_skala()
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (princ "\n Wska¿ obiekty do przeskalowania: ")
  (setq temp_selection (ssget))
  (setq base_pt (getpoint "\n Wska¿ punkt bazowy: "))
  (if 
    (= base_pt nil)
    (setq base_pt (cdr (assoc 10 (entget (ssname temp_selection 0)))))
  )
  ;(setq base_pt (cdr (assoc 10 (entget (ssname temp_selection 0)))))
  ;(setq base_angle_rad (atan (/ (- (cadr base_pt) (cadr pkt)) (- (car base_pt) (car pkt)))))
  ;(setq base_angle_deg (cvunit base_angle_rad "radians" "degrees"))
  
  
  (initget 137)
  (setq pt1 (getpoint base_pt "\n Wska¿ pierwszy punkt odniesienia, lub podaj skalê: "))
  (if 
    (= (listp pt1) nil)
    (progn
      (setq angledeg (atof pt1))
      (command "_scale" temp_selection "" base_pt angledeg) 
    )
    (progn
      (command "_scale" temp_selection "" base_pt "_reference" base_pt pt1 
        (progn 
          (princ "\n Wska¿ drugi punkt odniesienia: ")
          pause
        )
      )  
    )
  )
  ;(setq new_base_pt (cdr (assoc 10 (entget (ssname temp_selection 0)))))
  ;(setq new_base_angle_rad (atan (/ (- (cadr new_base_pt) (cadr pkt)) (- (car new_base_pt) (car pkt)))))
  ;(setq new_base_angle_deg (cvunit new_base_angle_rad "radians" "degrees"))
  ;(princ (- new_base_angle_deg base_angle_deg))   ;dokonczyc
  (princ)
)
