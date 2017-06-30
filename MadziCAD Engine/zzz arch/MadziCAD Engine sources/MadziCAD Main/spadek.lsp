;; Funkcja wstawia strzalke i wartosc spadku w [%]
;;
;; kuba miszcz 2007 :]

(defun c:spadek	(/	       layerprev     osmodeprev
		 orthoprev     skala	     pt1
		 pt2	       tan_angle     anglerad
		 angledeg      strzalka	     spadek
		 spadektxt     pkt	     temp_selection
		 ostatni_tekst ent_text	     ent_strzalka
		 insert_pt     insert_pt_luw
		)
  (defun *error* (errorlevel)
    (setvar "clayer" layerprev)		;zmienia na poprz warstwe
    (setvar "osmode" osmodeprev)
    (setvar "orthomode" orthoprev)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)

  (setq layerprev (getvar "clayer"))	;zapamietuje biezaca warstwe
  (setq osmodeprev (getvar "osmode"))	;zapamietuje stale tryby lokalizacji
  (setq orthoprev (getvar "orthomode"))	;zapamietuje status orto
  (if (/= (tblsearch "layer" warwym) nil)
    (setvar "clayer" warwym)		;ustala akt warstwe na 'wymiary'
  )
  (setq skala (getvar "dimscale"))	;skala wstawiania

  (setvar "orthomode" 0)
  (setq pt1 (getpoint "\n Wska¿ pierwszy punkt: "))
  (initget 137)				;co to?
  (setq	pt2
	 (getpoint
	   pt1
	   "\n Wska¿ drugi punkt, lub podaj wartoœæ spadku (ujemn¹ dla spadku w dó³): "
	 )
  )


  (if
    (= (listp pt2) nil)			;jesli prawda to zamiast punktu podano wartosc spadku
     (progn
       (setq spadek (atof pt2))
       (setq
	 ucs_angle (cvunit (atan (/ spadek)) "radians" "degrees")
       )
       (setvar "orthomode" 1)
       (setvar "clayer" layerprev)
       (command	"_line"
		pt1
		(progn
		  (princ "\n Wska¿ zasiêg linii (w poziomie). ")
		  pause
		)
		""
       )				;narysowal pozioma linie 

       (if (/= (tblsearch "layer" warwym) nil)
	 (setvar "clayer" warwym)	;ustala akt warstwe na 'wymiary'
       )

       (setq entlist (entget (entlast))) ;entycja poziomej linii
       (setq pt1 (cdr (assoc 10 entlist)))
       (setq pt2 (cdr (assoc 11 entlist)))
       (setq dist (abs (- (car pt2) (car pt1))))
       (setq height (* dist (/ spadek 100)))
       (setq pt2 (list (car pt2) (+ (cadr pt1) height)))
       (setq entlist
	      (subst
		(cons 11 pt2)
		(assoc 11 entlist)
		entlist
	      )
       )
       (entmod entlist)			;zrobienie z poziomej linii linii o zadanym spadku
	(entmake (entget (entlast)))	;tutaj rysuje t alinie jeszcze raz bo pozniej kasuje wiec jak sa dwie to jedna zostanie
     )
     (progn				;nie podano teksu tylko wksazano punkt wiec rysuje linie 
       (command	"_line"
		pt1
		pt2
		""
       )
     )
  )

;;;;===============================
  (setq temp_selection (ssadd))

  (setq pt1 (cdr (assoc 10 (entget (entlast))))) ;pt1 w GUW
  (setq pt1 (trans pt1 0 1))		;pt1 z GUW do LUW  
  (setq pt2 (cdr (assoc 11 (entget (entlast))))) ;pt2 w GUW
  (setq pt2 (trans pt2 0 1))		;pt2 z GUW do LUW 
  (command "_erase" (entlast) "")


  (setq tan_angle (/ (- (cadr pt2) (cadr pt1)) (- (car pt2) (car pt1))))
  (setq anglerad (atan tan_angle))
  (setq angledeg (cvunit anglerad "radians" "degrees"))
					;kat w stopniach

  (setq spadek (abs (* 100 tan_angle)))	;100% * tangens kata = spadek
  (setq spadektxt (strcat (rtos spadek 2 dokl_spadku) "%"));dokladnosc spadku
  (princ (strcat "\n Dok³adna wartoœæ spadku: " (rtos spadek)))
					

		

			
  (if	;ustalenie kierunku strzalki			
    (> angledeg 0)
     (setq kierunek_spadku "lewo")
     (setq kierunek_spadku "prawo")
  )

  (setvar "osmode" 0)

  (if (/= (tblsearch "block" blok_spadek_w_lewo) nil)
    (cond ((= kierunek_spadku "lewo");bloki istnieja wiec wsatwianie strzalki i jej obrot o opdowiedni kat
	   (command "_insert"	blok_spadek_w_lewo    "_scale"	skala
		    "_rotate"	angledeg    '(0 0)	spadektxt
		   )
		   (ssadd (entlast) temp_selection)
	  )
	  ((= kierunek_spadku "prawo")
	   (command "_insert"	blok_spadek_w_lewo    "_scale"	skala
		    "_rotate"	(* angledeg -1)    '(0 0)	spadektxt
		   )
	   (command "_mirror" (entlast) "" '(0 0) '(0 10) "_yes")
	   (ssadd (entlast) temp_selection)
	  )
    )
  )

  (setvar "orthomode" 0)
  (command "_move" (entlast) "" '(0 0) pause)


  (generuj_losowa_nazwe "MadziCAD_spadek")
  (princ (strcat "\n Dok³adna wartoœæ spadku: " (rtos spadek)))




  (command "_point" pt1)		;rysowanie punktow
  (ssadd (entlast) temp_selection)
  (command "_point" pt2)
  (ssadd (entlast) temp_selection)

  (command "_group" "_create" losowa_nazwa "" temp_selection "")


  (setvar "osmode" osmodeprev)
  (setvar "orthomode" orthoprev)
  (setvar "clayer" layerprev)		;zmienia na poprz warstwe			
  (princ)
)