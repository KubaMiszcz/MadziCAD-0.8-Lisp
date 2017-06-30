(defun c:linia_odniesienia(/ layerprev osmodeprev dimclrtprev orthoprev dimaszprev)
  (defun *error* (errorlevel)
    (setvar "osmode" osmodeprev)
    (setvar "orthomode" orthoprev)
    (setvar "dimclrt" dimclrtprev)			;kolor tekstu linii odniesienia
    (setvar "clayer" layerprev)			;zmienia na poprz warstwe
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq layerprev (getvar "clayer"))			;zapamietuje biezaca warstwe
  (setq osmodeprev (getvar "osmode"))
  (setq dimclrtprev (getvar "dimclrt"))			;kolor tekstu w stylu wymiarowania
  (setq orthoprev (getvar "orthomode"))
  (setq dimaszprev (getvar "dimasz"))
  (setvar "clayer" warwym)			;ustala akt warstwe na 'wymiary'
  (setvar "dimclrt" kolor_tekstu_linii_odniesienia)	;kolor tekstu linii odniesienia
  (setvar "osmode" 0)
  (setvar "orthomode" 0)
  (command "_qleader" 
    (getpoint "\n Wska¿ pierwszy punkt: ")
    (progn (princ "\n Wska¿ drugi punkt: ") pause)
    ""
  )
  ;(generuj_losowa_nazwe "linia_odniesienia_")
  ;(command "_group" "_c" losowa_nazwa "" pkt1 (entlast) "")
  
  (setvar "osmode" osmodeprev)
  (setvar "orthomode" orthoprev)
  (setvar "dimclrt" dimclrtprev)      ;kolor tekstu linii odniesienia
  (setvar "clayer" layerprev)         ;zmienia na poprz warstwe
  (princ)
)
