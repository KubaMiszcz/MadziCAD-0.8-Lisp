(defun c:rzutnie_zablokuj_odblokuj(/ temp_selection)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
 (graphscr)
  (princ "\n Wska¿ rzutnie do zablokowania/odblokowania: ")
  (setq temp_selection (ssget "_:S" '((0 . "VIEWPORT"))))
  (wartosc_wlasciwosci temp_selection 90)
  (check_bit_value wlasciwosc 16384)	;16384=2^14 -> 14+1=15 bit
  (if 
    (= bit_value 1) 				;1-rzutnia zamknieta, 0-rzutnia otwarta
    (progn
      (command "_mview" "_lock" "_off" temp_selection "")
      (command "_chprop" temp_selection "" "_color" "_bylayer" "")
      (princ "\n Otwarto rzutniê. ")
    )    
    (progn
      (command "_mview" "_lock" "_on" temp_selection "")
      (command "_chprop" temp_selection "" "_color" "1" "")
      (princ "\n Zamknieto rzutniê. ")
    )    
  )
  (princ)
)