(defun c:szybki_szyk(/ temp_selection pt1 pt2 rozstaw liczba_element�w)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq temp_selection (ssget))
 
  (setq pt1 (getpoint "\n Wska� pierwszy punkt bazowy obiektu(�w): "))
  (setq pt2 (getpoint pt1 "\n Wska� drugi punkt linii kierunkowej, lub podaj rozstaw i wskaz kierunek: "))
  (setq rozstaw (sqrt (+ (expt (- (car pt2) (car pt1)) 2) (expt (- (cadr pt2) (cadr pt1)) 2))))
  (setq liczba_element�w (getint "\n Podaj liczb� element�w: "))
  
  (command "_ucs" "_new" "3" pt1 pt2 "")
  (command "_array"
      temp_selection
      ""
      "_rectangular"
      "1"
      liczba_element�w
      rozstaw
  )
  (command "_ucs" "_previous")
)