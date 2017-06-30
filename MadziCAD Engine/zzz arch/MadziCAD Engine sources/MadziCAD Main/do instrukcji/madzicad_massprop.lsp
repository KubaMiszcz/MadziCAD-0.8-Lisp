(defun c:madzicad_massprop (/ osmodeprev orthoprev boundary_ss hatch_ss	temp_ss	kat_kreskowania	pkt dim1 dim2 skala_kreskowania	boundary_sslist
			    hatch_sslist entlist area)
  (defun *error* (errorlevel)
    (selection_to_list boundary_ss)
    (setq boundary_sslist sslist)
    (selection_to_list hatch_ss)
    (setq hatch_sslist sslist)
    (foreach item boundary_sslist (entdel item))
    (foreach item hatch_sslist (entdel item))
    (setvar "clayer" layerprev)		;zmienia na poprz warstwe
    (setvar "osmode" osmodeprev)
    (setvar "orthomode" orthoprev)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
    (princ)
  )
  (graphscr)
  (setq layerprev (getvar "clayer"))	;zapamietuje biezaca warstwe
  (setq osmodeprev (getvar "osmode"))	;zapamietuje stale tryby lokalizacji
  (setq orthoprev (getvar "orthomode"))	;zapamietuje status orto
  (setvar "clayer" "0")
  (setvar "osmode" 0)
  (setvar "orthomode" 0)

  (setq boundary_ss (ssadd))
  (setq hatch_ss (ssadd))
  (setq temp_ss (ssadd))

  (setq kat_kreskowania 0)		;poczatkowy kat kreskowania zeby przez pomylke nie zanzczyc obszaru dwa razy
  (setq	pkt (getpoint
	      "\n Wskazuj kolejno punkty w obszarach tworz¹cych pole."
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
	   (/ (distance dim1 dim2) 100)
    )					;ustalenie skali kreskowania

    (ssadd (entlast) boundary_ss)
    (command "_hatch"
	     "ansi37"
	     skala_kreskowania
	     kat_kreskowania
	     (entlast)
	     ""
    )
					;czerowny
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
    (progn (setq mass_region (ssname boundary_ss 0)))
  )



  (setq	area (vlax-get
	       (vlax-ename->vla-object mass_region)
	       'area
	     )
  )					;powerchnia
  (setq	perimeter
	 (vlax-get
	   (vlax-ename->vla-object mass_region)
	   'perimeter
	 )
  )					;obwod
  (setq
    centroid (vlax-get
	       (vlax-ename->vla-object mass_region)
	       'centroid
	     )
  )					;srodek ceizkosci
  (setq	momentofinertia
	 (vlax-get (vlax-ename->vla-object
		     mass_region
		   )
		   'momentofinertia
	 )
  )					;momenty bezwladnosci
  (setq	principalmoments
	 (vlax-get (vlax-ename->vla-object
		     mass_region
		   )
		   'principalmoments
	 )
  )					;glowne momenty bezwladnosci
  (setq	principaldirections
	 (vlax-get (vlax-ename->vla-object
		     mass_region
		   )
		   'principaldirections
	 )
  )
  (vla-getboundingbox
    (vlax-ename->vla-object mass_region)
    'bbox1
    'bbox2
  )
  (setq dim1 (vlax-safearray->list bbox1))
  (setq dim2 (vlax-safearray->list bbox2))

  (setq skala_kreskowania (/ (distance dim1 dim2) 100))
  (command "_hatch" "ansi37" skala_kreskowania 0 mass_region "")






;;;;rysowanie kolka z krzycyzkiem i kreskowania
   (command "_hatch" "ansi37" skala_kreskowania 0 mass_region "")
  (ssadd (entlast) temp_ss)
  
  (command "_circle" centroid (/ (distance dim1 dim2) 20))
  (ssadd (entlast) temp_ss)

  (command "_pline"
	   '(0 0)
	   (list (car principaldirections) (caddr principaldirections))
	   ""
  )
  (command "_scale"
	   (entlast)
	   ""
	   (list (car principaldirections) (caddr principaldirections))
	   2
  )
  (command "_scale"
	   (entlast)
	   ""
	   '(0 0)
	   (/ (distance dim1 dim2) 20)
  )
  (command "_move" (entlast) "" '(0 0) centroid)
  (ssadd (entlast) temp_ss)


  
  (command "_pline"
	   '(0 0)
	   (list (cadr principaldirections)
		 (cadddr principaldirections)
	   )
	   ""
  )
  (command "_scale"
	   (entlast)
	   ""
	   (list (cadr principaldirections)
		 (cadddr principaldirections)
	   )
	   2
  )
  (command "_scale"
	   (entlast)
	   ""
	   '(0 0)
	   (/ (distance dim1 dim2) 20)
  )
  (command "_move" (entlast) "" '(0 0) centroid)
  (ssadd (entlast) temp_ss)

  (entdel mass_region)
					; (entdel (entlast)) kasuje kreskowanie


  (setq	properties
	 (strcat "W³aœciwoœci obszarów: \n"
		 "Pole powierzchni:  "
		 (rtos (/ area 100))
		 " cm2   ("
		 (rtos area)
		 " jedn^2)\n"
		 "Obwód (sumaryczny):  "
		 (rtos (/ perimeter 10))
		 " cm   ("
		 (rtos perimeter)
		 " jedn)\n\n"
		 "Centralne momenty bezw³adnoœci (wzglêdem LUW):\n"
					;(rtos (car centroid)) "\t" (rtos (cadr centroid)) "\n"
		 "Jx:  "
		 (rtos (/ (car momentofinertia) 10000))
		 " cm4   ("
		 (rtos (car momentofinertia))
		 " jedn^4)\n"
		 "Jy:  "
		 (rtos (/ (cadr momentofinertia) 10000))
		 " cm4   ("
		 (rtos (cadr momentofinertia))
		 " jedn^4)\n\n"
		 "G³ówne centralne momenty bezw³adnosæi:\n"
		 "Jx:  "
		 (rtos (/ (car principalmoments) 10000))
		 " cm4   ("
		 (rtos (car principalmoments))
		 " jedn^4)\n"
		 "Jy:  "
		 (rtos (/ (cadr principalmoments) 10000))
		 " cm4   ("
		 (rtos (cadr principalmoments))
		 " jedn^4)\n\n"
					;"Kierunki g³ówne:   " (rtos principalangle) " stopni\n"
	 )
  )


  
(generuj_losowa_nazwe "MadziCAD_mass_properties")
  (setq block_temp losowa_nazwa)
  (setq
    base_pt (trans (cdr (assoc 10 (entget (ssname temp_ss 0)))) 0 1)
  )
  (command "_block" block_temp base_pt temp_ss "")
  (command "_insert" block_temp base_pt 1 1 0)


  (princ properties)
  (alert properties)


  
  (command "_mtext"
	   '(0 0)
	   "_justify"
	   "_bl"
	   "_height"
	   (* (getvar "dimscale") txta)	;wysokosc tekstu
	   '(0 0)
	   properties
	   ""
  )

  (command "_move" (entlast) "" '(0 0) pause)



  (setvar "clayer" layerprev)		;zmienia na poprz warstwe
  (setvar "osmode" osmodeprev)
  (setvar "orthomode" orthoprev)


  (princ)
)
