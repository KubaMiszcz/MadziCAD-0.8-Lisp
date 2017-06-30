(defun c:szybki_luw_zmiana(/ pkt1)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (if (= luw_flag 0)
    (progn
      (setq pkt1 (getpoint "\n Wska¿ pocz¹tek nowego LUW: "))
      (command "_ucs" "_new" "_3"
      pkt1
      (getpoint "\n Wska¿ kierunek osi X: " pkt1)
      ""
      )
      (setq luw_flag 1)
      (princ "\n Ustalono nowy LUW. ")
    )
    (progn
      (command "_ucs" "_previous")
      (setq luw_flag 0)
      (princ "\n Przwyrócono poprzedni LUW. ")
    )
  )
  (princ)
)


