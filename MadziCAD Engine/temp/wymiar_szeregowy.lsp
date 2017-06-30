(defun C:xxx()
  (graphscr)
  (setq layerprev (getvar "clayer"))			;zapamietuje biezaca warstwe
  (setvar "dimpost" ".")
  (command "_layer" "u" warwym "")			;ustala akt warstwe na 'wymiary'
;  (setq pkt1 (getpoint "\nWska¿ kolejny punkt:"))  
  (command "_dimcontinue"
    "w" 
    pause
    pause
    ""
;    (getpoint "\nWska¿ kolejny punkt:")
  )
  (command "_layer" "u" layerprev "")			;zmienia na poprz warstwe
  (princ "ssss")
)
