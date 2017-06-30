(defun c:orto_osnap_on_off()
  (graphscr)
  (if						;zapamietuje punkty lokalizacji uzytkownika
    (= (getvar "osmode") 0)			
    ()
    (progn
      (setq osmodeprev (getvar "osmode"))
    )
  )   
  (if 
    (or (= (getvar "orthomode") 0) (= (getvar "osmode") 0))
    (progn 					;wartosc jezeli prawda
      (setvar "orthomode" 1)
      (setvar "osmode" osmodeprev)
    )
    (progn   					;wartosc jezeli falsz
      (setvar "orthomode" 0)				
      (setvar "osmode" 0)
    )
  )
(command "_regenall")		
(princ)
)

