;; Funkcja wstawia wymiar wpólrzednych poziomych kilometraz w aktualnym LUW
;; razem ze znacznikiem
;;
;;kuba miszcz 2007 :]

(defun c:wymiar_wspolrzednych_kilometraz(/ layerprev skala pkt temp_selection)
  (defun *error* (errorlevel)
    (command "_layer" "u" layerprev "")			;zmienia na poprz warstwe
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq layerprev (getvar "clayer"))			;zapamietuje biezaca warstwe
  (setvar "clayer" warwym)			;ustala akt warstwe na 'wymiary'
  (setq skala (/ (getvar "dimscale") 100))		;skala wymiarowania

  (setq pkt (getpoint "\nWska¿ punkt:"))
  (setq temp_selection (ssadd))  
  (command "_dimordinate" pkt "x" pkt)
  (ssadd (entlast) temp_selection)
  (command "_insert" "kota" pkt (* skala 0.5) (* skala 2) "135")
  (ssadd (entlast) temp_selection)
  (generuj_losowa_nazwe "kilometraz")
  (command "_group" "t" losowa_nazwa "" temp_selection "")
  (setvar "clayer" layerprev)
  (princ)
)
