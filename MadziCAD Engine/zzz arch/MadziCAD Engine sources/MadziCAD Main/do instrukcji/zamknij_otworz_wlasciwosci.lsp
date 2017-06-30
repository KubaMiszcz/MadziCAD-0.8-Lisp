(defun c:zamknij_otworz_wlasciwosci()
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (if 
    (= (getvar "opmstate") 0) 
    (progn
      (command "_properties")
      (princ "\n Otwarto okno w³aœciwoœci. ")
    )
    (progn
      (command "_propertiesclose")
      (princ "\n Zamkniêto okno w³aœciwoœci. ")
    )
  )
  (princ)
)