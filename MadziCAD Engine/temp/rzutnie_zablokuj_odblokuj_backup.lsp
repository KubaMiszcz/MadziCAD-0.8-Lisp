(defun c:rzutnie_zablokuj_odblokuj()
  (princ "\nWska¿ rzutnie do zablokowania/odblokowania:")
  (setq vport (ssget "_:S"))
  (setq vportstatus (cdr (assoc 90 (entget (ssname vport 0)))))
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