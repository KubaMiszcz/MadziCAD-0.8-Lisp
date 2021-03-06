(defun szybki_wybor_internal(mode / osmodeprev orthoprev temp_selection)
  (defun *error* (errorlevel)
    (setvar "osmode" osmodeprev)  
    (setvar "orthomode" orthoprev) 
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq osmodeprev (getvar "osmode"))				;zapamietuje stale tryby lokalizacji
  (setq orthoprev (getvar "orthomode"))				;zapamietuje status orto
  (setvar "osmode" 0)  
  (setvar "orthomode" 0)  
  (command "_select" "j" mode pause )
  (sssetfirst nil (ssget "_P"))
  (princ (strcat "\n Utworzono tymczasowy zbi�r wskaza� z " (rtos(sslength (ssget "_P"))) " obiekt�w. "))
  (setvar "osmode" osmodeprev)  
  (setvar "orthomode" orthoprev)
  (princ)

)
(defun c:szybki_wybor()
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (initget 7 "c v b")
  (setq kword (getkword "\n Podaj spos�b wyboru: [C - Kraw�d�, V - Otwarty wielobok, B - Zamkni�ty wielobok]: "))
  (if (= kword "c")(setq mode "k"))
  (if (= kword "v")(setq mode "ow"))
  (if (= kword "b")(setq mode "zw"))
  (szybki_wybor_internal mode)
)



(defun c:szybki_wybor_krawedz()
  (graphscr)
  (szybki_wybor_internal "k")
)
(defun c:szybki_wybor_otwarty_wielobok()
  (graphscr)
  (szybki_wybor_internal "ow")
)
(defun c:szybki_wybor_zamkniety_wielobok()
  (graphscr)
  (szybki_wybor_internal "zw")
)
