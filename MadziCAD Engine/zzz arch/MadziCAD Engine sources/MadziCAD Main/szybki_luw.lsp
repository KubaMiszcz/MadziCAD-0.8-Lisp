(defun c:szybki_luw (/ pkt1)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (initget 137)
  (setq
    pkt1 (getpoint "\n Wska¿ pocz¹tek nowego LUW lub <Poprzedni>: ")
  )
  (if (= (listp pkt1) nil)
    (progn
      (command "_ucs" "_previous")
    )
    (progn
      (setq
	pkt2 (getpoint pkt1 "\n Wska¿ kierunek osi X: ")
      )
      (command "_ucs" "_new" "3" pkt1 pkt2 "")
    )
  )
  (setq luw_flag 0)
  (princ "\n Ustalono nowy LUW. ")
  (princ)
)

