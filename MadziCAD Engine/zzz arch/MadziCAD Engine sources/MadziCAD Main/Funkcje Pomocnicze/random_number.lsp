(defun random_number( / luprecprev waga n1_prev n1 wykladnik1 nn1) ; generator losowej liczby
  (setq luprecprev (getvar "luprec"))
  (setvar "luprec" 8)
  (setq waga 0)
  (setq ran 0)
  (repeat 3
    (setq n1_prev (atoi (substr (rtos (* 1000000000(getvar "date"))) 16)))
    (setq n1 (atoi (substr (rtos (* 1000000000(getvar "date"))) 16)))
    (while (= n1 n1_prev)
      (setq n1 (atoi (substr (rtos (* 1000000000(getvar "date"))) 16)))
    )
    (setq n1_prev n1)
    (setq wykladnik1 (1+ (atoi (substr (itoa n1) (strlen (itoa n1))))))
    (setq nn1 (expt n1 wykladnik1)) 
    (setq nn1 (itoa nn1))
    (setq nn1 (atoi (substr nn1 (strlen nn1))))
    (setq ran (+ ran (* nn1 (expt 10 waga))))
    (setq waga (1+ waga))
  )
  (setq ran (/ ran 1000.0))
  (setvar "luprec" luprecprev)
  (princ)
)







