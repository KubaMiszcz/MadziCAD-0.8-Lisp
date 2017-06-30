(defun c:dopasuj_baze_wspolrzednych(/ temp_selection n base_pt wlasciwosc sslist entlist dimordinate_flag item)
  (princ "\n Wybierz rzêdne których bazy maj¹ zostaæ dopasowane: ")
  (setq temp_selection (ssget))
  (selection_to_list temp_selection)
  ;(setq base_pt (getpoint "\n Wska¿ punkt który ma zostac baz¹ wybranych wspó³rzêdnych: "))
  (setq base_pt '(0 0))
  (setq base_pt (trans base_pt 1 0))
  (setq n 0 )
  (foreach item sslist
    (progn
      (setq entlist (entget item))
      (setq dimordinate_flag (cdr (assoc 100 (reverse entlist))))
      (if 
        (= dimordinate_flag "AcDbOrdinateDimension")
        (progn
          (setq n (1+ n))
          (setq entlist
            (subst 
            (cons 10 base_pt) 
            (assoc 10 entlist) 
            entlist)
          )
          (entmod entlist)
        )
      )
    )
  )
  (princ (strcat "\n Uaktualniono bazy " (itoa n) " wspó³rzêdnych. "))
  (princ)
)



(defun c:dopasuj_baze_wspolrzednych_nr_1(/ osmodeprev pkt entpt temp_selection n base_pt wlasciwosc sslist entlist dimordinate_flag item)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)

  (princ "\n Wybierz rzêdne których bazy maj¹ zostaæ dopasowane do bazy NR 1: ")
  (setq temp_selection (ssget))  
  ;(setq base_pt (getpoint "\n Wska¿ punkt który ma zostac baz¹ wybranych wspó³rzêdnych: "))
  
  (setq osmodeprev (getvar "osmode"))
  
  (if (= (ssget "_X" '((0 . "INSERT")(2 . "BAZA WSPOLRZEDNYCH NR 1"))) nil)
    (progn
      (alert "ni ma")
      (quit)
    )
    (setq entpt (entget (ssname (ssget "_X" '((0 . "INSERT")(2 . "BAZA WSPOLRZEDNYCH NR 1"))) 0)))
  )
  
  (setq pkt (cdr (assoc 10 entpt)))
  (setq pkt (trans pkt 0 1))					;;pt2 z GUW do LUW 
  
  (setvar "osmode" 0)
  (command "_ucs" "_new" pkt)

  (setq pkt (cdr (assoc 10 entpt)))
  (princ (strcat "\n Ustawiono LUW w punkcie: (" (rtos(car pkt)) ", " (rtos(cadr pkt)) ", " (rtos(caddr pkt)) ") w [GUW]."))    
  
  (setvar "osmode" osmodeprev)
 
  (if (/= temp_selection nil)
    (progn 
      (selection_to_list temp_selection)
     
      (setq base_pt pkt)
      ;(setq base_pt (trans base_pt 1 0))
      (setq n 0 )
      (foreach item sslist
        (progn
          (setq entlist (entget item))
          (setq dimordinate_flag (cdr (assoc 100 (reverse entlist))))
          (if 
            (= dimordinate_flag "AcDbOrdinateDimension")
            (progn
              (setq n (1+ n))
              (setq entlist
                (subst 
                (cons 10 base_pt) 
                (assoc 10 entlist) 
                entlist)
              )
              (entmod entlist)
            )
          )
        )
      )
      (princ (strcat "\n Uaktualniono bazy " (itoa n) " wspó³rzêdnych. "))
    )
  )
  (princ)
)


(defun c:dopasuj_baze_wspolrzednych_nr_2(/ osmodeprev pkt entpt temp_selection n base_pt wlasciwosc sslist entlist dimordinate_flag item)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)

  (princ "\n Wybierz rzêdne których bazy maj¹ zostaæ dopasowane do bazy NR 2: ")
  (setq temp_selection (ssget))  
  ;(setq base_pt (getpoint "\n Wska¿ punkt który ma zostac baz¹ wybranych wspó³rzêdnych: "))
  
  (setq osmodeprev (getvar "osmode"))
  
  (if (= (ssget "_X" '((0 . "INSERT")(2 . "BAZA WSPOLRZEDNYCH NR 2"))) nil)
    (progn
      (alert "ni ma")
      (quit)
    )
    (setq entpt (entget (ssname (ssget "_X" '((0 . "INSERT")(2 . "BAZA WSPOLRZEDNYCH NR 2"))) 0)))
  )
  
  (setq pkt (cdr (assoc 10 entpt)))
  (setq pkt (trans pkt 0 1))					;;pt2 z GUW do LUW 
  
  (setvar "osmode" 0)
  (command "_ucs" "_new" pkt)

  (setq pkt (cdr (assoc 10 entpt)))
  (princ (strcat "\n Ustawiono LUW w punkcie: (" (rtos(car pkt)) ", " (rtos(cadr pkt)) ", " (rtos(caddr pkt)) ") w [GUW]."))    
  
  (setvar "osmode" osmodeprev)
 
  (if (/= temp_selection nil)
    (progn 
      (selection_to_list temp_selection)
     
      (setq base_pt pkt)
      ;(setq base_pt (trans base_pt 1 0))
      (setq n 0 )
      (foreach item sslist
        (progn
          (setq entlist (entget item))
          (setq dimordinate_flag (cdr (assoc 100 (reverse entlist))))
          (if 
            (= dimordinate_flag "AcDbOrdinateDimension")
            (progn
              (setq n (1+ n))
              (setq entlist
                (subst 
                (cons 10 base_pt) 
                (assoc 10 entlist) 
                entlist)
              )
              (entmod entlist)
            )
          )
        )
      )
      (princ (strcat "\n Uaktualniono bazy " (itoa n) " wspó³rzêdnych. "))
    )
  )
  (princ)
)


(defun c:dopasuj_baze_wspolrzednych_nr_3(/ osmodeprev pkt entpt temp_selection n base_pt wlasciwosc sslist entlist dimordinate_flag item)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)

  (princ "\n Wybierz rzêdne których bazy maj¹ zostaæ dopasowane do bazy NR 3: ")
  (setq temp_selection (ssget))  
  ;(setq base_pt (getpoint "\n Wska¿ punkt który ma zostac baz¹ wybranych wspó³rzêdnych: "))
  
  (setq osmodeprev (getvar "osmode"))
  
  (if (= (ssget "_X" '((0 . "INSERT")(2 . "BAZA WSPOLRZEDNYCH NR 3"))) nil)
    (progn
      (alert "ni ma")
      (quit)
    )
    (setq entpt (entget (ssname (ssget "_X" '((0 . "INSERT")(2 . "BAZA WSPOLRZEDNYCH NR 3"))) 0)))
  )
  
  (setq pkt (cdr (assoc 10 entpt)))
  (setq pkt (trans pkt 0 1))					;;pt2 z GUW do LUW 
  
  (setvar "osmode" 0)
  (command "_ucs" "_new" pkt)

  (setq pkt (cdr (assoc 10 entpt)))
  (princ (strcat "\n Ustawiono LUW w punkcie: (" (rtos(car pkt)) ", " (rtos(cadr pkt)) ", " (rtos(caddr pkt)) ") w [GUW]."))    
  
  (setvar "osmode" osmodeprev)
 
  (if (/= temp_selection nil)
    (progn 
      (selection_to_list temp_selection)
     
      (setq base_pt pkt)
      ;(setq base_pt (trans base_pt 1 0))
      (setq n 0 )
      (foreach item sslist
        (progn
          (setq entlist (entget item))
          (setq dimordinate_flag (cdr (assoc 100 (reverse entlist))))
          (if 
            (= dimordinate_flag "AcDbOrdinateDimension")
            (progn
              (setq n (1+ n))
              (setq entlist
                (subst 
                (cons 10 base_pt) 
                (assoc 10 entlist) 
                entlist)
              )
              (entmod entlist)
            )
          )
        )
      )
      (princ (strcat "\n Uaktualniono bazy " (itoa n) " wspó³rzêdnych. "))
    )
  )
  (princ)
)