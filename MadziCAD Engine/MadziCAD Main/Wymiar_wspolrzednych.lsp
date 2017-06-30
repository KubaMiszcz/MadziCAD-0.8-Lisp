;; Funkcja wstawia wymiar wpólrzednych w aktualnym LUW razem z kota, 
;; wstawiana wspolrzedna bazuje na istniejacym stylu wymiarowania
;; wiec jesli cos sie rozjezdza z tekstem wystarczy zmienic w stylu wymiarowania
;;
;;kuba miszcz 2007 :]

(defun c:wymiar_wspolrzednych(/ layerprev skala pkt temp_selection)
  (defun *error* (errorlevel)
    (setvar "dimpost" ".")
    (setvar "clayer" layerprev)			;zmienia na poprz warstwe
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq layerprev (getvar "clayer"))			;zapamietuje biezaca warstwe
  (setvar "clayer" warwym)			;ustala akt warstwe na 'wymiary'
  (setq skala (/ (getvar "dimscale") 100))		;skala wymiarowania

  (setq pkt (getpoint "\n Wska¿ punkt: "))
  (if (= (cadr pkt) 0) (setvar "dimpost" "%%p<>"))	;ustalanie czy wspolrzedna wzgledna czy nie
  (if (> (cadr pkt) 0) (setvar "dimpost" "+<>"))
  (if (< (cadr pkt) 0) (setvar "dimpost" "-<>"))
  (if (> (cadr pkt) (* HH 1000)) (setvar "dimpost" "."))   

  (setq temp_selection (ssadd))  
  (command "_dimordinate" pkt "y" pkt)
  (ssadd (entlast) temp_selection)
  (command "_insert" "kota" pkt skala skala "0")
  (ssadd (entlast) temp_selection)
  (generuj_losowa_nazwe "rzedna")
  (command "_group" "_c" losowa_nazwa "" temp_selection "")

  (setvar "dimpost" ".")
  (setvar "clayer"layerprev)
  (princ)
)
