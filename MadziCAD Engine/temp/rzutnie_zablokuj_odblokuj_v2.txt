(defun c:rzutnie_zablokuj_odblokuj()
  (princ "\nWska¿ rzutnie do zablokowania/odblokowania:")
  (setq temp (ssget "_:S"))
  (setq ss (ssget "_P"))
  (wartosc_wlasciwosci ss 90)
  (setq vportstatus wlasciwosc)
  (if 
    (= vportstatus 835936) 				;835936-rzutnia zamknieta, 819552-rzutnia otwarty
    (progn
      (command "_mview" "z" "n" vport "")
      (princ "\nOtwarto rzutniê")
    )    
    (progn
      (command "_mview" "z" "t" vport "")
      (princ "\nZamknieto rzutniê")
    )    
  )
  (princ)
)