(defun c:typowy_tekst(/ layerprev osmodeprev pkt ostatni_tekst entlist new_text)
  (defun *error* (errorlevel)
    (setvar "osmode" osmodeprev)
    (setvar "clayer" layerprev)			;zmienia na poprz warstwe
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq layerprev (getvar "clayer"))			;zapamietuje biezaca warstwe
  (setq osmodeprev (getvar "osmode"))
  (if (/= (tblsearch "layer" warwym) nil)
    (setvar "clayer" warwym)          			;ustala akt warstwe na 'wymiary'
  )
  (setq pkt (getpoint "\n Wska¿ punkt wstawienia tekstu: "))
  (setvar "osmode" 0)
  (initdia)
  (command "_mtext" 
    pkt
    "_justify" "_bl" 
    "_height" (* (getvar "dimscale") txta)			;wysokosc tekstu
    pkt
  )
  
;zamiana tekstu na duze litery jesli tak usatawione w pliku ustawienia
  (setq ostatni_tekst (ssget "_L"))
  
  (if (= all_uppercase 1)
    (progn
      (setq entlist (entget (ssname ostatni_tekst 0)))
      (setq new_text (strcase (cdr (assoc 1 entlist))))
      (setq entlist     ;zmiana na duze litery
        (subst 
          (cons 1 new_text) 
          (assoc 1 entlist) 
          entlist
        )
      )
      (entmod entlist)
    )
  )
   
   ;dodawanie maski 
  (if (= automatyczne_dodawanie_maski_tla_do_tekstow 1)
    (progn
      (setq entlist (entget (ssname ostatni_tekst 0)))
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
  (setvar "osmode" osmodeprev)
  (setvar "clayer" layerprev)			;zmienia na poprz warstwe
  (princ)  
)
