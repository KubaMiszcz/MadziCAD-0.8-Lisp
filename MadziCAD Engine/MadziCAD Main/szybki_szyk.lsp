(defun c:szybki_szyk(/ temp_selection a)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq temp_selection (ssget))
  (initget 0 "h v")
  (setq a (getkword "\n Szyk: [V-pionowy/H-poziomy]: "))
  (if (= a "h")
    (command "_array"
      temp_selection
      ""
      "p"
      "1"
      (getint "\n Podaj liczbê elementów: ")
      (getreal "\n Podaj rozstaw elementów: ")
    ) 
    (command "_array"
      temp_selection
      ""
      "p"
      (getint "\n Podaj liczbê elementów: ")
      "1"
      (getreal "\n Podaj rozstaw elementów: ")
    ) 
  )
)

