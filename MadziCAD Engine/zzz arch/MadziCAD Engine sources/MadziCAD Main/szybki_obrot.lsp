(defun C:szybki_obrot(/ temp_selection base_pt  pt1 angledeg)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (princ "\n Wska¿ obiekty do obrócenia: ")
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
  (setq pt1 (getpoint base_pt "\n Wska¿ pierwszy punkt obrotu, lub podaj k¹t obrotu: "))
  (if 
    (= (listp pt1) nil)
    (progn
      (setq angledeg (atof pt1))
      (command "_rotate" temp_selection "" base_pt angledeg) 
    )
    (progn
      (command "_rotate" temp_selection "" base_pt "_reference" base_pt pt1 
      (progn 
        (princ "\n Wska¿ drugi punkt obrotu: ")
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



(defun C:szybki_obrot_z_kopiowaniem(/ temp_selection base_pt  pt1 angledeg)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (princ "\n Wska¿ obiekty do obrócenia: ")
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
  (setq pt1 (getpoint base_pt "\n Wska¿ pierwszy punkt obrotu, lub podaj k¹t obrotu: "))
  (if 
    (= (listp pt1) nil)
    (progn
      (setq angledeg (atof pt1))
      (command "_rotate" temp_selection "" base_pt "_copy" angledeg)
      (command "_rotate" temp_selection "" base_pt "_copy" (getreal))       
      (command "_rotate" temp_selection "" base_pt "_copy" (getreal))       
      (command "_rotate" temp_selection "" base_pt "_copy" (getreal))       
      (command "_rotate" temp_selection "" base_pt "_copy" (getreal))       
    )
    
    
    
    ;kopiowanie 5 razy
    (progn
      (command "_rotate" temp_selection "" base_pt "_copy" "_reference" base_pt pt1 
        (progn 
          (princ "\n Wska¿ drugi punkt obrotu: ")
          pause
        )
      )
      (command "_rotate" temp_selection "" base_pt "_copy" "_reference" base_pt pt1 
        (progn 
          (princ "\n Wska¿ drugi punkt obrotu: ")
          pause
        )
      )
      (command "_rotate" temp_selection "" base_pt "_copy" "_reference" base_pt pt1 
        (progn 
          (princ "\n Wska¿ drugi punkt obrotu: ")
          pause
        )
      )
      (command "_rotate" temp_selection "" base_pt "_copy" "_reference" base_pt pt1 
        (progn 
          (princ "\n Wska¿ drugi punkt obrotu: ")
          pause
        )
      )
      (command "_rotate" temp_selection "" base_pt "_copy" "_reference" base_pt pt1 
        (progn 
          (princ "\n Wska¿ drugi punkt obrotu: ")
          pause
        )
      )
    
    
    
    
    
    
    
    )
  )
  ;(setq new_base_pt (cdr (assoc 10 (entget (ssname temp_selection 0)))))
  ;(setq new_base_angle_rad (atan (/ (- (cadr new_base_pt) (cadr pkt)) (- (car new_base_pt) (car pkt)))))
  ;(setq new_base_angle_deg (cvunit new_base_angle_rad "radians" "degrees"))
  ;(princ (- new_base_angle_deg base_angle_deg))   ;dokonczyc
  (C:szybki_obrot_z_kopiowaniem)
  (princ)
)