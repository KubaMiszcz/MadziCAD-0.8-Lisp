(defun c:wymiar_katowy(/ layerprev pkt1 pkt2)
  (defun *error* (errorlevel)
    (setvar "clayer" layerprev)			;zmienia na poprz warstwe
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq layerprev (getvar "clayer"))			;zapamietuje biezaca warstwe
  (if (/= (tblsearch "layer" warwym) nil)
    (setvar "clayer" warwym)          			;ustala akt warstwe na 'wymiary'
  )
  (command "_dimangular" 
    pause
    pause
;    (progn
;      (princ "\n Wska¿ punkt wstawienia wymiaru (ENTER - kontynuacja poprzedniego wymiaru): ")
;      pause
;    )
  )
  (setvar "clayer" layerprev)			;zmienia na poprz warstwe
  (princ)
)

