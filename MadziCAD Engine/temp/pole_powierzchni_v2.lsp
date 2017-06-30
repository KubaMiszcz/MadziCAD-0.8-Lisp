(defun pole_sumowanie()
  (command "_boundary" "z" "w" "n" "" "t" "r" "" 
    (getpoint "\nWska¿ punkt w œrodku pola powierzchni:") ""
  )
  (command "_area" "o" (ssget "_L"))
  (setq pole_obw (/ (getvar 'area) 1000000))
  (command "_erase" (ssget "_L") "")
  (setq pole_pow (+ pole_pow pole_obw))
)

(defun c:pole_powierzchni()
  (setq pole_pow 0)
  (pole_sumowanie)
  (pole_powierzchni)

  (alert (strcat "Ca³kowite Pole powierzchni: " (rtos pole_pow 2 2) " m2"))
)