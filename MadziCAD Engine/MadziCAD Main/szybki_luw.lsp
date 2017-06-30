(defun c:szybki_luw(/ pkt1 pkt2)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq pkt1 (getpoint "\n Wska¿ pocz¹tek nowego LUW: "))
  (princ "\n Wska¿ kierunek osi X: ")
  (command "_line" pkt1 pause "")
  (setq pkt2 (cdr (assoc 11 (entget (entlast)))))		;pkt2 w GUW
  (setq pkt2 (trans pkt2 0 1))					;;pkt2 z GUW do LUW 
  (command "_erase" (entlast) "")
  (command "_ucs" "n" "3"
  pkt1
  pkt2
  ""
  )
  (princ)
)

