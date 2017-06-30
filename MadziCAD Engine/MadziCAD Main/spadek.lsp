;; Funkcja wstawia strzalke i wartosc spadku w [%]
;;
;; kuba miszcz 2007 :]

(defun c:spadek(/ layerprev osmodeprev orthoprev skala pkt1 pkt2 tan_angle anglerad angledeg strzalka spadek spadektxt pkt temp_selection)
  (defun *error* (errorlevel)
    (setvar "clayer" layerprev)			;zmienia na poprz warstwe
    (setvar "osmode" osmodeprev)
    (setvar "orthomode" orthoprev)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq layerprev (getvar "clayer"))				;zapamietuje biezaca warstwe
  (setq osmodeprev (getvar "osmode"))				;zapamietuje stale tryby lokalizacji
  (setq orthoprev (getvar "orthomode"))			;zapamietuje status orto
  (setvar "clayer" warwym)				          ;ustala akt warstwe na 'wymiary'
  (setq skala (/ (getvar "dimscale") 100))	;skala wstawiania
  
  (setvar "orthomode" 0)  
  (princ "\n Wska¿ dwa punkty : ")
  (command "_line" pause pause "")
  (setq pkt1 (cdr (assoc 10 (entget (entlast)))))		;pkt1 w GUW
  (setq pkt1 (trans pkt1 0 1))					;;pkt1 z GUW do LUW  
  (setq pkt2 (cdr (assoc 11 (entget (entlast)))))		;pkt2 w GUW
  (setq pkt2 (trans pkt2 0 1))					;;pkt2 z GUW do LUW 
  (command "_erase" (entlast) "")
  
  (setq tan_angle (/ (- (cadr pkt2) (cadr pkt1)) (- (car pkt2) (car pkt1))))
  (setq anglerad (atan tan_angle))
  (setq angledeg (cvunit anglerad "radians" "degrees"))   ;kat w stopniach

  ;ustalenie kierunku strzalki
  (if
    (> angledeg 0)
    (setq strzalka "spadek w lewo")
    (setq strzalka "spadek w prawo")
  )
  
  (setq spadek (abs (* 100 tan_angle)))                                 	;100% * tangens kata = spadek
  (setq spadektxt (strcat (rtos spadek 2 dokl_spadku) "%"))				;dokladnosc spadku
  (setvar "osmode" 0)
  
  (setq temp_selection (ssadd)) 
  (command "_insert" strzalka '(0 0) skala skala angledeg) 
  (ssadd (entlast) temp_selection)

  (command "_mtext" 
           '(0 0)
           "w" "cs"
           "k" (* txta skala 100) 
           "b" angledeg
           '(0 0)
           spadektxt 
           ""
  )
  (ssadd (entlast) temp_selection)
  (generuj_losowa_nazwe "spadek")
  (command "_block" losowa_nazwa '(0 0) temp_selection "")
  (command "_insert" losowa_nazwa (progn (princ "\n Wska¿ polozenie opisu: ") pause) 1 1 0)

  (setvar "osmode" osmodeprev)
  (setvar "orthomode" orthoprev)
  (setvar "clayer" layerprev)			;zmienia na poprz warstwe			
  (princ)
)