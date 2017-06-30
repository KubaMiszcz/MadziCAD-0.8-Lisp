;; Funkcja wstawia strzalke i wartosc spadku w [%]
;;
;; kuba miszcz 2007 :]

(defun c:spadek(/ layerprev osmodeprev orthoprev skala anglerad angledeg ucs2ndpt spadek spadektxt strzalka bazatxt wyrownanie pkt temp_selection)
  (graphscr)
  (setq layerprev (getvar "clayer"))				;zapamietuje biezaca warstwe
  (if (tblsearch "ucs" "temp_luw")
    (command "_ucs" "u" "temp_LUW")
    ()
  )
  (command "_ucs" "a" "temp_LUW")				;zapamietuje biezacy LUW
  (setq osmodeprev (getvar "osmode"))				;zapamietuje stale tryby lokalizacji
  (setq orthoprev (getvar "orthomode"))				;zapamietuje status orto
  (command "_layer" "u" warwym "")				;ustala akt warstwe na 'wymiary'
  (setq skala (/ (getvar "dimscale") 100))			;skala wstawiania
  (setvar "orthomode" 0)  

  (setq anglerad (getangle "\nWska¿ dwa punkty:"))		;kat w radianach
  (setq angledeg (* anglerad (/ 180 pi)))			;kat w stopniach

;ustalenie kierunku strzalki
  (if
    (>= angledeg 180)
    (setq angledeg (- angledeg 180))
    () 
  )
  (if
    (>= angledeg 90)
    (setq angledeg (- angledeg 180))
    () 
  )

  (setq ucs2ndpt (rtos angledeg 2 9))				;2 punkt do tymczasowego luw
  (setq ucs2ndpt (strcat "@10<" ucs2ndpt))

  (setq spadek (* 100 (abs (/ (sin anglerad) (cos anglerad)))))	;100% * tangens kata = spadek
  (setq spadektxt (rtos spadek 2 dokl_spadku))				;dokladnosc spadku
  (setq spadektxt (strcat spadektxt "%"))

  (if
    (and (> angledeg 0))
    (progn
      (setq strzalka "spadek w lewo")
      (setq bazatxt  (list (* skala -200) (* skala 40)))        ;do skali opisu
      (setq wyrownanie "dp")
    )
    (progn
      (setq strzalka "spadek w prawo")
      (setq bazatxt (list (* skala 200) (* skala 40))) 
      (setq wyrownanie "dl")
    )
  )

  (setvar "osmode" 0)
  (setq pkt (getpoint "\nWska¿ polozenie opisu:"))
  (command "_ucs" "n" "3" pkt ucs2ndpt "")				;tymczasowy luw do wstawienia tekstu
    
  (command "_insert" strzalka "0,0" skala skala "0") 
  (setq temp_selection (ssget "_L"))

  (command "_mtext" 
           bazatxt 
           "w" wyrownanie 
           "k" (* txta skala 100) 
           "b" "0"
           bazatxt  
           spadektxt 
           ""
  )
  (ssadd (entlast) temp_selection)
  (generuj_losowa_nazwe "spadek")
;  (command "_block" losowa_nazwa pkt temp_selection "")
;  (command "_insert" losowa_nazwa pkt 1 1 0)

  
;  (command "_group" "t" losowa_nazwa "" temp_selection "")

  (setvar "osmode" osmodeprev)
  (setvar "orthomode" orthoprev)
  (command "_ucs" "w" "temp_LUW")			;powrot do poprzedniego luw
  (command "_ucs" "u" "temp_LUW")
  (command "_layer" "u" layerprev "")			;zmienia na poprz warstwe			
)