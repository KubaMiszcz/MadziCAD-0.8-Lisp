(defun c:typowe_kreskowania( / layerprev osmodeprev orthoprev skala kreskowanie rodzaj_kreskowania skala_kreskowania kat_obrotu temp_ent pkt) 
  (defun *error* (errorlevel)
    (setvar "clayer" layerprev)			;zmienia na poprz warstwe
    (setvar "osmode" osmodeprev)
    (setvar "orthomode" orthoprev)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
    (princ)
  )
  (graphscr)
  (setq layerprev (getvar "clayer"))				;zapamietuje biezaca warstwe
  (setq osmodeprev (getvar "osmode"))				;zapamietuje stale tryby lokalizacji
  (setq orthoprev (getvar "orthomode"))			;zapamietuje status orto
  (setq skala (/ (getvar "dimscale") 400))
  (if (/= (tblsearch "layer" warkresk) nil)
    (setvar "clayer" warkresk)          			;ustala akt warstwe na 'kreskowania'
  )
  (setvar "osmode" 0)
  (setvar "orthomode" 0)
  (initget 7 "1 2 3 4 5 6")
  (setq kreskowanie (getkword "\n Wybierz rodzaj kreskowania [1 - Beton, 2 - Chudy beton, 3 - Piasek, 4 - Zwir, 5 - Kamie�, 6 - Beton]: "))
  (if (= kreskowanie "1") 
      (setq rodzaj_kreskowania "ansi33" 
      skala_kreskowania (* skala 200) 
      kat_obrotu 0))
  (if (= kreskowanie "2") 
      (setq rodzaj_kreskowania "dash" 
      skala_kreskowania (* skala 40)
      kat_obrotu 45))    
  (if (= kreskowanie "3") 
      (setq rodzaj_kreskowania "ar-sand" 
      skala_kreskowania (* skala 5)
      kat_obrotu 0))
  (if (= kreskowanie "4") 
      (setq rodzaj_kreskowania "ar-conc" 
      skala_kreskowania (* skala 5)
      kat_obrotu 0))    
  (if (= kreskowanie "5") 
      (setq rodzaj_kreskowania "gravel" 
      skala_kreskowania (* skala 80)
      kat_obrotu 0))    
  (if (= kreskowanie "6") 
      (setq rodzaj_kreskowania "ansi31" 
      skala_kreskowania (* skala 100)
      kat_obrotu 0))    
      
      
  (command "_boundary" (getpoint "\n Wska� punkt w �rodku obszaru do zakreskowania: ") "")
  (setq temp_ent (entlast))
  (command "_hatch" rodzaj_kreskowania skala_kreskowania kat_obrotu (entlast) "")
  (entdel temp_ent)
  (command "_regen")
  (setq pkt (getpoint "\n Wska� punkt w kolejnym obszarze lub [Enter] aby zako�czy�: "))
  (while (/= pkt nil)
  (command "_hatchedit" (entlast) "d" pkt "")
  (command "_regen")
  (setq pkt (getpoint "\n Wska� punkt w kolejnym obszarze lub [Enter] aby zako�czy�: "))
  )
  (setvar "clayer" layerprev)			;zmienia na poprz warstwe
  (setvar "osmode" osmodeprev)
  (setvar "orthomode" orthoprev)
  (princ)
)










  ; 
    ; (ssadd (entlast) ss)
    ; (command pause)
  ; )
  ; (selection_to_list ss)
  ; (setq ss2 nil)
  ; (repeat (sslength ss)
    ; (setq ss2 (cons(entget(entlast))ss2))
    ; (entdel (entlast))
  ; )
  ; (setq n 0)
  ; (setq ss3 nil)
  ; (repeat (sslength ss)
    ; (setq ent (nth n ss2))
    ; (entmake ent)
    ; (setq ss3 (cons(entget(entlast))ss3))
    ; (setq n (1+ n))
    ; (princ n)
  ; )
 ; (setq n 0)  
    ; (command "_hatch" "ansi33" 100 0 "y" "n" "d" (foreach item ss3 (progn (nth n ss3)(setq n (1+ n)))))
  
  
  
  ; (setq n 0)
  ; (setq ss (ssadd))
  ; (command "_boundary" (getpoint))
  ; (while (= (logand (getvar "cmdactive") 1) 1)
    ; (ssadd (entlast) ss)
    ; (command pause)
  ; )
  ; (selection_to_list ss)
  ; (setq ss2 nil)
  ; (repeat (sslength ss)
    ; (setq ss2 (cons(entget(entlast))ss2))
    ; (entdel (entlast))
  ; )
  ; (setq n 0)
  ; (setq ss3 nil)
  ; (repeat (sslength ss)
    ; (setq ent (nth n ss2))
    ; (entmake ent)
    ; (setq ss3 (cons(entget(entlast))ss3))
    ; (setq n (1+ n))
    ; (princ n)
  ; )
 ; (setq n 0)  
    ; (command "_hatch" "ansi33" 100 0 "y" "n" "d" (foreach item ss3 (progn (nth n ss3)(setq n (1+ n)))))
  