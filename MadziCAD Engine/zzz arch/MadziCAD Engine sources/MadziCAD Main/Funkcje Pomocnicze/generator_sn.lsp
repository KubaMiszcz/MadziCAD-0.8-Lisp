(defun c:gen(/ ciag dlugosc_ciagu key1 key2 key3 key4 char1 char2 char3 char4 n1 n2 n3 n4 numer_usera serial_number serial_number2 ascii_code keysn )
  (setq ciag (getstring "\n Podaj kod ¿¹dania przyslany emailem: "))
  
  ;;odszyforwania numeru usera:
  (setq dlugosc_ciagu (strlen ciag))
  (setq key1 (substr ciag (- dlugosc_ciagu 11) 1))
  (setq key2 (substr ciag (- dlugosc_ciagu 8) 1))
  (setq key3 (substr ciag (- dlugosc_ciagu 5) 1))
  (setq key4 (substr ciag (- dlugosc_ciagu 1) 1))

  (setq key1 (ascii key1))
  (setq key2 (ascii key2))
  (setq key3 (ascii key3))
  (setq key4 (ascii key4))

  (setq key1 (+ 0  (- key1 (* 10 (/ key1 10)))))
  (setq key2 (+ 10 (- key2 (* 10 (/ key2 10)))))
  (setq key3 (+ 20 (- key3 (* 10 (/ key3 10)))))
  (setq key4 (+ 30 (- key4 (* 10 (/ key4 10)))))
  
  (setq char1 (substr ciag key1 1))
  (setq char2 (substr ciag key2 1))
  (setq char3 (substr ciag key3 1))
  (setq char4 (substr ciag key4 1))

  (setq n1 (- (ascii char1) (* 10 (/ (ascii char1) 10))))
  (setq n2 (- (ascii char2) (* 10 (/ (ascii char2) 10))))
  (setq n3 (- (ascii char3) (* 10 (/ (ascii char3) 10))))
  (setq n4 (- (ascii char4) (* 10 (/ (ascii char4) 10))))
  
  (setq numer_usera (strcat (itoa n1) (itoa n2) (itoa n3) (itoa n4)))
  (princ (strcat "\n Numer uzytkownika: " numer_usera))
  (princ)
  
  ;;generacja SN
  (setq serial_number (substr ciag 1 10))
  (random_number)
  (setq keysn (fix (1+ (* 9 ran))))
  (setq n 1)
  (setq serial_number2 "")
  (repeat 10
    (setq ascii_code (ascii (substr serial_number n 1)))
    (setq ascii_code (+ ascii_code keysn))
    (setq serial_number2 (strcat serial_number2 (chr ascii_code)))
    (setq n (1+ n))
  )

  (random_number)
  (setq ascii_code (fix (+ (* ran 50) 60)))
  (setq keysn (+ (* (/ ascii_code 10) 10) keysn))
  (setq serial_number2 (strcat serial_number2 (chr keysn)))
  (princ (strcat "\n SN:" serial_number2)) 
  (princ)
)