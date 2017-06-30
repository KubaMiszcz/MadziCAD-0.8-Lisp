(defun c:pole_powierzchni (/		  osmodeprev	 orthoprev	boundary_ss
			   hatch_ss	  temp_ss	 kat_kreskowania
			   pkt		  dim1		 dim2		skala_kreskowania
			   boundary_sslist		 hatch_sslist	entlist
			   area
			  )
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


  (command "_hatch" "ansi37" skala_kreskowania kat_kreskowania mass_region "")


  (setq area (vlax-get (vlax-ename->vla-object mass_region) 'area)) ;powerchnia

  (entdel mass_region)
  (princ
    (strcat
      "\nSuma zakreskowanych obszarów:\t"
      (rtos area 2 2)
      "m2\n"
      "\nDok³adne pole powierzchni zakreskowanych obszarów:\t\n\n\t"
      (rtos (* area 1000000) 2 4)
      " jednostek kwadratowych."
    )
  )
  (alert
    (strcat
      "\nSuma zakreskowanych obszarów:\t"
      (rtos area 2 2)
      "m2\n"
      "\nDok³adne pole powierzchni zakreskowanych obszarów:\t\n\n\t"
      (rtos (* area 1000000) 2 4)
      " jednostek kwadratowych."
    )
  )
  (entdel (entlast))
  (setvar "clayer" layerprev)		;zmienia na poprz warstwe
  (setvar "osmode" osmodeprev)
  (setvar "orthomode" orthoprev)


  (princ)
)
