;; Funkcja wstawia wymiar wpólrzednych poziomych kilometraz w aktualnym LUW
;; razem ze znacznikiem
;;
;;kuba miszcz 2007 :]

(defun c:wymiar_wspolrzednych_kilometraz(/ layerprev pkt)
  (defun *error* (errorlevel)
    ;(setvar "osmode" osmodeprev)
    ;(setvar "orthomode" orthoprev)
    (setvar "clayer" layerprev)			;zmienia na poprz warstwe
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  
  (setq layerprev (getvar "clayer"))			;zapamietuje biezaca warstwe
  ; (setq osmodeprev (getvar "osmode"))       ;zapamietuje stale tryby lokalizacji
  ; (setq orthoprev (getvar "orthomode"))     ;zapamietuje status orto
  
  (if (/= (tblsearch "layer" warwym) nil)
    (setvar "clayer" warwym)          			;ustala akt warstwe na 'wymiary'
  )
  
  (setq pkt (getpoint "\nWska¿ punkt:"))
  (command "_dimordinate" pkt "_x" pkt)
  
  ;=================
  ; (setq entlist (entget (entlast)))
  ; (entdel (entlast))
  ; (setq base_pt (cdr (assoc 13 entlist)))
  ; (princ base_pt)
  ; (command "_circle" base_pt 25)
  ; (setq txt_center (cdr (assoc 11 entlist)))
  ; (princ txt_center)
  ; (command "_circle" txt_center 50)
  ; ;(setq new_txt_center (list (+ (/ (- (car txt_center) (car base_pt)) 4) (car base_pt)) (cadr txt_center) (caddr txt_center)))
  ; (setq new_txt_center (polar base_pt (angle base_pt txt_center) (/ (distance base_pt txt_center) 4.0)))
  ; (setq aaaa (cons 11 new_txt_center))
  ; (princ new_txt_center)
  ; (princ aaaa)
  
  ; (command "_circle" new_txt_center 150)
  ; (setq entlist
    ; (subst 
      ; (cons 11 new_txt_center) 
      ; (assoc 11 entlist) 
      ; entlist
    ; )
  ; )
  
  ; ;(entdel entlist)
  ; (entmake entlist)
  ;=================
  
  
  ;(setvar "osmode" osmodeprev)
  ;(setvar "orthomode" orthoprev)
  (setvar "clayer" layerprev)
  (c:wymiar_wspolrzednych_kilometraz)
  (princ)
)
