					;=====================================================
(defun c:rozstaw_prety ()		;(/ temp_selection)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana ")
  )
  (setq layerprev (getvar "clayer"))
  (setq osmodeprev (getvar "osmode"))
  (setq orthomodeprev (getvar "orthomode"))
  (setq temp_selection (ssadd))

  (setq ent (nentsel "\n Wska¿ prêt do rozmieszczenia: "))
  (setq ent (entget (car ent)))		;cala entycja
  (setq pick_pt (cdr (assoc 10 ent)))
  (setq pret_zrodlowy_ename (cdr (car ent)))
					;dodawany do temp_selection na koncu jka polecenie wykona sie bez problmeow

  (setq pt1 (getpoint "\n Wska¿ pierwszy punkt kierunkowy: "))
  (setq pt2 (getpoint "\n Wska¿ drugi punkt kierunkowy: " pt1))
  (initget 3)
  (setq rozstaw (getreal "\n Podaj rozstaw prêtów: "))
					; zrobic w okienku

  (setvar "clayer" warwym)
  (setvar "osmode" 0)
  (setvar "orthomode" 0)

  (setq dist_between_rods (abs (- (car pt2) (car (trans pick_pt 0 1)))))
					;odleglosc miedzy pretem a ostatnim punktem po osi X
  (setq liczba_elementów (1+ (fix (/ dist_between_rods rozstaw))))
					;calkowita liczba pretow

  (command "_ucs" "_new" "3" pt1 pt2 "")

  (setq pick_pt (trans pick_pt 0 1))	;punkt bazowy
  (setq	target_pt (list	(+ (car pick_pt) rozstaw)
			(cadr pick_pt)
			(caddr pick_pt)
		  )
  )					;punkt gdzi ema skopiowac 

  (repeat liczba_elementów
    (command "_copy" (nentselp pick_pt) "" pick_pt target_pt)
					;kopiowanie
    (ssadd (entlast) temp_selection)
    (setq target_pt (list (+ (car target_pt) rozstaw)
			  (cadr target_pt)
			  (caddr target_pt)
		    )
    )					;dodaj rozstaw
  )

  (defun *error* (errorlevel)
    (setvar "osmode" osmodeprev)
    (setvar "orthomode" orthomodeprev)
    (setvar "clayer" layerprev)
    (command "_ucs" "_previous")
    (command "_erase" temp_selection "")
    (princ "\n MadziCAD error: Funkcja przerwana ")
  )


  (setq last_pick_pt (cdr (assoc 10 (entget (entlast)))))
  (command "_dimaligned"
	   pick_pt
	   (trans last_pick_pt 0 1)
	   pause
  )					;wymiar rozstawu
  (ssadd (entlast) temp_selection)
  (setq ent (entget (entlast)))
  (setq	ent
	 (subst
	   (cons 1
		 (strcat (rtos liczba_elementów)
			 "x"
			 (rtos (/ rozstaw 10))
			 "=<>"
		 )
	   )				;zmienoiny tekst typu 2x20=40
	   (assoc 1 ent)
	   ent
	 )
  )
  (entmod ent)

  (ssadd pret_zrodlowy_ename temp_selection) ;dodanie pierwzego preta

  (generuj_losowa_nazwe "rozstaw_pretow")
  (command "_group" "_create" losowa_nazwa "" temp_selection "")
					;tworzeni grupy

  (command "_ucs" "_previous")
  (setvar "osmode" osmodeprev)
  (setvar "orthomode" orthomodeprev)
  (setvar "clayer" layerprev)


  (princ "\n Utworzono rozstaw prêtów. ")
  (princ)
)






