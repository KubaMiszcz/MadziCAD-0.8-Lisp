;;;; PARAMETRY FIZYCZNE 
(defun c:przekroj_zespolony (/		   osmodeprev	 orthoprev     boundary_ss   hatch_ss	   temp_ss	 kat_kreskowania
			     pkt	   dim1		 dim2	       skala_kreskowania	   boundary_sslist	       hatch_sslist
			     area	   momentofinertia	       centroid	     principaldirections	 principalangle
			     properties	   pt1		 pt2	       entlist	     centroid_a	   centroid_b	 centroid_c    Jx_a
			     Jx_b	   Jx_c		 Jx_a	       Jx_b	     Jx_c	   pole_a	 pole_b	       pole_c
			     pole_zespolonego		 Jx_zespolonego		     Jx_zespolonego		 ea	       eb
			     ec		   dcl_id	 cnt	       what_next
			    )

  (defun *error* (errorlevel)
    (if	(not (null obszar_a))
      (entdel obszar_a)
    )
    (if	(not (null obszar_b))
      (entdel obszar_b)
    )
    (if	(not (null obszar_c))
      (entdel obszar_c)
    )
    (if	(not (null obszar_d))
      (entdel obszar_d)
    )
    (if	(not (null os_zespolona))
      (entdel os_zespolona)
    )
    (setvar "osmode" osmodeprev)
    (setvar "orthomode" orthoprev)
    (princ "\n MadziCAD error: Funkcja przerwana. "
    )
    (princ)
  )

  (graphscr)
  (setq osmodeprev (getvar "osmode"))	;zapamietuje stale tryby lokalizacji
  (setq orthoprev (getvar "orthomode"))	;zapamietuje status orto
  (setvar "osmode" 0)
  (setvar "orthomode" 0)

  (setq ea 205.0)
  (setq obszar_a nil)
  (setq na (/ ea ea))
  (setq pole_a 0.00)
  (setq Jx_a 0.00)
  (setq centroid_a '(0 0 0))

  (setq eb 32.6)
  (setq obszar_b nil)
  (setq nb (/ ea eb))
  (setq pole_b 0.00)
  (setq Jx_b 0.00)
  (setq centroid_b '(0 0 0))

  (setq ec 210.0)
  (setq obszar_c nil)
  (setq nc (/ ea ec))
  (setq pole_c 0.00)
  (setq Jx_c 0.00)
  (setq centroid_c '(0 0 0))

  (setq ed 210.0)
  (setq obszar_d nil)
  (setq nd (/ ea ed))
  (setq pole_d 0.00)
  (setq Jx_d 0.00)
  (setq centroid_d '(0 0 0))

  (setq pole_zespolonego 0.00)
  (setq Jx_zespolonego 0.00)
  (setq os_zespolona nil)


  (setq moment_zginajacy 0.00)
  (setq sila_osiowa 0.00)

  (setq moment_zginajacy_a 0.00)
  (setq moment_zginajacy_b 0.00)
  (setq moment_zginajacy_c 0.00)
  (setq moment_zginajacy_d 0.00)

  (setq sila_osiowa_a 0.00)
  (setq sila_osiowa_b 0.00)
  (setq sila_osiowa_c 0.00)
  (setq sila_osiowa_d 0.00)

  (setq sigma_gw_a 0.00)
  (setq sigma_dw_a 0.00)
  (setq sigma_gw_b 0.00)
  (setq sigma_dw_b 0.00)
  (setq sigma_gw_c 0.00)
  (setq sigma_dw_c 0.00)
  (setq sigma_gw_d 0.00)
  (setq sigma_dw_d 0.00)

  (setq gorne_wlokna_a 0.00)
  (setq dolne_wlokna_a 0.00)
  (setq gorne_wlokna_b 0.00)
  (setq dolne_wlokna_b 0.00)
  (setq gorne_wlokna_c 0.00)
  (setq dolne_wlokna_c 0.00)
  (setq gorne_wlokna_d 0.00)
  (setq dolne_wlokna_d 0.00)






  (setq
    dcl_id (load_dialog (strcat  "\\przekroj_zespolony.dcl"))
  )					;Load the dialog box.
  (setq what_next 2)
  (setq cnt 1)
  (while (>= what_next 2)		;Begin display loop.
    (if
      (null (new_dialog "przekroj_zespolony" dcl_id "" '(650 100))
      )
					;Initialize dialog box, exit if nil returned.
       (exit)
    )

;;; OKIENKO SET
    (set_tile "ea" (rtos ea 2 2))
    (set_tile "na" (rtos na 2 2))
    (set_tile "pole_a" (rtos pole_a 2 2))
    (set_tile "Jx_a" (rtos Jx_a 2 2))

    (set_tile "eb" (rtos eb 2 2))
    (set_tile "nb" (rtos nb 2 2))
    (set_tile "pole_b" (rtos pole_b 2 2))
    (set_tile "Jx_b" (rtos Jx_b 2 2))

    (set_tile "ec" (rtos ec 2 2))
    (set_tile "nc" (rtos nc 2 2))
    (set_tile "pole_c" (rtos pole_c 2 2))
    (set_tile "Jx_c" (rtos Jx_c 2 2))

    (set_tile "ed" (rtos ed 2 2))
    (set_tile "nd" (rtos nd 2 2))
    (set_tile "pole_d" (rtos pole_d 2 2))
    (set_tile "Jx_d" (rtos Jx_d 2 2))

    (set_tile "pole_zespolonego" (rtos pole_zespolonego 2 2))
    (set_tile "Jx_zespolonego" (rtos Jx_zespolonego 2 2))

    (set_tile "moment_zginajacy" (rtos moment_zginajacy 2 2))
    (set_tile "sila_osiowa" (rtos sila_osiowa 2 2))



    (set_tile "moment_zginajacy_a"
	      (rtos moment_zginajacy_a 2 2)
    )
    (set_tile "moment_zginajacy_b"
	      (rtos moment_zginajacy_b 2 2)
    )
    (set_tile "moment_zginajacy_c"
	      (rtos moment_zginajacy_c 2 2)
    )
    (set_tile "moment_zginajacy_d"
	      (rtos moment_zginajacy_d 2 2)
    )

    (set_tile "sila_osiowa_a"
	      (rtos sila_osiowa_a 2 2)
    )
    (set_tile "sila_osiowa_b"
	      (rtos sila_osiowa_b 2 2)
    )
    (set_tile "sila_osiowa_c"
	      (rtos sila_osiowa_c 2 2)
    )
    (set_tile "sila_osiowa_d"
	      (rtos sila_osiowa_d 2 2)
    )


    (set_tile "sigma_gw_a" (rtos sigma_gw_a 2 2))
    (set_tile "sigma_dw_a" (rtos sigma_dw_a 2 2))
    (set_tile "sigma_gw_b" (rtos sigma_gw_b 2 2))
    (set_tile "sigma_dw_b" (rtos sigma_dw_b 2 2))
    (set_tile "sigma_gw_c" (rtos sigma_gw_c 2 2))
    (set_tile "sigma_dw_c" (rtos sigma_dw_c 2 2))
    (set_tile "sigma_gw_d" (rtos sigma_gw_d 2 2))
    (set_tile "sigma_dw_d" (rtos sigma_dw_d 2 2))



;;; actions
    (action_tile
      "accept"
      "(done_dialog 1)"
    )
    (action_tile
      "wskaz_obszar_a"
      "(done_dialog 3)"
    )
    (action_tile
      "wskaz_obszar_b"
      "(done_dialog 4)"
    )
    (action_tile
      "wskaz_obszar_c"
      "(done_dialog 5)"
    )
    (action_tile
      "wskaz_obszar_d"
      "(done_dialog 6)"
    )

    (action_tile
      "ea"
      "(setq ea (atof (get_tile \"ea\")))(done_dialog 10)"
    )
    (action_tile
      "eb"
      "(setq eb (atof (get_tile \"eb\")))(done_dialog 10)"
    )
    (action_tile
      "ec"
      "(setq ec (atof (get_tile \"ec\")))(done_dialog 10)"
    )
    (action_tile
      "ed"
      "(setq ed (atof (get_tile \"ed\")))(done_dialog 10)"
    )


    (action_tile
      "moment_zginajacy"
      "(setq moment_zginajacy (atof (get_tile \"moment_zginajacy\")))(done_dialog 10)"
    )

    (action_tile
      "sila_osiowa"
      "(setq sila_osiowa (atof (get_tile \"sila_osiowa\")))(done_dialog 10)"
    )



    (action_tile
      "help"
      "(przekroj_zespolony_help)"
    )
    (action_tile
      "info"
      "(przekroj_zespolony_info)(done_dialog 10)"
    )


    (setq what_next (start_dialog))	; Display the dialog

    (cond
;;;przekroj A
      ((= what_next 3)			;Prompt user to

       (if (not (null obszar_a))
	 (entdel obszar_a)
       )
       (if (not (null os_zespolona))
	 (entdel os_zespolona)
       )


       (tworzenie_wlasciwosci "ansi38" 140)

       (setq obszar_a obszar)
       (setq gorne_wlokna_a gorne_wlokna)
       (setq dolne_wlokna_a dolne_wlokna)
       (setq pole_a (/ area 100))	; cm2
       (setq Jx_a
	      (/ (car momentofinertia) 10000)
       )
       (setq centroid_a centroid)
       (charakterystyki_zespolonego)
       (obliczanie_momentow)
       (obliczanie_naprezen)



      )
;;;przekroj B      
      ((= what_next 4)			;Prompt user to
       (progn
	 (if (not (null obszar_b))
	   (entdel obszar_b)
	 )
	 (if (not (null os_zespolona))
	   (entdel os_zespolona)
	 )

	 (tworzenie_wlasciwosci "ansi33" 32)
	 (setq obszar_b obszar)
	 (setq gorne_wlokna_b gorne_wlokna)
	 (setq dolne_wlokna_b dolne_wlokna)

	 (setq pole_b (/ area 100))	; cm2
	 (setq Jx_b
		(/ (car	momentofinertia
		   )
		   10000
		)
	 )
	 (setq centroid_b centroid)

	 (charakterystyki_zespolonego)
	 (obliczanie_momentow)
	 (obliczanie_naprezen)

       )
      )
;;;przekroj C
      ((= what_next 5)			;Prompt user to
       (progn
	 (if (not (null obszar_c))
	   (entdel obszar_c)
	 )
	 (if (not (null os_zespolona))
	   (entdel os_zespolona)
	 )

	 (tworzenie_wlasciwosci "ansi37" 75)
	 (setq obszar_c obszar)

	 (setq gorne_wlokna_c gorne_wlokna)
	 (setq dolne_wlokna_c dolne_wlokna)

	 (setq pole_c (/ area 100))	; cm2
	 (setq Jx_c
		(/ (car	momentofinertia
		   )
		   10000
		)
	 )
	 (setq centroid_c centroid)
	 (charakterystyki_zespolonego)
	 (obliczanie_momentow)
	 (obliczanie_naprezen)
       )
      )

      ((= what_next 6)			;Prompt user to
       (progn
	 (if (not (null obszar_d))
	   (entdel obszar_d)
	 )
	 (if (not (null os_zespolona))
	   (entdel os_zespolona)
	 )

	 (tworzenie_wlasciwosci "ansi34" 140)
	 (setq obszar_d obszar)

	 (setq gorne_wlokna_d gorne_wlokna)
	 (setq dolne_wlokna_d dolne_wlokna)

	 (setq pole_d (/ area 100))	; cm2
	 (setq Jx_d
		(/ (car momentofinertia) 10000)
	 )
	 (setq centroid_d centroid)
	 (charakterystyki_zespolonego)
	 (obliczanie_momentow)
	 (obliczanie_naprezen)


       )
      )


      ((= what_next 10)			;Prompt user to
       (progn
	 (setq na (/ ea ea))
	 (setq nb (/ ea eb))
	 (setq nc (/ ea ec))
	 (setq nd (/ ea ed))
	 (if (not (null os_zespolona))
	   (entdel os_zespolona)
	 )
	 (if (/= pole_zespolonego 0)
	   (progn
	     (charakterystyki_zespolonego)
	     (obliczanie_momentow)
	     (obliczanie_naprezen)
	   )
	 )
       )
      )



      ((= what_next 1)

       (command	"_table" "5" "18" "_width" "25"	"_height" "1" '(0 0))
       (en->vl (entget (entlast)))


       (vla-setcellvalue
	 vlobj
	 0
	 0
	 "DANE DLA CA£EGO PRZEKROJU"
       )
;;;wiersz 1
       (vla-setcellvalue vlobj 1 0 " ")
       (vla-setcellvalue vlobj 1 1 "Przekrój A")
       (vla-setcellvalue vlobj 1 2 "Przekrój B")
       (vla-setcellvalue vlobj 1 3 "Przekrój C")
       (vla-setcellvalue vlobj 1 4 "Przekrój D")
;;;wiersz 2
       (vla-setcellvalue vlobj 2 0 "Modu³ Younga:")
       (vla-setcellvalue vlobj 2 1 (strcat (rtos ea 2 2) " GPa"))
       (vla-setcellvalue vlobj 2 2 (strcat (rtos eb 2 2) " GPa"))
       (vla-setcellvalue vlobj 2 3 (strcat (rtos ec 2 2) " GPa"))
       (vla-setcellvalue vlobj 2 4 (strcat (rtos ed 2 2) " GPa"))
;;;wiersz 3

       (vla-setcellvalue vlobj 3 0 "\"n\":")
       (vla-setcellvalue vlobj 3 1 (strcat (rtos na 2 2) " "))
       (vla-setcellvalue vlobj 3 2 (strcat (rtos nb 2 2) " "))
       (vla-setcellvalue vlobj 3 3 (strcat (rtos nc 2 2) " "))
       (vla-setcellvalue vlobj 3 4 (strcat (rtos nd 2 2) " "))
;;;wiersz 4
       (vla-setcellvalue vlobj 4 0 "Pole powierzchni:")
       (vla-setcellvalue
	 vlobj
	 4
	 1
	 (strcat (rtos pole_a 2 2) " cm2")
       )
       (vla-setcellvalue
	 vlobj
	 4
	 2
	 (strcat (rtos pole_b 2 2) " cm2")
       )
       (vla-setcellvalue
	 vlobj
	 4
	 3
	 (strcat (rtos pole_c 2 2) " cm2")
       )
       (vla-setcellvalue
	 vlobj
	 4
	 4
	 (strcat (rtos pole_c 2 2) " cm2")
       )
;;;wiersz 5
       (vla-setcellvalue vlobj 5 0 "Moment bezw³adnoœci:")
       (vla-setcellvalue vlobj 5 1 (strcat (rtos Jx_a 2 2) " cm4"))
       (vla-setcellvalue vlobj 5 2 (strcat (rtos Jx_b 2 2) " cm4"))
       (vla-setcellvalue vlobj 5 3 (strcat (rtos Jx_c 2 2) " cm4"))
       (vla-setcellvalue vlobj 5 4 (strcat (rtos Jx_d 2 2) " cm4"))
;;;wiersz 6

       (vla-mergecells vlobj 6 6 0 4)
       (vla-mergecells vlobj 7 7 1 4)
       (vla-setcellvalue vlobj 7 0 "Moment:")
       (vla-setcellvalue
	 vlobj
	 7
	 1
	 (strcat (rtos moment_zginajacy 2 2) " kNm")
       )
;;;wiersz 7
       (vla-mergecells vlobj 8 8 1 4)
       (vla-setcellvalue vlobj 8 0 "Si³a osiowa:")
       (vla-setcellvalue
	 vlobj
	 8
	 1
	 (strcat (rtos sila_osiowa 2 2) " kN")
       )

       (vla-mergecells vlobj 9 9 0 4)
       (vla-mergecells vlobj 10 10 0 4)
       (vla-SetCellTextHeight vlobj 10 0 2)
       (vla-SetrowHeight vlobj 10 25)

       (vla-setcellvalue vlobj 10 0 "WYNIKI:")

       (vla-mergecells vlobj 11 11 1 4)
       (vla-setcellvalue
	 vlobj
	 11
	 0
	 "Sprowadzone pole powierzchni:"
       )
       (vla-setcellvalue
	 vlobj
	 11
	 1
	 (strcat (rtos pole_zespolonego 2 2) " cm2")
       )
       (vla-mergecells vlobj 12 12 1 4)
       (vla-setcellvalue
	 vlobj
	 12
	 0
	 "Sprowadzony moment bezw³adnoœci:"
       )
       (vla-setcellvalue
	 vlobj
	 12
	 1
	 (strcat (rtos Jx_zespolonego 2 2) " cm4")
       )

       (vla-mergecells vlobj 13 13 0 4)
       (vla-setcellvalue vlobj 14 0 "Momenty w przekrojach:")
       (vla-setcellvalue
	 vlobj
	 14
	 1
	 (strcat (rtos moment_zginajacy_a 2 2) " kNm")
       )
       (vla-setcellvalue
	 vlobj
	 14
	 2
	 (strcat (rtos moment_zginajacy_b 2 2) " kNm")
       )
       (vla-setcellvalue
	 vlobj
	 14
	 3
	 (strcat (rtos moment_zginajacy_c 2 2) " kNm")
       )
       (vla-setcellvalue
	 vlobj
	 14
	 4
	 (strcat (rtos moment_zginajacy_d 2 2) " kNm")
       )

       (vla-setcellvalue vlobj 15 0 "Si³y osiowe w przekrojach:")
       (vla-setcellvalue
	 vlobj
	 15
	 1
	 (strcat (rtos sila_osiowa_a 2 2) " kN")
       )
       (vla-setcellvalue
	 vlobj
	 15
	 2
	 (strcat (rtos sila_osiowa_b 2 2) " kN")
       )
       (vla-setcellvalue
	 vlobj
	 15
	 3
	 (strcat (rtos sila_osiowa_c 2 2) " kN")
       )
       (vla-setcellvalue
	 vlobj
	 15
	 4
	 (strcat (rtos sila_osiowa_d 2 2) " kN")
       )


       (vla-mergecells vlobj 16 16 0 4)
       (vla-mergecells vlobj 17 17 0 4)
       (vla-setcellvalue vlobj 17 0 "Naprê¿enia:")
       (vla-setcellvalue vlobj 18 0 "w³ókna górne:")
       (vla-setcellvalue
	 vlobj
	 18
	 1
	 (strcat (rtos sigma_gw_a 2 2) " MPa")
       )
       (vla-setcellvalue
	 vlobj
	 18
	 2
	 (strcat (rtos sigma_gw_b 2 2) " MPa")
       )
       (vla-setcellvalue
	 vlobj
	 18
	 3
	 (strcat (rtos sigma_gw_c 2 2) " MPa")
       )
       (vla-setcellvalue
	 vlobj
	 18
	 4
	 (strcat (rtos sigma_gw_d 2 2) " MPa")
       )

       (vla-setcellvalue vlobj 19 0 "w³ókna dolne")
       (vla-setcellvalue
	 vlobj
	 19
	 1
	 (strcat (rtos sigma_dw_a 2 2) " MPa")
       )
       (vla-setcellvalue
	 vlobj
	 19
	 2
	 (strcat (rtos sigma_dw_b 2 2) " MPa")
       )
       (vla-setcellvalue
	 vlobj
	 19
	 3
	 (strcat (rtos sigma_dw_c 2 2) " MPa")
       )
       (vla-setcellvalue
	 vlobj
	 19
	 4
	 (strcat (rtos sigma_dw_d 2 2) " MPa")
       )


       (vla-setalignment vlobj 1 5)
       (vla-setcolumnwidth vlobj 0 40)


;;;woersz 0 tytul
       (vla-SetTextHeight vlobj 2 4)
       (vla-SetTextHeight vlobj 4 2)
       (vla-SetTextHeight vlobj 1 2)
       (vla-SetCellTextHeight vlobj 10 0 4)

       (vla-settextstyle vlobj 1 (getvar "textstyle"))
       (vla-settextstyle vlobj 2 (getvar "textstyle"))
       (vla-settextstyle vlobj 4 (getvar "textstyle"))

       (command "_scale" (entlast) "" '(0 0) (getvar "dimscale"))
       (vlax-put-property vlobj 'color 9)


       (vla-SetrowHeight vlobj 14 2)
       (vla-SetrowHeight vlobj 15 2)

       (setq cnt2 0)
       (setq cnt2 0)
       (repeat 20
	 (vla-SetrowHeight vlobj cnt2 2)
	 (setq cnt2 (1+ cnt2))
       )

       (command "_move" (entlast) "" '(0 0) pause)

       (setq cnt2 0)
       (repeat 20
	 (vla-SetrowHeight vlobj cnt2 2)
	 (setq cnt2 (1+ cnt2))
       )

       (princ)

      )






      ((= what_next 0)
       (progn
	 (if (not (null obszar_a))
	   (entdel obszar_a)
	 )
	 (if (not (null obszar_b))
	   (entdel obszar_b)
	 )
	 (if (not (null obszar_c))
	   (entdel obszar_c)
	 )
	 (if (not (null obszar_d))
	   (entdel obszar_d)
	 )
	 (if (not (null os_zespolona))
	   (entdel os_zespolona)
	 )
	 (princ "\n Anulowano.")
       )
      )
    )
  )
  (unload_dialog dcl_id)		; Unload the DCL file.

  (setvar "osmode" osmodeprev)
  (setvar "orthomode" orthoprev)
  (princ)
)









(defun tworzenie_wlasciwosci
			     (styl_kreskowania kolor_materialu / boundary_ss hatch_ss temp_ss kat_kreskowania pkt skala_kreskowania boundary_sslist
			      hatch_sslist)
  (defun *error* (errorlevel)
    (selection_to_list boundary_ss)
    (setq boundary_sslist sslist)
    (selection_to_list hatch_ss)
    (setq hatch_sslist sslist)
    (foreach item boundary_sslist (entdel item))
    (foreach item hatch_sslist (entdel item))
    (if	(not (null obszar_a))
      (entdel obszar_a)
    )
    (if	(not (null obszar_b))
      (entdel obszar_b)
    )
    (if	(not (null obszar_c))
      (entdel obszar_c)
    )
    (if	(not (null obszar_d))
      (entdel obszar_d)
    )
    (if	(not (null os_zespolona))
      (entdel os_zespolona)
    )
    (princ "\n MadziCAD error: Funkcja przerwana. "
    )
    (princ)
  )
  (graphscr)

  (setq boundary_ss (ssadd))
  (setq hatch_ss (ssadd))
  (setq temp_ss (ssadd))

  (setq kat_kreskowania 0)		;poczatkowy kat kreskowania zeby przez pomylke nie zanzczyc obszaru dwa razy
  (setq
    pkt	(getpoint
	  "\n Wskazuj kolejno punkty w obszarach tworz¹cych przekrój."
	)
  )
  (while (= pkt nil)
    (alert "Musisz wskazaæ jakiœ obszar.")
    (setq pkt
	   (getpoint
	     "\n Wskazuj kolejno punkty w obszarach tworz¹cych przekrój."
	   )
    )
  )



  (while (/= pkt nil)
    (command "_boundary" "_advanced" "_object" "_region" "" "_advanced"	"_island" "_no"	"" "" pkt "")
    (vla-getboundingbox
      (vlax-ename->vla-object
	(cdr (car (entget (entlast))))
      )
      'bbox1
      'bbox2
    )					;narozniki boundingboxa
    (setq dim1 (trans (vlax-safearray->list bbox1) 0 1))

    (setq dim2 (trans (vlax-safearray->list bbox2) 0 1))

    (setq skala_kreskowania
	   (/ (distance dim1 dim2)
	      100
	   )
    )					;ustalenie skali kreskowania

    (ssadd (entlast) boundary_ss)
    (command "_hatch"
	     styl_kreskowania
	     skala_kreskowania
	     kat_kreskowania
	     (entlast)
	     ""
    )
    (vlax-put-property
      (vlax-ename->vla-object (entlast))
      'color
      kolor_materialu
    )					;czerowny
    (ssadd (entlast) hatch_ss)
    (setq pkt (getpoint))
    (setq kat_kreskowania (+ kat_kreskowania 10))
  )

  (selection_to_list hatch_ss)
  (setq hatch_sslist sslist)

  (foreach item hatch_sslist (entdel item))
					; kasowanie pojedynczych kreskowan
  (if (> (sslength boundary_ss) 1)
    (progn (command "_union" boundary_ss "")
	   (setq mass_region (entlast))
    )
    (progn
      (setq mass_region (ssname boundary_ss 0))
    )
  )


  (command "_hatch" styl_kreskowania skala_kreskowania kat_kreskowania mass_region "")

  (ssadd (entlast) temp_ss)
  (vlax-put-property
    (vlax-ename->vla-object (entlast))
    'color
    kolor_materialu
  )					;czerowny


  (setq
    area (vlax-get
	   (vlax-ename->vla-object mass_region)
	   'area
	 )
  )					;powerchnia
  (setq
    centroid (vlax-get (vlax-ename->vla-object mass_region)
		       'centroid
	     )
  )
					;srodek ceizkosci

  (command "_ucs" "_new" centroid)


  (setq	momentofinertia
	 (vlax-get (vlax-ename->vla-object
		     mass_region
		   )
		   'momentofinertia
	 )
  )					;momenty bezwladnosci
  (setq	principaldirections
	 (vlax-get (vlax-ename->vla-object
		     mass_region
		   )
		   'principaldirections
	 )
  )					;glowne kierunki osi centrlanych

  (command "_ucs" "_previous")

  (vla-getboundingbox
    (vlax-ename->vla-object mass_region)
    'bbox1
    'bbox2
  )
  (setq dim1 (trans (vlax-safearray->list bbox1) 0 1))
  (setq dim2 (trans (vlax-safearray->list bbox2) 0 1))

  (setq	gorne_wlokna
	 (max (cadr (trans dim1 1 0)) (cadr (trans dim2 1 0)))
  )
  (setq	dolne_wlokna
	 (min (cadr (trans dim1 1 0)) (cadr (trans dim2 1 0)))
  )



  (entdel mass_region)

					;kat obrotu osi centralnych
  (setq	principalangle
	 (cvunit (atan (/ (caddr principaldirections)
			  (car principaldirections)
		       )
		 )
		 "radians"
		 "degrees"
	 )
  )


					;srodek ciekosci:
  (command "_circle"
	   centroid
	   (/ (distance dim1 dim2) 50)
  )
  (vlax-put-property
    (vlax-ename->vla-object (entlast))
    'color
    (+ kolor_materialu 50)
  )					;czerowny
  (ssadd (entlast) temp_ss)
					;(command "_line" dim1 dim2 "") ;linia bboxa

					;pierwsza os
  (command "_line"
	   (list (* (distance dim1 dim2) -0.25) 0)
	   (list (* (distance dim1 dim2) 0.25) 0)
	   ""
  )
  (vlax-put-property
    (vlax-ename->vla-object (entlast))
    'color
    (+ kolor_materialu 50)
  )					;czerowny
  (ssadd (entlast) temp_ss)
;;;  (command "_rotate"
;;;	   (entlast)
;;;	   ""
;;;	   '(0 0)
;;;	   principalangle
;;;  )
  (command "_move" (entlast) "" '(0 0) centroid)


					;druga os
  (command "_line"
	   (list (* (distance dim1 dim2) -0.25) 0)
	   (list (* (distance dim1 dim2) 0.25) 0)
	   ""
  )
  (vlax-put-property
    (vlax-ename->vla-object (entlast))
    'color
    (+ kolor_materialu 50)
  )					;czerowny
  (ssadd (entlast) temp_ss)
  (command "_rotate"
	   (entlast)
	   ""
	   '(0 0)
	   90
  )
  (command "_move" (entlast) "" '(0 0) centroid)



  (generuj_losowa_nazwe
    "MadziCAD_mass_properties"
  )
  (setq block_temp losowa_nazwa)
  (setq
    base_pt
     (trans
       (cdr
	 (assoc	10
		(entget (ssname temp_ss 0))
	 )
       )
       0
       1
     )
  )
  (command "_block" block_temp base_pt temp_ss "")
  (command "_insert" block_temp base_pt 1 1 0)
  (setq obszar (entlast))

  (princ)
)





;;;zespolooonyyyy
(defun charakterystyki_zespolonego ()

  (setq na (/ ea ea))
  (setq nb (/ ea eb))
  (setq nc (/ ea ec))
  (setq nd (/ ea ed))

  (setq	pole_zespolonego
	 (+ (/ pole_a na)
	    (/ pole_b nb)
	    (/ pole_c nc)
	    (/ pole_d nd)
	 )
  )

					;odl srodka ciezkosci zeposlonego od srodka ciezkosci M1
  (setq centroid_a (trans centroid_a 1 0))
  (setq centroid_b (trans centroid_b 1 0))
  (setq centroid_c (trans centroid_c 1 0))
  (setq centroid_d (trans centroid_d 1 0))
  (setq dim1 (trans dim1 1 0))
  (setq dim2 (trans dim2 1 0))

  (command "_ucs" "_new" (trans centroid_a 0 1))

  (setq	y_osi_obojetnej_zespolonego
	 (/ (+ (* (/ pole_b nb) (cadr (trans centroid_b 0 1)))
	       (* (/ pole_c nc) (cadr (trans centroid_c 0 1)))
	       (* (/ pole_d nd) (cadr (trans centroid_d 0 1)))
	    )
	    pole_zespolonego
	 )
  )

  (command "_line"
	   (list (* (distance dim1 dim2) -0.5)
		 y_osi_obojetnej_zespolonego
	   )
	   (list (* (distance dim1 dim2) 0.5)
		 y_osi_obojetnej_zespolonego
	   )
	   ""
  )

  (vlax-put-property
    (vlax-ename->vla-object (entlast))
    'color
    1
  )
  (setq os_zespolona (entlast))


  (command "_ucs"
	   "_new"
	   (list 0.0 y_osi_obojetnej_zespolonego)
  )





  (setq	Jx_zespolonego
	 (+
	   (+
	     (/ Jx_a na)
	     (/	(* pole_a (expt (/ (cadr (trans centroid_a 0 1)) 10) 2))
		na
	     )
	   )
	   (+
	     (/ Jx_b nb)
	     (/	(* pole_b
		   (expt (/ (cadr (trans centroid_b 0 1)) 10) 2)
		)
		nb
	     )
	   )
	   (+
	     (/ Jx_c nc)
	     (/	(* pole_c
		   (expt (/ (cadr (trans centroid_c 0 1)) 10) 2)
		)
		nc
	     )
	   )
	   (+
	     (/ Jx_d nd)
	     (/	(* pole_d
		   (expt (/ (cadr (trans centroid_d 0 1)) 10) 2)
		)
		nd
	     )
	   )
	 )
  )



  (command "_ucs" "_previous")
  (command "_ucs" "_previous")
  (setq centroid_a (trans centroid_a 0 1))
  (setq centroid_b (trans centroid_b 0 1))
  (setq centroid_c (trans centroid_c 0 1))
  (setq centroid_d (trans centroid_d 0 1))
  (setq dim1 (trans dim1 0 1))
  (setq dim2 (trans dim2 0 1))
  (princ)
)


(defun obliczanie_naprezen ()
  (if (/= Jx_zespolonego 0)
    (progn

      (if (/= pole_a 0)
	(progn
	  (setq	sigma_gw_a		;razy minus zeby rociagajace byly z plusem i razy 100 zeby bylo w MPa 
		 (+ (/ (* moment_zginajacy
			  -100
			  (- gorne_wlokna_a
			     (caddr (assoc 10 (entget os_zespolona)))
			  )
		       )
		       (* Jx_zespolonego na)
		    )
		    (/ sila_osiowa pole_zespolonego)

		 )
	  )
	  (setq	sigma_dw_a
		 (+ (/ (* moment_zginajacy
			  -100
			  (- dolne_wlokna_a
			     (caddr (assoc 10 (entget os_zespolona)))
			  )
		       )
		       (* Jx_zespolonego na)
		    )
		    (/ sila_osiowa pole_zespolonego)
		 )
	  )
	)
      )

      (if (/= pole_b 0)
	(progn
	  (setq	sigma_gw_b
		 (+ (/ (* moment_zginajacy
			  -100
			  (- gorne_wlokna_b
			     (caddr (assoc 10 (entget os_zespolona)))
			  )
		       )
		       (* Jx_zespolonego nb)
		    )
		    (/ sila_osiowa pole_zespolonego)
		 )
	  )
	  (setq	sigma_dw_b
		 (+ (/ (* moment_zginajacy
			  -100
			  (- dolne_wlokna_b
			     (caddr (assoc 10 (entget os_zespolona)))
			  )
		       )
		       (* Jx_zespolonego nb)
		    )
		    (/ sila_osiowa pole_zespolonego)
		 )
	  )
	)
      )

      (if (/= pole_c 0)
	(progn
	  (setq	sigma_gw_c
		 (+ (/ (* moment_zginajacy
			  -100
			  (- gorne_wlokna_c
			     (caddr (assoc 10 (entget os_zespolona)))
			  )
		       )
		       (* Jx_zespolonego nc)
		    )
		    (/ sila_osiowa pole_zespolonego)
		 )
	  )
	  (setq	sigma_dw_c
		 (+ (/ (* moment_zginajacy
			  -100
			  (- dolne_wlokna_c
			     (caddr (assoc 10 (entget os_zespolona)))
			  )
		       )
		       (* Jx_zespolonego nc)
		    )
		    (/ sila_osiowa pole_zespolonego)
		 )
	  )
	)
      )

      (if (/= pole_d 0)
	(progn
	  (setq	sigma_gw_d
		 (+ (/ (* moment_zginajacy
			  -100
			  (- gorne_wlokna_d
			     (caddr (assoc 10 (entget os_zespolona)))
			  )
		       )
		       (* Jx_zespolonego nc)
		    )
		    (/ sila_osiowa pole_zespolonego)
		 )
	  )
	  (setq	sigma_dw_d
		 (+ (/ (* moment_zginajacy
			  -100
			  (- dolne_wlokna_d
			     (caddr (assoc 10 (entget os_zespolona)))
			  )
		       )
		       (* Jx_zespolonego nc)
		    )
		    (/ sila_osiowa pole_zespolonego)
		 )
	  )
	)
      )
    )
  )
  (princ)
)














(defun przekroj_zespolony_help ()
  (alert
    "
\t   HELP:\n
\tProgram oblicza charakterystyki wytrzyma³oœciowe przekroju zespolonego, oraz naprê¿enia 
\t   w przekrojach.\n
\t1.  W pola oznaczone symbolem E nale¿y wpisaæ modu³ Younga oraz wskazaæ obszary na przekroju \t\t
\t   poprzecznym dla ka¿dego rodzaju materia³u.\n
\t2.  Po ka¿dej zmianie modu³u E, wskazaniu obszaru, lub zmianie si³ zewnêtrznych, program sam 
\t   uaktualni dane oraz wyniki.\n
\t3.  W polu \"Przekrój zespolony\" program podaje sprowadzone pole powierzchni przekroju 
\t   zespolonego, oraz sprowadzony moment bezw³adnoœci przekroju zespolonego wzglêdem osi
\t   obojêtnej przekroju zespolonego.\n
\t4.  Jeœli w polu \"Si³y zewnêtrzne\" podano moment zginaj¹cy (dodatni dla rozci¹gania do³em) 
\t   i si³ê osiow¹ (dodatni¹ dla rozci¹gania) dzia³aj¹c¹ na przekrój, program wyliczy równie¿ 
\t   momenty i si³y osiowe dzia³aj¹ce na ka¿dy z obszarów, oraz naprê¿enia w skrajnych w³óknach 
\t   obszarów.\n

\tUWAGI:
\t - Jednostki rysunkowe -> milimetry
\t - Jako materia³ podstawowy brany jest zawsze materia³ A (n=1),a  dla pozosta³ych materia³ów 
\t   program wylicza przekroje ekwiwalentne, np.: materia³ A: stal - 205GPa,
\t   materia³ B: beton B30 - 32.6GPa, opcjonalnie materia³ C np.: stal A-IIIN - 210GPa).
\t - Ka¿dy obszar mo¿na ponownie zdefiniowaæ klikaj¹c w przycisk \"< Wska¿\".
\t - Jeœli zale¿y nam na wykrywaniu wysp nale¿y przekrój przeci¹æ w tym miejscu lini¹.
\t - Bardzo rzadko mog¹ wyst¹piæ problemy z kreskowaniem obszarów - nale¿y wtedy u¿yæ polecenia
\t   \"_REGEN\", lub powiekszyæ kreskowany obszar aby by³ ca³y widoczny na ekranie - jest to
\t   problem wystêpuj¹cy w samym AutoCADzie.


\tPrzyciski:
\tOK\t- Koñczy program i wstawia wyniki obliczeñ do rysunku
\tAnuluj\t- Koñczy program
\tHelp\t- Pomoc programu
\tInfo\t- Informacje
"
  )
  (princ)
)


(defun przekroj_zespolony_info (/ info_message dcl_id)
;;;  (setq	info_message
;;;	 (strcat
;;;	   "PRZEKRÓJ ZESPOLONY v0.9
;;;(c) Kuba Be³ch 2008
;;;kuba.belch@gmail.com\n
;;;WERSJA EDUKACYJNA\n
;;;Program oblicza charakterystyki wytrzyma³oœciowe przekroju zespolonego,
;;;momenty czêœciowe, oraz naprê¿enia w poszczególnych przekrojach.\n
;;;Program jest czêœci¹ programu MadziCAD, wiêcej na www.madzicad.com\n
;;;"
;;;	 )
;;;  )

  (setq	dcl_id (load_dialog
		 (strcat  "\\przekroj_zespolony.dcl")
	       )
  )
  (new_dialog "przekroj_zespolony_info" dcl_id)
  (start_dialog)			; Display the dialog 
  (unload_dialog dcl_id)		; Unload the DCL file.
  (princ)
)




(defun obliczanie_momentow ()

  (if (/= Jx_zespolonego 0)
    (progn

      (if (/= pole_a 0)
	(progn
	  (setq	moment_zginajacy_a
		 (* (/ Jx_a na) (/ moment_zginajacy Jx_zespolonego))
	  )
	  (setq	sila_osiowa_a
		 (*
		   (/ pole_a na)	;Aa/na
		   (+
		     (/ sila_osiowa pole_zespolonego) ;nz/az
		     (/	(* moment_zginajacy
			   -100		;razy 100 bo M w kNm a tutaj musi byc w kNcm a minus zeby rozciagajaca byla z minusem
			   (/ (- (cadr (trans centroid_a 1 0))
				 (caddr
				   (assoc 10 (entget os_zespolona))
				 )
			      )
			      10
			   )
			)
			Jx_zespolonego
		     )
		   )
		 )
	  )
	)
      )


      (if (/= pole_b 0)
	(progn
	  (setq	moment_zginajacy_b
		 (* (/ Jx_b nb) (/ moment_zginajacy Jx_zespolonego))
	  )
	  (setq	sila_osiowa_b
		 (*
		   (/ pole_b nb)	;Aa/na
		   (+
		     (/ sila_osiowa pole_zespolonego) ;nz/az
		     (/	(* moment_zginajacy
			   -100
			   (/ (- (cadr (trans centroid_b 1 0))
				 (caddr
				   (assoc 10 (entget os_zespolona))
				 )
			      )
			      10
			   )
			)
			Jx_zespolonego
		     )
		   )
		 )
	  )
	)
      )


      (if (/= pole_c 0)
	(progn
	  (setq	moment_zginajacy_c
		 (* (/ Jx_c nc) (/ moment_zginajacy Jx_zespolonego))
	  )
	  (setq	sila_osiowa_c
		 (*
		   (/ pole_c nc)	;Aa/na
		   (+
		     (/ sila_osiowa pole_zespolonego) ;nz/az
		     (/	(* moment_zginajacy
			   -100
			   (/ (- (cadr (trans centroid_c 1 0))
				 (caddr
				   (assoc 10 (entget os_zespolona))
				 )
			      )
			      10
			   )
			)
			Jx_zespolonego
		     )
		   )
		 )
	  )
	)
      )

      (if (/= pole_d 0)
	(progn
	  (setq	moment_zginajacy_d
		 (* (/ Jx_d nd) (/ moment_zginajacy Jx_zespolonego))
	  )
	  (setq	sila_osiowa_d
		 (*
		   (/ pole_d nd)	;Aa/na
		   (+
		     (/ sila_osiowa pole_zespolonego) ;nz/az
		     (/	(* moment_zginajacy
			   -100
			   (/ (- (cadr (trans centroid_d 1 0))
				 (caddr
				   (assoc 10 (entget os_zespolona))
				 )
			      )
			      10
			   )
			)
			Jx_zespolonego
		     )
		   )
		 )
	  )
	)
      )
    )
  )
  (princ)
)


;;; czy pole w N/A ma byc zespolone czy nie na razie jest zespolone
;;; zrobic zeby nie wywalal erroa ja sie nic nie kliknie w obszar (nie che mi sie :]
;;;dorobic tabindex