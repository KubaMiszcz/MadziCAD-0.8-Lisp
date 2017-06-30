;; Funkcja wstawia wymiar wpólrzednych w aktualnym LUW razem z kota, 
;; wstawiana wspolrzedna bazuje na istniejacym stylu wymiarowania
;; wiec jesli cos sie rozjezdza z tekstem wystarczy zmienic w stylu wymiarowania
;;
;;kuba miszcz 2007 :]

(defun c:wymiar_wspolrzednych(/ layerprev skala pkt temp_selection vlobj)
  (defun *error* (errorlevel)
    (setvar "dimpost" ".")
    (setvar "clayer" layerprev)			;zmienia na poprz warstwe
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  
  (setq layerprev (getvar "clayer"))			;zapamietuje biezaca warstwe
  (if (/= (tblsearch "layer" warwym) nil)
    (setvar "clayer" warwym)          			;ustala akt warstwe na 'wymiary'
  )
  (setq skala (getvar "dimscale"))		;skala wymiarowania
  
  (setq temp_selection (ssadd))  
  (command "_dimordinate" pause "_y" (getvar "lastpoint"))

  (setq vlobj (vlax-ename->vla-object (entlast)))
  
  (if (= (cadr (getvar "lastpoint")) 0) (vlax-put-property vlobj 'textoverride "%%p<>"))	;ustalanie czy wspolrzedna wzgledna czy nie
  (if (> (cadr (getvar "lastpoint")) 0) (vlax-put-property vlobj 'textoverride "+<>"))
  (if (< (cadr (getvar "lastpoint")) 0) (vlax-put-property vlobj 'textoverride "-<>"))
  (if (> (cadr (getvar "lastpoint")) (* HH 1000)) (vlax-put-property vlobj 'textoverride ""))   
  
  (ssadd (entlast) temp_selection)
  (if (/= (tblsearch "block" blok_kota) nil)
    (command "_insert" "MadziCAD_kota" "_scale" skala "_rotate" 0 (getvar "lastpoint"))
  )
  (ssadd (entlast) temp_selection)
  (generuj_losowa_nazwe "rzedna")
  (command "_group" "_create" losowa_nazwa "" temp_selection "")
  (setvar "clayer"layerprev)
  (c:wymiar_wspolrzednych)
  (princ)
)
