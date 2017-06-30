(defun c:ukryj_odkryj_obiekty()
;***sprawdzenie czy wartstwa TEMP istnieje***
  (if (tblsearch "layer" "temp")
    ()
    (command "_layer" "t" "temp" "")
  )
;********************************************
  (if 
    (= flaga_ukryj_odkryj 0)
;***nie bylo wczesniej wykonane
    (progn					
      (princ "\nWybierz obiekty do ukrycia:")
      (setq temp (ssget "_:S"))
      (setq ss (ssget "_P"))
      (generuj_losowa_nazwe "block")
      (setq temp_block losowa_nazwa
      (command "_block" temp_block '(0 0) ss "")
      




    (setq flaga_ukryj_odkryj 1)
    )
;***bylo wczesniej wykonane
    (progn




    (setq flaga_ukryj_odkryj 0)
    )
  )
  (princ "bla bl abla")
)