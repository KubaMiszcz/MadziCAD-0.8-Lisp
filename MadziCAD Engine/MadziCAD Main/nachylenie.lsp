;; Funkcja wstawia strzalke i wartosc spadku w [%]
;;
;; kuba miszcz 2007 :]

(defun c:nachylenie(/ layerprev osmodeprev orthoprev skala pkt1 pkt2 tan_angle anglerad angledeg nachylenie nachylenietxt pkt)
  (defun *error* (errorlevel)
    (setvar "clayer" layerprev)			;zmienia na poprz warstwe
    (setvar "osmode" osmodeprev)
    (setvar "orthomode" orthoprev)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq layerprev (getvar "clayer"))				;zapamietuje biezaca warstwe
  (setq osmodeprev (getvar "osmode"))				;zapamietuje stale tryby lokalizacji
  (setq orthoprev (getvar "orthomode"))				;zapamietuje status orto
  (setvar "clayer" warwym)				;ustala akt warstwe na 'wymiary'
  (setq skala (/ (getvar "dimscale") 100))			;skala wstawiania
  (setq errorlevel "0")
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
  
  (setq nachylenie (abs (/ 1 tan_angle )))                    ;tangens kata = spadek -> 1:XX
  (setq nachylenietxt (rtos nachylenie 2 dokl_nachylenia))		;dokladnosc nachylenia
  (if (< nachylenie 1)
      (setq nachylenietxt (strcat "1:0" nachylenietxt))
      (setq nachylenietxt (strcat "1:" nachylenietxt))
  )
  (setvar "osmode" 0)
  (command "_mtext" 
           '(0 0)
           "w" "cs"
           "k" (* txta skala 100) 
           "b" angledeg
           '(0 0)
           nachylenietxt
           ""
  )
  
  (generuj_losowa_nazwe "nachylenie")
  (command "_block" losowa_nazwa '(0 0) (entlast) "")
  
  (defun *error* (errorlevel)
    (setvar "clayer" layerprev)			;zmienia na poprz warstwe
    (setvar "osmode" osmodeprev)
    (setvar "orthomode" orthoprev)
    (command "_purge" "o" losowa_nazwa "n")
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  
  (command "_insert" losowa_nazwa (progn (princ "\n Wska¿ polozenie opisu: ") pause) 1 1 0)
  (command "_explode" (entlast))
  (command "_purge" "o" losowa_nazwa "n")
  
  (setvar "osmode" osmodeprev)
  (setvar "orthomode" orthoprev)
  (setvar "clayer" layerprev)			;zmienia na poprz warstwe
  (setq errorlevel "0")
  (princ)
)