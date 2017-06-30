(defun c:ukryj_odkryj_obiekty(/ temp_selection pkt flaga_ukryj_odkryj block_hh losowa_nazwa)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana ")
  )
  (if 
    (= flaga_ukryj_odkryj nil)
;***nie bylo wczesniej wykonane
    (progn
      (princ "\n Wybierz obiekty do ukrycia: ")
      (setq temp_selection (ssget))
      (generuj_losowa_nazwe "MadziCAD_block_hh")
      (setq block_hh losowa_nazwa)
      (setq pkt (trans '(0 0) 1 0))
      (command "_block" block_hh pkt temp_selection "")
      (princ (strcat "\n Ukryto " (rtos (sslength temp_selection)) " wybranych obiektów. "))
      (setq flaga_ukryj_odkryj 1)
    )
;***bylo wczesniej wykonane  
    (progn
    (setq pkt (trans '(0 0) 1 0))
    (command "_insert" block_hh pkt 1 1 0)
    (command "_explode" (entlast))
    (command "_purge" "_blocks" block_hh "_no")
    (setq flaga_ukryj_odkryj nil)
    (princ "\n Przywrócono ukryte obiekty. ")
    )
  )
  
  (princ)
)