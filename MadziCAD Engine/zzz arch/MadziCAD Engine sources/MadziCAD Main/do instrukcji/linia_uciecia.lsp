;;poprawic paramter w trim na angielski
(defun c:linia_uciecia(/ layerprev coords skala pkt1 pkt2 osmodeprev pkt3x pkt3y pkt3 dist trim_edge entlist vertlist n)
  (defun *error* (errorlevel)
    (setvar "clayer" layerprev)			;zmienia na poprz warstwe
    (setvar "osmode" osmodeprev)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
;;=========
  (graphscr)
  (setq layerprev (getvar "clayer"))			;zapamietuje biezaca warstwe
  (setq osmodeprev (getvar "osmode"))
  (if (/= (tblsearch "layer" warwym) nil)
    (setvar "clayer" warwym)          			;ustala akt warstwe na 'wymiary'
  )
  (setq skala (getvar "dimscale"))		;skala wstawiania

  (setq pkt1 (getpoint "\n Wska¿ punkty uciêcia: "))
  (setq pkt2 (getpoint "\n Wska¿ punkty uciêcia: " pkt1))
  (setvar "osmode" 0)

;*****ustalenie srodka tymczaswego LUW
(midpt pkt1 pkt2)  ;moja funckja do znajdowania srodka

(command "_insert" "MadziCAD_linia_uciecia" "_scale" skala "_rotate" 0 midpt)
(command "_pline" pkt1 pkt2 "")


  ;;;
  ;;;
  ;;;DOKONCZY i przeorbic
  ;;;
  ;;;








  

  
  (setq pkt3x (/ (+ (car pkt1) (car pkt2)) 2))
  (setq pkt3y (/ (+ (cadr pkt1) (cadr pkt2)) 2))
  (setq pkt3 (list pkt3x pkt3y))				;pkt3 w LUW
  (setq dist (sqrt (+ (expt (- (car pkt1) (car pkt2)) 2) (expt (- (cadr pkt1) (cadr pkt2)) 2))))
  (command "_ucs" "_new" "3" pkt3 pkt2 "")

  (command "_pline" 
    (list (- 0 (/ dist 2) (* 500 skala)) 0)
    (list (- 0 (/ dist 2)) 0)
    (list (* -300 skala) 0)
    (list (* -150 skala) (* 1200 skala))
    (list 0 0)       ;srodek linii
    (list (* 150 skala) (* -1200 skala)) 
    (list (* 300 skala) 0) 
    (list (+ 0 (/ dist 2)) 0)
    (list (+ 0 (/ dist 2) (* 500 skala)) 0)
    ""
  )
  (setq trim_edge (entlast))
  (command "_ucs" "_previous")
  (command "_offset" 1 trim_edge (getpoint "\n Wska¿ od ktorej strony ucinaæ obiekty: ") "") 

;;;;;;;;;;;;lista wierzchlkow polilinii 
  (setq entlist (entget (entlast)))
  (setq vertlist (member (assoc 10 entlist) entlist))
  (repeat (cdr (assoc 90 entlist))
    (setq coords (cons (cdar vertlist) coords) vertlist (cddddr vertlist))
  )
;;;;;;;;;;;
  (entdel (entlast))

  (setq n (- (length coords) 1))
  (repeat n
    (setq pkt1 (trans (nth n coords) 0 1))
    (setq pkt2 (trans (nth (- n 1) coords) 0 1))
    (command "_trim" trim_edge "" "_fence" pkt1 pkt2 "" "")
    (command "_trim" trim_edge "" "_fence" pkt1 pkt2 "" "")    
    (command "_trim" trim_edge "" "_fence" pkt1 pkt2 "" "")
    (command "_trim" trim_edge "" "_fence" pkt1 pkt2 "" "")
    (command "_trim" trim_edge "" "_fence" pkt1 pkt2 "" "")
    (command "_trim" trim_edge "" "_fence" pkt1 pkt2 "" "")
    (setq n (- n 1))
  )

  ;******KONCZENIE POLECENIA
  (setvar "osmode" osmodeprev)
  (setvar "clayer" layerprev)			;zmienia na poprz warstwe

  (princ)
)