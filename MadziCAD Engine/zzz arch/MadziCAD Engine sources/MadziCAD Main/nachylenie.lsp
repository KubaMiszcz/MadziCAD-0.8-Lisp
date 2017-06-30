;; Funkcja wstawia strzalke i wartosc spadku w [%]
;;
;; kuba miszcz 2007 :]

(defun c:nachylenie(/ layerprev osmodeprev orthoprev skala pt1 pt2 tan_angle anglerad angledeg strzalka spadek spadektxt pkt temp_selection ostatni_tekst ent_text ent_strzalka insert_pt insert_pt_luw)
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
  (if (/= (tblsearch "layer" warwym) nil)
    (setvar "clayer" warwym)          			;ustala akt warstwe na 'wymiary'
  )
  (setq skala (getvar "dimscale"))	;skala wstawiania
  
  (setvar "orthomode" 0)  
  (setq pt1 (getpoint "\n Wska¿ pierwszy punkt: "))
  (initget 137)
  (setq pt2 (getpoint pt1 "\n Wska¿ drugi punkt, lub podaj wartoœæ nachylenia 1:<x> (ujemn¹ dla nachylenia w dó³): "))
  (if 
    (= (listp pt2) nil)
    (progn
      (setq spadek (atof pt2))
      (setq ucs_angle (cvunit (atan (/ spadek 100)) "radians" "degrees"))
      (setvar "orthomode" 1)
      (setvar "clayer" layerprev)
      (command "_line" 
        pt1
        (progn
          (princ "\n Wska¿ zasiêg linii (w poziomie). ")
          pause
        )
        ""
      )
      
      (if (/= (tblsearch "layer" warwym) nil)
        (setvar "clayer" warwym)          			;ustala akt warstwe na 'wymiary'
      )
      
      (setq entlist (entget (entlast)))
      (setq pt1 (cdr (assoc 10 entlist)))
      (setq pt2 (cdr (assoc 11 entlist)))
      (setq dist (abs (- (car pt2) (car pt1))))
      (setq height (* dist (/ 1 spadek )))    ;to spadek to jest naachylenie
      (setq pt2 (list (car pt2) (+ (cadr pt1) height)))
      (setq entlist
        (subst 
          (cons 11 pt2) 
          (assoc 11 entlist) 
          entlist
        )
      )
      (entmod entlist)
      (entmake (entget (entlast)))
    )
    (progn
      (command "_line" 
        pt1
        pt2
        ""
      )
    )
  )

  (setq pt1 (cdr (assoc 10 (entget (entlast)))))		;pt1 w GUW
  (setq pt1 (trans pt1 0 1))					;;pt1 z GUW do LUW  
  (setq pt2 (cdr (assoc 11 (entget (entlast)))))		;pt2 w GUW
  (setq pt2 (trans pt2 0 1))					;;pt2 z GUW do LUW 
  (command "_erase" (entlast) "")
  
  (setq tan_angle (/ (- (cadr pt2) (cadr pt1)) (- (car pt2) (car pt1))))
  (setq anglerad (atan tan_angle))
  (setq angledeg (cvunit anglerad "radians" "degrees"))   ;kat w stopniach

  (setq nachylenie (abs (/ 1 tan_angle )))                    ;tangens kata = spadek -> 1:XX
  (setq nachylenietxt (strcat "1:" (rtos nachylenie 2 dokl_nachylenia)))		;dokladnosc nachylenia  
  
  ;ustalenie kierunku strzalki
  (setvar "osmode" 0)
  
  (setq temp_selection (ssadd))

  (command "_point" pt1)
  (ssadd (entlast) temp_selection)
  (command "_point" pt2)
  (ssadd (entlast) temp_selection)

  (command "_mtext" 
           '(0 0)
           "_justify" "_mc"
           "_height" (* txta skala) 
           "_rotation" angledeg
           '(0 0)
           nachylenietxt
           ""
  )
  (setvar "orthomode" 0)
(command "_move" (entlast) "" '(0 0) pause)
  
  (setq ostatni_tekst (entlast))
  
  (if (= automatyczne_dodawanie_maski_tla_do_tekstow 1)
    (progn
      (setq entlist (entget ostatni_tekst))
      (setq entlist   
        (append
          entlist
          (list (cons 90 3))       ;dodanie maski 
          (list (cons 63 256))     ;ustawienie maski jak tlo rysuku
          (list (cons 45 rozmiar_maski_w_tekstach))     ;ustawienie rozmiaru maski 1.1        
        )
      )
      (entmod entlist)
    )
  )
    
  (ssadd (entlast) temp_selection)
 ; (setq ent_text (entget(entlast)))

  (generuj_losowa_nazwe "MadziCAD_nachylenie")
  ;(command "_block" losowa_nazwa '(0 0) temp_selection "")
  (command "_group" "_create" losowa_nazwa "MadziCAD" temp_selection "")  ;to madzicad to jest opis grupy

;;;  (defun *error* (errorlevel)
;;;    (setvar "clayer" layerprev)			;zmienia na poprz warstwe
;;;    (setvar "osmode" osmodeprev)
;;;    (setvar "orthomode" orthoprev)
;;;    (command "_purge" "_blocks" losowa_nazwa "_no")
;;;    (princ "\n MadziCAD error: Funkcja przerwana. ")
;;;  )

  (princ (strcat "\n Dok³adna wartoœæ nachylenia 1:" (rtos nachylenie)))  
  
;;;  (command "_insert" losowa_nazwa (progn (princ "\n Wska¿ po³o¿enie opisu: ") pause) 1 1 0)
;;;  (setq insert_pt (cdr (assoc 10 (entget (entlast)))))
;;;  (setq insert_pt_luw (trans insert_pt 0 1))  ; guw->luw
;;;  (entdel (entlast))
;;;  
;;;  (setq ent_text (subst (cons 10 insert_pt) (assoc 10 ent_text) ent_text))
;;;  (entmake ent_text)
;;;  (ssadd (entlast) temp_selection)
  
;;;  (command "_block" losowa_nazwa "_yes" insert_pt_luw temp_selection "")
;;;  (command "_insert" losowa_nazwa insert_pt_luw 1 1 0)
  
  (setvar "osmode" osmodeprev)
  (setvar "orthomode" orthoprev)
  (setvar "clayer" layerprev)			;zmienia na poprz warstwe			
  (princ)
)