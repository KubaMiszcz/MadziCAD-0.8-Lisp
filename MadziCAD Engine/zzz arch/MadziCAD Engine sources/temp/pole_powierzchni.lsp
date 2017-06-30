(defun pole_sumowanie(/ pole_obw pole_pow )
  (command "_boundary" "z" "w" "n" "" "t" "r" "" 
    (getpoint "\n Wska¿ punkt w œrodku pola powierzchni: ") 
    ""
  )
  (command "_area" "o" (ssget "_L"))
  (setq pole_obw (/ (getvar 'area) 1000000))
;  (command "_erase" (ssget "_L") "")		;lepiej regionwo nie kasowac zeby sprawdzic obwiednie
  (setq pole_pow_poprz pole_pow)
  (setq pole_pow (+ pole_pow pole_obw))
  (alert 
    (strcat 
      "\nSuma dotychczas wskazanych pól:\t" (rtos pole_pow_poprz 2 2) "\tm2"
      "\nPole wskazanej obwiedni:\t\t" (rtos pole_obw 2 2) "\tm2"
      "\n\t\t\t-------------------"
      "\nCa³kowite Pole powierzchni:\t\t" (rtos pole_pow 2 2) "\tm2"
      "\n"
      "\n               Wska¿ kolejn¹ obwiedniê"
    )
  )
  (princ)
)

(defun c:pole_powierzchni()
  (setq pole_pow 0)
  (command "_layer" "u" 0 "")		;zmiana na warstwe 0
  (repeat 100 (pole_sumowanie))
  (princ)
)