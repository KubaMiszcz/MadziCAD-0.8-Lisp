(defun c:polprosta(/ pt1 pt2 layerprev osmodeprev)
  (defun *error* (errorlevel)
    (setvar "clayer" layerprev)			;zmienia na poprz warstwe
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (setq layerprev (getvar "clayer"))			;zapamietuje biezaca warstwe
  (setq osmodeprev (getvar "osmode"))
  (setvar "clayer" "0")       ;czemuw 2005 nie ma warstwy "defponits" to nei wiem:]
  (setq pt1 (getpoint "\n Wska¿ pocz¹tek pó³prostej:"))
  (defun *error* (errorlevel)
    (setvar "clayer" layerprev)			;zmienia na poprz warstwe
    (setvar "osmode" osmodeprev)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (setvar "osmode" 0)
  (setq pt2 (getpoint "\n Wska¿ kierunek pó³prostej:" pt1))
  (command "_ray" pt1 pt2 "")
  (setvar "clayer" layerprev)			;zmienia na poprz warstwe
  (setvar "osmode" osmodeprev)
  (princ)
)