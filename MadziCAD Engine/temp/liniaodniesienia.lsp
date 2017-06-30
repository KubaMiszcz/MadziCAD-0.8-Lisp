(defun c:LO()
  (graphscr)
  (setq layerprev (getvar "clayer"))			;zapamietuje biezaca warstwe
  (command "_layer" "u" warwym "")			;ustala akt warstwe na 'wymiary'
  (setvar "dimasz" (* (getvar "dimasz") 2))		;a to bo strzalka jest za mala
  (command "_qleader" 
    (getpoint "\nWska¿ pierwszy punkt:")
    (getpoint "\nWska¿ drugi punkt:")
    ""
    ""
  )
  (setvar "dimasz" (/ (getvar "dimasz") 2))		;przywraca poprzedni rozmiar strza³ki
  (command "_layer" "u" layerprev "")			;zmienia na poprz warstwe
  (princ)
)
