(defun c:tworz_opis_preta_w_widoku (/
				    layerprev
				    filletradprev
				    osmodeprev
				    numer_preta
				    pkt1
				    ksztalt_preta
				    dlugosc_preta_string
				    srednica_preta_string
				    pkt2
				    skala
				    punkt_wstawienia
				   )	;tworzenie preta
  (defun *error* (errorlevel)
    (setvar "osmode" osmodeprev)
    (setvar "orthomode" orthomodeprev)
    (setvar "clayer" layerprev)
    (princ "\n MadziCAD error: Funkcja przerwana ")
  )

  (setq layerprev (getvar "clayer"))
  (setq osmodeprev (getvar "osmode"))
  (setq orthomodeprev (getvar "orthomode"))
  (setvar "clayer" warwym)
  (setvar "osmode" 0)
  (setvar "orthomode" 0)
  (setq temp_selection (ssadd))
					;dane preta
  (princ "\n Wska¿ prêt w widoku: ")
  (setq ksztalt_preta (nentsel))	;nazwa entycji preta + srodek ciezkosci
  (setq punkt_wstawienia (cadr ksztalt_preta)) ;nazwa entycji preta
  (setq ksztalt_preta (car ksztalt_preta)) ;nazwa entycji preta
  (setq	numer_preta
	 (cdr
	   (nth	1
		(cdadr
		  (assoc -3 (entget ksztalt_preta '("madzicad")))
		)
	   )
	 )
  )
  (setq	klasa_stali
	 (cdr
	   (nth	2
		(cdadr
		  (assoc -3 (entget ksztalt_preta '("madzicad")))
		)
	   )
	 )
  )
  (princ klasa_stali)

					;tworzenie opisu				
					;(rtos (cdr (assoc 43 (entget (ssname ksztalt_preta 0)))))
  (setq	srednica_preta_string
	 (strcat
	   "%<\\AcObjProp Object(%<\\_ObjId "
	   (itoa (vla-get-ObjectId
		   (vlax-ename->vla-object
		     ksztalt_preta
		   )
		 )
	   )
	   ">%).ConstantWidth \\f \"%lu2%pr0%ps[%%c,]\">%"
	 )
  )


;;; WERSJA POD ACAD 2005 OBADAC TO JESZCZE
;;;
;;;  (setq	srednica_preta_string
;;;	 (strcat "%%c"
;;;		 "%<\\AcObjProp Object(%<\\_ObjId "
;;;		 (itoa (vla-get-ObjectId
;;;			 (vlax-ename->vla-object
;;;			   ksztalt_preta
;;;			 )
;;;		       )
;;;		 )
;;;		 ">%).ConstantWidth \f \"%.30q0\">%"  
;;;	 )
;;;  )


  (princ "\n Wska¿ punkt wstawienia opisu: ")

  (setq skala (* (getvar "dimscale") 1)); to w koncu 1000 czy jedne bo juz sam nie wiem:]
					;(setq punkt_wstawienia (trans (cdr (assoc 10 (entget ksztalt_preta))) 0 1))
					;(command "_insert" "MadziCAD_opis_preta_w_widoku" (cdr (assoc 10 (entget ksztalt_preta))) skala skala 0 srednica_preta_string numer_preta)
  (command "_insert"		  "MadziCAD_opis_preta_w_widoku"
	   punkt_wstawienia	  skala
	   skala		  0
	   srednica_preta_string  numer_preta
	  )
  (ssadd (entlast) temp_selection)
  (command "_move" (entlast) "" punkt_wstawienia pause)


  (setq pkt2 (getvar "lastpoint"))
  (setvar "osmode" osmodeprev)
  (setq pkt1 (getpoint pkt2))
  (setvar "osmode" 0)
  (command "_leader" pkt1 pkt2 "" "" "b")
  (ssadd (entlast) temp_selection)

  (generuj_losowa_nazwe "opis_preta_w_widoku")
  (command "_group" "_create" losowa_nazwa "" temp_selection "")


					;  (setq block_name (strcat "pret nr " (rtos numer_preta)))
					;  (command "_block" block_name pkt1 (ssadd ksztalt_preta) (ssadd (entlast)) "")
					;  (command "_insert" block_name pkt1 1 1 0)
  (setvar "osmode" osmodeprev)
  (setvar "orthomode" orthomodeprev)
  (setvar "clayer" layerprev)

					;(command "_regen")
					;(alert (strcat "\n Prêt numer " (rtos numer_preta) " utworzono. "))
  (princ)
)



