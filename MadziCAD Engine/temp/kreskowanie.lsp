(defun c:kk()
  (graphscr)
  (setq ss (ssadd))
  (command "_boundary"
    (while (= (logand (getvar "cmdactive") 1) 1)
      (command pause)
      (ssadd (entlast) ss) 
      (princ "\ndsds")
    )
  )
  (command "_hatch" "ar-sand" 10 45 0 ss)






)