(defun c:zamknij_otworz_wlasciwosci()
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (if 
    (= (getvar "opmstate") 0) 
    (progn
      (command "_properties")
      (princ "\n Otwarto okno w�a�ciwo�ci. ")
    )
    (progn
      (command "_propertiesclose")
      (princ "\n Zamkni�to okno w�a�ciwo�ci. ")
    )
  )
  (princ)
)