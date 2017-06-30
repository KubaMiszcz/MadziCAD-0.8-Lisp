(defun c:zapamietaj_baze_wspolrzednych_nr_1(/ layerprev osmodeprev pkt temp_selection ent)
  (defun *error* (errorlevel)
    (setvar "osmode" osmodeprev)
    (setvar "clayer" layerprev)			;zmienia na poprz warstwe
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq layerprev (getvar "clayer"))			;zapamietuje biezaca warstwe
  (setq osmodeprev (getvar "osmode"))
  
  (if (= (tblsearch "layer" "Defpoints") nil)
    (setvar "clayer" "0")          			
    (setvar "clayer" "Defpoints")          			
  )

  (setvar "osmode" 15359)
  (setq pkt (getpoint "\n Wska¿ punkt maj¹cy zostaæ baza wspó³rzêdnych: "))

  (command "_mtext" 
    pkt
    "_justify" "_bl" 
    "_height" (* (getvar "dimscale") txta 50)			;wysokosc tekstu
    pkt
    "  BAZA WSPOLRZEDNYCH NR 1"
    " "
    ""
  )
  
  (setq temp_selection (ssadd))
  (ssadd (entlast) temp_selection)
    
  (command "_circle" pkt (* (getvar "dimscale") 100))
  (ssadd (entlast) temp_selection)
  
  (command "_point" pkt)
  (ssadd (entlast) temp_selection)
  (if (= (ssget "_X" '((0 . "INSERT")(2 . "BAZA WSPOLRZEDNYCH NR 1"))) nil)
    (progn
      (if (= (tblsearch "block" "BAZA WSPOLRZEDNYCH NR 1") nil)
        (command "_block" "BAZA WSPOLRZEDNYCH NR 1" pkt temp_selection "")
        (command "_block" "BAZA WSPOLRZEDNYCH NR 1" "_yes" pkt temp_selection "")
      )
    )
    (progn
      (alert "Baza wspó³rzêdnych NR 1 istnia³a i zosta³a przedefiniowana")
      (command "_explode" (ssget "_X" '((0 . "INSERT")(2 . "BAZA WSPOLRZEDNYCH NR 1"))) "")
      (setq ent (entget (ssname (ssget "_X" '((0 . "MTEXT")(1 . "  BAZA WSPOLRZEDNYCH NR 1\\P "))) 0)))
      (setq ent (subst (cons 1 "  NIEAKTUALNA BAZA WSPOLRZEDNYCH NR 1\\P ") (assoc 1 ent) ent))
      (entmod ent)
      
      (command "_block" "BAZA WSPOLRZEDNYCH NR 1" "_yes" pkt temp_selection "")
    )
  )
    
  (command "_insert" "BAZA WSPOLRZEDNYCH NR 1" pkt 1 1 0)
  
  (setvar "osmode" 0)
  (command "_ucs" "_new" pkt)

  (setq pkt (cdr (assoc 10 (entget (entlast)))))
  (princ (strcat "\n Ustawiono aktualny LUW w punkcie: (" (rtos(car pkt)) ", " (rtos(cadr pkt)) ", " (rtos(caddr pkt)) ") w [GUW]."))    
  
  (setvar "osmode" osmodeprev)
  (setvar "clayer" layerprev)			;zmienia na poprz warstwe

  (princ)  
)

(defun c:zapamietaj_baze_wspolrzednych_NR_2(/ layerprev osmodeprev pkt temp_selection ent)
  (defun *error* (errorlevel)
    (setvar "osmode" osmodeprev)
    (setvar "clayer" layerprev)			;zmienia na poprz warstwe
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq layerprev (getvar "clayer"))			;zapamietuje biezaca warstwe
  (setq osmodeprev (getvar "osmode"))
  
  (if (= (tblsearch "layer" "Defpoints") nil)
    (setvar "clayer" "0")          			
    (setvar "clayer" "Defpoints")          			
  )

  (setvar "osmode" 15359)
  (setq pkt (getpoint "\n Wska¿ punkt maj¹cy zostaæ baza wspó³rzêdnych: "))

  (command "_mtext" 
    pkt
    "_justify" "_bl" 
    "_height" (* (getvar "dimscale") txta 50)			;wysokosc tekstu
    pkt
    "  BAZA WSPOLRZEDNYCH NR 2"
    " "
    ""
  )
  
  (setq temp_selection (ssadd))
  (ssadd (entlast) temp_selection)
    
  (command "_circle" pkt (* (getvar "dimscale") 100))
  (ssadd (entlast) temp_selection)
  
  (command "_point" pkt)
  (ssadd (entlast) temp_selection)
  (if (= (ssget "_X" '((0 . "INSERT")(2 . "BAZA WSPOLRZEDNYCH NR 2"))) nil)
    (progn
      (if (= (tblsearch "block" "BAZA WSPOLRZEDNYCH NR 2") nil)
        (command "_block" "BAZA WSPOLRZEDNYCH NR 2" pkt temp_selection "")
        (command "_block" "BAZA WSPOLRZEDNYCH NR 2" "_yes" pkt temp_selection "")
      )
    )
    (progn
      (alert "Baza wspó³rzêdnych NR 2 istnia³a i zosta³a przedefiniowana")
      (command "_explode" (ssget "_X" '((0 . "INSERT")(2 . "BAZA WSPOLRZEDNYCH NR 2"))) "")
      (setq ent (entget (ssname (ssget "_X" '((0 . "MTEXT")(1 . "  BAZA WSPOLRZEDNYCH NR 2\\P "))) 0)))
      (setq ent (subst (cons 1 "  NIEAKTUALNA BAZA WSPOLRZEDNYCH NR 2\\P ") (assoc 1 ent) ent))
      (entmod ent)
      
      (command "_block" "BAZA WSPOLRZEDNYCH NR 2" "_yes" pkt temp_selection "")
    )
  )
    
  (command "_insert" "BAZA WSPOLRZEDNYCH NR 2" pkt 1 1 0)
  
  (setvar "osmode" 0)
  (command "_ucs" "_new" pkt)

  (setq pkt (cdr (assoc 10 (entget (entlast)))))
  (princ (strcat "\n Ustawiono aktualny LUW w punkcie: (" (rtos(car pkt)) ", " (rtos(cadr pkt)) ", " (rtos(caddr pkt)) ") w [GUW]."))    
  
  (setvar "osmode" osmodeprev)
  (setvar "clayer" layerprev)			;zmienia na poprz warstwe

  (princ)  
)


(defun c:zapamietaj_baze_wspolrzednych_NR_3(/ layerprev osmodeprev pkt temp_selection ent)
  (defun *error* (errorlevel)
    (setvar "osmode" osmodeprev)
    (setvar "clayer" layerprev)			;zmienia na poprz warstwe
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq layerprev (getvar "clayer"))			;zapamietuje biezaca warstwe
  (setq osmodeprev (getvar "osmode"))
  
  (if (= (tblsearch "layer" "Defpoints") nil)
    (setvar "clayer" "0")          			
    (setvar "clayer" "Defpoints")          			
  )

  (setvar "osmode" 15359)
  (setq pkt (getpoint "\n Wska¿ punkt maj¹cy zostaæ baza wspó³rzêdnych: "))

  (command "_mtext" 
    pkt
    "_justify" "_bl" 
    "_height" (* (getvar "dimscale") txta 50)			;wysokosc tekstu
    pkt
    "  BAZA WSPOLRZEDNYCH NR 3"
    " "
    ""
  )
  
  (setq temp_selection (ssadd))
  (ssadd (entlast) temp_selection)
    
  (command "_circle" pkt (* (getvar "dimscale") 100))
  (ssadd (entlast) temp_selection)
  
  (command "_point" pkt)
  (ssadd (entlast) temp_selection)
  (if (= (ssget "_X" '((0 . "INSERT")(2 . "BAZA WSPOLRZEDNYCH NR 3"))) nil)
    (progn
      (if (= (tblsearch "block" "BAZA WSPOLRZEDNYCH NR 3") nil)
        (command "_block" "BAZA WSPOLRZEDNYCH NR 3" pkt temp_selection "")
        (command "_block" "BAZA WSPOLRZEDNYCH NR 3" "_yes" pkt temp_selection "")
      )
    )
    (progn
      (alert "Baza wspó³rzêdnych NR 3 istnia³a i zosta³a przedefiniowana")
      (command "_explode" (ssget "_X" '((0 . "INSERT")(2 . "BAZA WSPOLRZEDNYCH NR 3"))) "")
      (setq ent (entget (ssname (ssget "_X" '((0 . "MTEXT")(1 . "  BAZA WSPOLRZEDNYCH NR 3\\P "))) 0)))
      (setq ent (subst (cons 1 "  NIEAKTUALNA BAZA WSPOLRZEDNYCH NR 3\\P ") (assoc 1 ent) ent))
      (entmod ent)
      
      (command "_block" "BAZA WSPOLRZEDNYCH NR 3" "_yes" pkt temp_selection "")
    )
  )
    
  (command "_insert" "BAZA WSPOLRZEDNYCH NR 3" pkt 1 1 0)
  
  (setvar "osmode" 0)
  (command "_ucs" "_new" pkt)

  (setq pkt (cdr (assoc 10 (entget (entlast)))))
  (princ (strcat "\n Ustawiono aktualny LUW w punkcie: (" (rtos(car pkt)) ", " (rtos(cadr pkt)) ", " (rtos(caddr pkt)) ") w [GUW]."))    
  
  (setvar "osmode" osmodeprev)
  (setvar "clayer" layerprev)			;zmienia na poprz warstwe

  (princ)  
)

