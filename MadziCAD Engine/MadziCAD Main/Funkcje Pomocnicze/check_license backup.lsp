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

(defun c:generator_kodu_zadania(/ license_file kod_jawny liczba_znakow lu1 lu2 lu3 lu4 char1 char2 char3 char4 ascii_code_prev file cnt ascii_code key1 key2 key3 key4)
  (setq license_file "c:\\lict.txt")
  (setq kod_jawny "2481")         ;********************************
;liczba znakow pliku     
  (random_number)
  (setq liczba_znakow (+ (1+ (fix (* ran 10))) 31))       ;10+15=25 znakow
  (setq liczba_znakow 50)
;miejsca znakow
  (random_number)
  (setq lu1 (+ 0   (1+ (fix (* ran 10)))))                  ;miejsce pierwsza cyfra liczby uruchomien
  (random_number)
  (setq lu2 (+ 10 (1+ (fix (* ran 10)))))                  ;miejsce druga cyfra liczby uruchomien
  (random_number)
  (setq lu3 (+ 20 (1+ (fix (* ran 10)))))                  ;miejsce trzecia cyfra liczby uruchomien
  (random_number)
  (setq lu4 (+ 30 (1+ (fix (* ran 10)))))                  ;miejsce trzecia cyfra liczby uruchomien
;wartosci znakow
  (random_number)
  (setq char1 (fix (+ (* ran 209) 40)))
  (setq char1 (+ (* (/ char1 10) 10) 2))         ;+3 bo 300 uruchomien
  (random_number)
  (setq char2 (fix (+ (* ran 209) 40)))
  (setq char2 (+ (* (/ char2 10) 10) 4))         ;+0 bo 300 uruchomien
  (random_number)
  (setq char3 (fix (+ (* ran 209) 40)))
  (setq char3 (+ (* (/ char3 10) 10) 8))         ;+0 bo 300 uruchomien
  (random_number)
  (setq char4 (fix (+ (* ran 209) 40)))
  (setq char4 (+ (* (/ char4 10) 10) 1))         ;+0 bo 300 uruchomien
;generacja pliku      
  (setq ascii_code_prev 1)
  (setq kod_zadania "")
  (setq file (open license_file "w")) 
  
  (setq cnt lu1)
  (while (/= cnt 1)      
    (random_number)
    (setq ascii_code (fix (+ (* ran 224) 32)))
    (setq kod_zadania (write-char ascii_code file)
    (setq cnt (1- cnt))
  )
      
  (write-char char1 file)   
  
  (setq cnt (1- lu2))
  (while (/= cnt lu1)      
    (random_number)
    (setq ascii_code (fix (+ (* ran 224) 32)))
    (write-char ascii_code file)
    (setq cnt (1- cnt))
  )
  
  (write-char char2 file)
  
  (setq cnt (1- lu3))
  (while (/= cnt lu2)      
    (random_number)
    (setq ascii_code (fix (+ (* ran 224) 32)))
    (write-char ascii_code file)
    (setq cnt (1- cnt))
  )      
      
  (write-char char3 file)
  
  (setq cnt (1- lu4))
  (while (/= cnt lu3)      
    (random_number)
    (setq ascii_code (fix (+ (* ran 224) 32)))
    (write-char ascii_code file)
    (setq cnt (1- cnt))
  )      
  
  (write-char char4 file)
  
  (setq cnt (- liczba_znakow lu4))
  (while (/= cnt 0)      
    (random_number)
    (setq ascii_code (fix (+ (* ran 224) 32)))
    (write-char ascii_code file)
    (setq cnt (1- cnt))
  )

;dodanie klucza do pliku
  (random_number)
  (setq key1 (fix (+ (* ran 224) 32)))
  (setq key1 (+ (* (/ key1 10) 10) lu1))         ;zapis klucza
  (random_number)
  (setq key2 (fix (+ (* ran 224) 32)))
  (setq key2 (+ (* (/ key2 10) 10) lu2))
  (random_number)
  (setq key3 (fix (+ (* ran 224) 32)))
  (setq key3 (+ (* (/ key3 10) 10) lu3))
  (random_number)
  (setq key4 (fix (+ (* ran 224) 32)))
  (setq key4 (+ (* (/ key4 10) 10) lu4))
  
  (write-char key1 file)
  (write-char key2 file)
  (write-char key3 file)
  (write-char key4 file)
  
  (close file)
  (princ)
           
)  

(defun c:dekoder_kodu_zadania(/ license_file file ciag dlugosc_ciagu key1 key2 key3 key4 char1 char2 char3 char4 n1 n2 n3 n4)
  (setq license_file "c:\\lict.txt")
  (setq file (open license_file "r")) 
  (setq ciag (read-line file))
  (close file)
  
  (setq dlugosc_ciagu (strlen ciag))
  (setq key1 (substr ciag (- dlugosc_ciagu 3) 1))
  (setq key2 (substr ciag (- dlugosc_ciagu 2) 1))
  (setq key3 (substr ciag (- dlugosc_ciagu 1) 1))
  (setq key4 (substr ciag (- dlugosc_ciagu 0) 1))
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
  
  (setq nn (atoi (strcat (itoa n1) (itoa n2) (itoa n3) (itoa n4))))
  (princ nn)
  (princ)

)

(defun c:license_test()
(graphscr)
(setq license_file (strcat "c:\\lict.txt"))
(setq file (open license_file "r"))
  (if 
  (= file nil)    ;czy plik istnieje
    ;====jesli plik nie istnieje
    ;to generuje kod zadania ===tuttaj wpisuje sobie kod===
  (progn
    (c:generator_kodu_zadania)
    (alert (strcat "tutaj wyswietl kod zadania:" )
  )

;;jesli plik istnieje
    ; (progn                      
      ; (setq file (open license "r"))
      ; (setq ciag (read-line file))
      ; (close file)
      
      ; (setq dlugosc_ciagu (strlen ciag))
      ; (setq key1 (substr ciag (- dlugosc_ciagu 2) 1))
      ; (setq key2 (substr ciag (- dlugosc_ciagu 1) 1))
      ; (setq key3 (substr ciag (- dlugosc_ciagu 0) 1))
      ; (setq key1 (ascii key1))
      ; (setq key2 (ascii key2))
      ; (setq key3 (ascii key3))
      ; (setq key1 (+ 0  (- key1 (* 10 (/ key1 10)))))
      ; (setq key2 (+ 10 (- key2 (* 10 (/ key2 10)))))
      ; (setq key3 (+ 20 (- key3 (* 10 (/ key3 10)))))
      
      ; (setq char1 (substr ciag key1 1))
      ; (setq char2 (substr ciag key2 1))
      ; (setq char3 (substr ciag key3 1))
      
      ; (setq n1 (- (ascii char1) (* 10 (/ (ascii char1) 10))))
      ; (setq n2 (- (ascii char2) (* 10 (/ (ascii char2) 10))))
      ; (setq n3 (- (ascii char3) (* 10 (/ (ascii char3) 10))))
      
      ; (setq nn (atoi (strcat (itoa n1) (itoa n2) (itoa n3))))
      ; (princ nn)
      
      
      ; (if           
        ; (< nn 1)    ;czy uruchomienia sie nie skonczyly
        ; (progn    ;skonczyly sie
          ; (alert "error za malo kredytow :]]")
          ; (quit)
        ; )
        ; (progn  ;nie skonczyly sie
          ; (setq nn (1- nn))
          ; (setq nn (itoa nn))
          ; (princ nn)
          
          ; (setq n1 (substr nn 1 1)) 
          ; (setq n2 (substr nn 2 1)) 
          ; (setq n3 (substr nn 3 1)) 
;;generowanie nowego pliku 
          ; (random_number)
          ; (setq liczba_znakow (+ (1+ (fix (* ran 10))) 31))       ;10+15=25 znakow
          ; (setq liczba_znakow 32)
;;miejsca znakow
          ; (random_number)
          ; (setq lu1 (+ 0   (1+ (fix (* ran 10)))))                  ;miejsce pierwsza cyfra liczby uruchomien
          ; (random_number)
          ; (setq lu2 (+ 10 (1+ (fix (* ran 10)))))                  ;miejsce druga cyfra liczby uruchomien
          ; (random_number)
          ; (setq lu3 (+ 20 (1+ (fix (* ran 10)))))                  ;miejsce trzecia cyfra liczby uruchomien
;;wartosci znakow
          ; (random_number)
          ; (setq char1 (fix (+ (* ran 224) 32)))
          ; (setq char1 (+ (* (/ char1 10) 10) (atoi n1)))         ;+3 bo 300 uruchomien
          ; (random_number)
          ; (setq char2 (fix (+ (* ran 224) 32)))
          ; (setq char2 (+ (* (/ char2 10) 10) (atoi n2)))         ;+0 bo 300 uruchomien
          ; (random_number)
          ; (setq char3 (fix (+ (* ran 224) 32)))
          ; (setq char3 (+ (* (/ char3 10) 10) (atoi n3)))         ;+0 bo 300 uruchomien
;;generacja pliku      
          ; (setq ascii_code_prev 1)
          ; (setq file (open license "w")) 
          
          ; (setq cnt lu1)
          ; (while (/= cnt 1)      
            ; (random_number)
            ; (setq ascii_code (fix (+ (* ran 224) 32)))
            ; (if 
              ; (/= ascii_code ascii_code_prev)
              ; (progn
                ; (write-char ascii_code file)
                ; (setq ascii_code_prev ascii_code)
                ; (setq cnt (1- cnt))
              ; )
            ; )
          ; )
      
          ; (write-char char1 file)   
          
          ; (setq cnt (1- lu2))
          ; (while (/= cnt lu1)      
            ; (random_number)
            ; (setq ascii_code (fix (+ (* ran 224) 32)))
            ; (if 
              ; (/= ascii_code ascii_code_prev)
              ; (progn
                ; (write-char ascii_code file)
                ; (setq ascii_code_prev ascii_code)
                ; (setq cnt (1- cnt))
              ; )
            ; )
          ; )
      
          ; (write-char char2 file)
          
          ; (setq cnt (1- lu3))
          ; (while (/= cnt lu2)      
            ; (random_number)
            ; (setq ascii_code (fix (+ (* ran 224) 32)))
            ; (if 
              ; (/= ascii_code ascii_code_prev)
              ; (progn
                ; (write-char ascii_code file)
                ; (setq ascii_code_prev ascii_code)
                ; (setq cnt (1- cnt))
              ; )
            ; )
          ; )      
      
          ; (write-char char3 file)
          
          ; (setq cnt (- liczba_znakow lu3))
          ; (while (/= cnt 0)      
            ; (random_number)
            ; (setq ascii_code (fix (+ (* ran 224) 32)))
            ; (if 
              ; (/= ascii_code ascii_code_prev)
              ; (progn
                ; (write-char ascii_code file)
                ; (setq ascii_code_prev ascii_code)
                ; (setq cnt (1- cnt))
              ; )
            ; )
          ; )
      
;;dodanie klucza do pliku
          ; (random_number)
          ; (setq key1 (fix (+ (* ran 224) 32)))
          ; (setq key1 (+ (* (/ key1 10) 10) lu1))         ;zapis klucza
          ; (random_number)
          ; (setq key2 (fix (+ (* ran 224) 32)))
          ; (setq key2 (+ (* (/ key2 10) 10) lu2))
          ; (random_number)
          ; (setq key3 (fix (+ (* ran 224) 32)))
          ; (setq key3 (+ (* (/ key3 10) 10) lu3))
          
          ; (write-char key1 file)
          ; (write-char key2 file)
          ; (write-char key3 file)
          
          ; (close file)
               
          ; (alert (strcat "zostalo" nn "uruchomien"))
        ; )
      ; )
    ; )
  ; )




