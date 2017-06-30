
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
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







;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
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

(defun c:generator_kodu_zadania(/ ran liczba_znakow lu1 lu2 lu3 lu4 char1 char2 char3 char4 n1 n2 n3 n4 ascii_code_prev ascii_code cnt key1 key2 key3 key4 keykz kod_zadania_ukryty demand_file file)

;liczba znakow pliku     
  (random_number)
  (setq liczba_znakow (+ (1+ (fix (* ran 10))) 50))       ;dlugosc kodu 51 do 60 znakow
  ;(setq liczba_znakow 50)
;miejsca znakow
  (random_number)
  (setq lu1 (+ 0   (1+ (fix (* ran 10)))))                  ;miejsce pierwsza cyfra liczby uruchomien
  (random_number)
  (setq lu2 (+ 10 (1+ (fix (* ran 10)))))                  ;miejsce druga cyfra liczby uruchomien
  (random_number)
  (setq lu3 (+ 20 (1+ (fix (* ran 10)))))                  ;miejsce trzecia cyfra liczby uruchomien
  (random_number)
  (setq lu4 (+ 30 (1+ (fix (* ran 10)))))                  ;miejsce trzecia cyfra liczby uruchomien
;tutaj numer usera ABCD i teraz n1=A n2=B n3=C n4=D
;wartosci znakow
  (setq n1 0)
  (setq n2 1)
  (setq n3 1)
  (setq n4 4)
;generacja zaszyforwanych liter gdzie ostatnia cyfra kodu ascii to n1, n2, n3, n4,
  (setq start_number 60)        ;od ktorego kodu ascci zaczynac 70=D + przedial 10 to bedzie 80
  (setq interval 50)            ;przedzial cyfr =10
  (random_number)
  (setq char1 (fix (+ (* ran interval) start_number)))
  ;(setq char1 (+ (* (/ char1 10) 10) n1))         ;+3 bo 300 uruchomien
  (setq char1 (+ 70 n1))         ;+3 bo 300 uruchomien
  (random_number)
  (setq char2 (fix (+ (* ran interval) start_number)))
  ;(setq char2 (+ (* (/ char2 10) 10) n2))         ;+0 bo 300 uruchomien
  (setq char2 (+ 70 n2))         ;+0 bo 300 uruchomien
  (random_number)
  (setq char3 (fix (+ (* ran interval) start_number)))
  ;(setq char3 (+ (* (/ char3 10) 10) n3))         ;+0 bo 300 uruchomien
  (setq char3 (+ 70 n3))         ;+0 bo 300 uruchomien
  (random_number)
  (setq char4 (fix (+ (* ran interval) start_number)))
  ;(setq char4 (+ (* (/ char4 10) 10) n4))         ;+0 bo 300 uruchomien
  (setq char4 (+ 70 n4))         ;+0 bo 300 uruchomien

;generacja ciagu znakow z kodem zadania czyli wypisanie losowego ciagu znakow z umieszczonymi w nim kluczowymi znakami
;wygenerowanymi powyzej
  (setq ascii_code_prev 1)
  (setq kod_zadania "")
  
  (setq cnt lu1)
  (while (/= cnt 1)      
    (random_number)
    (setq ascii_code (fix (+ (* ran interval) start_number)))
    (setq kod_zadania (strcat kod_zadania (chr ascii_code)))
    (setq cnt (1- cnt))
  )
      
  (setq kod_zadania (strcat kod_zadania (chr char1)))
  
  (setq cnt (1- lu2))
  (while (/= cnt lu1)      
    (random_number)
    (setq ascii_code (fix (+ (* ran interval) start_number)))
    (setq kod_zadania (strcat kod_zadania (chr ascii_code)))
    (setq cnt (1- cnt))
  )
  
  (setq kod_zadania (strcat kod_zadania (chr char2)))
  
  (setq cnt (1- lu3))
  (while (/= cnt lu2)      
    (random_number)
    (setq ascii_code (fix (+ (* ran interval) start_number)))
    (setq kod_zadania (strcat kod_zadania (chr ascii_code)))
    (setq cnt (1- cnt))
  )      
      
  (setq kod_zadania (strcat kod_zadania (chr char3)))
  
  (setq cnt (1- lu4))
  (while (/= cnt lu3)      
    (random_number)
    (setq ascii_code (fix (+ (* ran interval) start_number)))
    (setq kod_zadania (strcat kod_zadania (chr ascii_code)))
    (setq cnt (1- cnt))
  )      
  
  (setq kod_zadania (strcat kod_zadania (chr char4)))
  
  (setq cnt (- liczba_znakow lu4))
  (while (/= cnt 0)      
    (random_number)
    (setq ascii_code (fix (+ (* ran interval) start_number)))
    (setq kod_zadania (strcat kod_zadania (chr ascii_code)))
    (setq cnt (1- cnt))
  )

;dodanie klucza do ciagu znakow wygenrowanego wyzej
  ;(random_number)
  ;(setq key1 (fix (+ (* ran interval) start_number)))
  ;(setq key1 (+ (* (/ key1 10) 10) lu1))         ;zapis klucza
  (setq key1 (+ 70 lu1))         ;zapis klucza
  ;(random_number)
  ;(setq key2 (fix (+ (* ran interval) start_number)))
  ;(setq key2 (+ (* (/ key2 10) 10) lu2))
  (setq key2 (+ 70 lu2))
  ;(random_number)
  ;(setq key3 (fix (+ (* ran interval) start_number)))
  ;(setq key3 (+ (* (/ key3 10) 10) lu3))
  (setq key3 (+ 70 lu3))
  ;(random_number)
  ;(setq key4 (fix (+ (* ran interval) start_number)))
  ;(setq key4 (+ (* (/ key4 10) 10) lu4))
  (setq key4 (+ 70 lu4))

  (setq kod_zadania (strcat kod_zadania (chr key1)))
  
  (random_number)
  (setq ascii_code (fix (+ (* ran interval) start_number)))
  (setq kod_zadania (strcat kod_zadania (chr ascii_code)))
  (random_number)
  (setq ascii_code (fix (+ (* ran interval) start_number)))
  (setq kod_zadania (strcat kod_zadania (chr ascii_code)))
  
  (setq kod_zadania (strcat kod_zadania (chr key2)))

  (random_number)
  (setq ascii_code (fix (+ (* ran interval) start_number)))
  (setq kod_zadania (strcat kod_zadania (chr ascii_code)))
  (random_number)
  (setq ascii_code (fix (+ (* ran interval) start_number)))
  (setq kod_zadania (strcat kod_zadania (chr ascii_code)))

  (setq kod_zadania (strcat kod_zadania (chr key3)))

  (random_number)
  (setq ascii_code (fix (+ (* ran interval) start_number)))
  (setq kod_zadania (strcat kod_zadania (chr ascii_code)))
  (random_number)
  (setq ascii_code (fix (+ (* ran interval) start_number)))
  (setq kod_zadania (strcat kod_zadania (chr ascii_code)))
  (random_number)
  (setq ascii_code (fix (+ (* ran interval) start_number)))
  (setq kod_zadania (strcat kod_zadania (chr ascii_code)))

  (setq kod_zadania (strcat kod_zadania (chr key4)))

  (random_number)
  (setq ascii_code (fix (+ (* ran interval) start_number)))
  (setq kod_zadania (strcat kod_zadania (chr ascii_code)))

;szyfrowanie kodu zadania
  (random_number)
  (setq keykz (fix (1+ (* 9 ran))))
  (setq n 1)
  (setq kod_zadania_ukryty "")
  (repeat (strlen kod_zadania)
    (setq ascii_code (ascii (substr kod_zadania n 1)))
    (setq ascii_code (+ ascii_code keykz))
    (setq kod_zadania_ukryty (strcat kod_zadania_ukryty (chr ascii_code)))
    (setq n (1+ n))
  )
  (random_number)
  (setq ascii_code (fix (+ (* ran interval) start_number)))
  ;;(setq keykz (+ (* (/ key4 10) 10) keykz))
  (setq keykz (+ 70 keykz))
  (setq kod_zadania_ukryty (strcat kod_zadania_ukryty (chr keykz)))
  
;zapis zaszyfrowanego ciagu znakow do pliku  
  ;jesli plik k12f istnieje tzn ze okres tral juz raz minal
  (setq demand_file (strcat windows_root_path "\\system32\\k_12f.dll"))  ;sciezka do KZ
  (setq file (open demand_file "r"))
  (if (/= file nil)
    (progn        ;tutaj cos jest nie tak czyli k12 istnieje a license nie czyli okres trail ju zminal
      (read-line file)
      (setq line1 (read-line file))   ;druga linijka czyli liczba uruchomien w kZ
      (close file)

      (setq file (open demand_file "w")) 
      (write-line kod_zadania_ukryty file)
      (write-line line1 file)
      (close file)

      (c:odczyt_liczby_uruchomien)

      (setq demand_file (strcat path "\\license.txt"))
      (setq file (open demand_file "w"))
      (write-line (strcat "Kod ¿¹dania: " kod_zadania) file)
      (write-line (strcat "Serial Number: Wersja Trial, pozosta³o jeszcze " (itoa liczba_uruchomien) " uruchomieñ.") file)
      (close file)
      ;(princ (strcat "\n Serial Number: Wersja Trial, pozosta³o jeszcze " (itoa liczba_uruchomien) " uruchomieñ."))

      ;(startapp (strcat path "\\support\\trial_expired.exe"))
      ;teraz uruchom  programik do rejestracji i wpisani anumeru i restart madzicada
      ;(startapp (strcat path "\\support\\license_generated_info.exe"))
      ;(quit)
    )
    (progn        ;tutaj normalna prcedura jka za pierwzym uruchomieniem na nowym kompie
      (setq file (open demand_file "w")) 
      (write-line kod_zadania_ukryty file)
      (close file)
      
      (setq demand_file (strcat path "\\license.txt"))
      (setq file (open demand_file "w"))
      (write-line (strcat "Kod ¿¹dania: " kod_zadania) file)
      (write-line "Serial Number: Wersja Trial, pozosta³o jeszcze 300 uruchomieñ." file)
      (close file)

      (c:zapis_liczby_uruchomien 300)   ;tutaj pocatkowa liczba urochomien i tylko tu
      
      ;(princ "\n Serial Number: Wersja Trial, pozosta³o jeszcze 300 uruchomieñ.")
    )
  )
  (princ "\n Wygenerowano poprawnie kod ¿¹dania. ")
  (princ)        
)  

(defun c:license_test(/ license_file file kod_zadania ciag line serial_number serial_number2 serial_number3 keysn n ascii_code ciag2 ciag3 keykz)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  ;genracja pliku license txt jesli nie istnieje
  (setq file (strcat path "\\license.txt"))
  (setq file (open file "r"))
  (if (= file nil)
    (c:generator_kodu_zadania)
    (close file)
  )
  ;genracja pliku k12f jesli nie istnieje
  (setq file (strcat windows_root_path "\\system32\\k_12f.dll"))
  (setq file (open file "r"))
  (if (= file nil)
    (c:generator_kodu_zadania)
    (close file)
  )
  ;teraz porownycwanie numerow

; plik istnieje lub zostal stworzony (sprawdzone w license_generated_info)
  (setq file (open (strcat windows_root_path "\\system32\\k_12f.dll") "r"))
  ;(read-line file)
  (setq ciag (read-line file))  ;odczyt zaszyfrowanego kodu zadania z katalogu windows
  (close file)

  (setq file (open (strcat path "\\license.txt") "r")) ;odczyt numeru seryjnego
  (read-line file)
  (setq serial_number (read-line file))
  (close file)
  
  (princ "\n Sprawdzanie poprawnoœci numeru seryjnego...")
    ;dopasowywanie SN i KZ
    ;;;;;odszyfrowanie SN
  (setq serial_number (substr serial_number 16))

  ;(princ (strcat "\n" serial_number))
  
  (setq keysn (substr serial_number (strlen serial_number) 1))   ;ostatni znak SN to klucz
  (setq keysn (- (ascii keysn) (* (/ (ascii keysn) 10) 10)))    ;ostatnia cyfra kodu ascii ostatniego znaku
  (setq serial_number2 (substr serial_number 1 10))
  (setq n 1)
  (setq serial_number3 "")
  (repeat 10
    (setq ascii_code (ascii (substr serial_number2 n 1)))
    (setq ascii_code (- ascii_code keysn))
    (setq serial_number3 (strcat serial_number3 (chr ascii_code)))
    (setq n (1+ n))
  )

  ;odszyforwanie KZ
  (setq ciag2 (substr ciag 1 10))
  (setq keykz (substr ciag (strlen ciag)))
  (setq keykz (- (ascii keykz) (* (/ (ascii keykz) 10) 10)))        
  (setq n 1)
  (setq ciag3 "")
  (repeat 10
    (setq ascii_code (ascii (substr ciag2 n 1)))
    (setq ascii_code (- ascii_code keykz))
    (setq ciag3 (strcat ciag3 (chr ascii_code)))
    (setq n (1+ n))
  )
  ; ciag2= 10 pierwszych liter kodu zadania
  (if (/= serial_number3 ciag3)    ;zgadzaja sie czy nie
    (progn  
      ;teraz cala procedura wersji trial z liczeniem numeru bla bla
      (setq file (strcat windows_root_path "\\system32\\k_12f.dll"))
      (setq file (open file "r"))
      (read-line file)                              ;pierwsza linijka to KZ
      (setq liczba_uruchomien$ (read-line file))   ;druga linijka to zaszyforwana liczba uruchomien z k12
      (close file)

      (c:odczyt_liczby_uruchomien)
 
      (setq liczba_uruchomien (- liczba_uruchomien 1))
      (if (< liczba_uruchomien 1)
        (progn
          (setq file (open (strcat path "\\license.txt") "r")) ;odczyt 1 linijki
          (setq line1 (read-line file))
          (close file)
          
          (setq file (open (strcat path "\\license.txt") "w")) ;dopisanie 2 linijki
          (write-line line1 file)
          (write-line (strcat "Serial Number: Wersja Trial, pozosta³o jeszcze 0 uruchomieñ.") file)
          (close file)
          (princ (strcat "\n Wersja Trial, pozosta³o jeszcze 0 uruchomieñ."))
          
          (startapp (strcat path "\\support\\trial_expired.exe"))
          (quit)
        )
        (progn
          (c:zapis_liczby_uruchomien liczba_uruchomien)
          
          (setq file (open (strcat path "\\license.txt") "r")) ;odczyt 1 linijki
          (setq line1 (read-line file))
          (close file)
          
          (setq file (open (strcat path "\\license.txt") "w")) ;dopisanie 2 linijki
          (write-line line1 file)
          (write-line (strcat "Serial Number: Wersja Trial, pozosta³o jeszcze " (itoa liczba_uruchomien) " uruchomieñ.") file)
          (close file)
          (princ (strcat "\n Wersja Trial, pozosta³o jeszcze " (itoa liczba_uruchomien) " uruchomieñ."))
          
          (startapp (strcat path "\\support\\trial_expired.exe"))
        )
      )
    )   
        ;(startapp (strcat path "support\\check_serial_number.exe"))
    (progn
      (princ "\n Numer seryjny... OK. ")
    )
  )
  (princ)
)



(defun c:zapis_liczby_uruchomien (liczba_uruchomien_do_zapisu / ran liczba_znakow lu1 lu2 lu3 lu4 char1 char2 char3 char4 n1 n2 n3 n4 ascii_code_prev ascii_code cnt key1 key2 key3 key4 keykz kod_zadania_ukryty demand_file file)

;liczba znakow pliku     
  (random_number)
  (setq liczba_znakow (+ (1+ (fix (* ran 10))) 50))       ;dlugosc kodu 51 do 60 znakow
  ;(setq liczba_znakow 50)
;miejsca znakow
  (random_number)
  (setq lu1 (+ 0   (1+ (fix (* ran 10)))))                  ;miejsce pierwsza cyfra liczby uruchomien
  (random_number)
  (setq lu2 (+ 10 (1+ (fix (* ran 10)))))                  ;miejsce druga cyfra liczby uruchomien
  (random_number)
  (setq lu3 (+ 20 (1+ (fix (* ran 10)))))                  ;miejsce trzecia cyfra liczby uruchomien
  (random_number)
  (setq lu4 (+ 30 (1+ (fix (* ran 10)))))                  ;miejsce trzecia cyfra liczby uruchomien

;zamiana liczby uruchomien na 4 znaki
  (setq liczba_uruchomien_do_zapisu$ (strcat "0000" (itoa liczba_uruchomien_do_zapisu)))
  (setq liczba_uruchomien_do_zapisu$ (substr liczba_uruchomien_do_zapisu$ (- (strlen liczba_uruchomien_do_zapisu$) 3)))
    
;tutaj liczba pozostalych uuchomien ABCD i teraz n1=A n2=B n3=C n4=D
;wartosci znakow
  (setq n1 (atoi (substr liczba_uruchomien_do_zapisu$ 1 1)))
  (setq n2 (atoi (substr liczba_uruchomien_do_zapisu$ 2 1)))
  (setq n3 (atoi (substr liczba_uruchomien_do_zapisu$ 3 1)))
  (setq n4 (atoi (substr liczba_uruchomien_do_zapisu$ 4 1)))

;generacja zaszyforwanych liter gdzie ostatnia cyfra kodu ascii to n1, n2, n3, n4,
  (setq start_number 60)        ;od ktorego kodu ascci zaczynac 70=D + przedial 10 to bedzie 80
  (setq interval 50)            ;przedzial cyfr =10
  (random_number)
  (setq char1 (fix (+ (* ran interval) start_number)))
  ;(setq char1 (+ (* (/ char1 10) 10) n1))         ;+3 bo 300 uruchomien
  (setq char1 (+ 70 n1))         ;+3 bo 300 uruchomien
  (random_number)
  (setq char2 (fix (+ (* ran interval) start_number)))
  ;(setq char2 (+ (* (/ char2 10) 10) n2))         ;+0 bo 300 uruchomien
  (setq char2 (+ 70 n2))         ;+0 bo 300 uruchomien
  (random_number)
  (setq char3 (fix (+ (* ran interval) start_number)))
  ;(setq char3 (+ (* (/ char3 10) 10) n3))         ;+0 bo 300 uruchomien
  (setq char3 (+ 70 n3))         ;+0 bo 300 uruchomien
  (random_number)
  (setq char4 (fix (+ (* ran interval) start_number)))
  ;(setq char4 (+ (* (/ char4 10) 10) n4))         ;+0 bo 300 uruchomien
  (setq char4 (+ 70 n4))         ;+0 bo 300 uruchomien

;generacja ciagu znakow z kodem zadania czyli wypisanie losowego ciagu znakow z umieszczonymi w nim kluczowymi znakami
;wygenerowanymi powyzej
  (setq ascii_code_prev 1)
  (setq kod_zadania "")
  
  (setq cnt lu1)
  (while (/= cnt 1)      
    (random_number)
    (setq ascii_code (fix (+ (* ran interval) start_number)))
    (setq kod_zadania (strcat kod_zadania (chr ascii_code)))
    (setq cnt (1- cnt))
  )
      
  (setq kod_zadania (strcat kod_zadania (chr char1)))
  
  (setq cnt (1- lu2))
  (while (/= cnt lu1)      
    (random_number)
    (setq ascii_code (fix (+ (* ran interval) start_number)))
    (setq kod_zadania (strcat kod_zadania (chr ascii_code)))
    (setq cnt (1- cnt))
  )
  
  (setq kod_zadania (strcat kod_zadania (chr char2)))
  
  (setq cnt (1- lu3))
  (while (/= cnt lu2)      
    (random_number)
    (setq ascii_code (fix (+ (* ran interval) start_number)))
    (setq kod_zadania (strcat kod_zadania (chr ascii_code)))
    (setq cnt (1- cnt))
  )      
      
  (setq kod_zadania (strcat kod_zadania (chr char3)))
  
  (setq cnt (1- lu4))
  (while (/= cnt lu3)      
    (random_number)
    (setq ascii_code (fix (+ (* ran interval) start_number)))
    (setq kod_zadania (strcat kod_zadania (chr ascii_code)))
    (setq cnt (1- cnt))
  )      
  
  (setq kod_zadania (strcat kod_zadania (chr char4)))
  
  (setq cnt (- liczba_znakow lu4))
  (while (/= cnt 0)      
    (random_number)
    (setq ascii_code (fix (+ (* ran interval) start_number)))
    (setq kod_zadania (strcat kod_zadania (chr ascii_code)))
    (setq cnt (1- cnt))
  )

;dodanie klucza do ciagu znakow wygenrowanego wyzej
  ;(random_number)
  ;(setq key1 (fix (+ (* ran interval) start_number)))
  ;(setq key1 (+ (* (/ key1 10) 10) lu1))         ;zapis klucza
  (setq key1 (+ 70 lu1))         ;zapis klucza
  ;(random_number)
  ;(setq key2 (fix (+ (* ran interval) start_number)))
  ;(setq key2 (+ (* (/ key2 10) 10) lu2))
  (setq key2 (+ 70 lu2))
  ;(random_number)
  ;(setq key3 (fix (+ (* ran interval) start_number)))
  ;(setq key3 (+ (* (/ key3 10) 10) lu3))
  (setq key3 (+ 70 lu3))
  ;(random_number)
  ;(setq key4 (fix (+ (* ran interval) start_number)))
  ;(setq key4 (+ (* (/ key4 10) 10) lu4))
  (setq key4 (+ 70 lu4))

  (setq kod_zadania (strcat kod_zadania (chr key1)))
  
  (random_number)
  (setq ascii_code (fix (+ (* ran interval) start_number)))
  (setq kod_zadania (strcat kod_zadania (chr ascii_code)))
  (random_number)
  (setq ascii_code (fix (+ (* ran interval) start_number)))
  (setq kod_zadania (strcat kod_zadania (chr ascii_code)))
  
  (setq kod_zadania (strcat kod_zadania (chr key2)))

  (random_number)
  (setq ascii_code (fix (+ (* ran interval) start_number)))
  (setq kod_zadania (strcat kod_zadania (chr ascii_code)))
  (random_number)
  (setq ascii_code (fix (+ (* ran interval) start_number)))
  (setq kod_zadania (strcat kod_zadania (chr ascii_code)))

  (setq kod_zadania (strcat kod_zadania (chr key3)))

  (random_number)
  (setq ascii_code (fix (+ (* ran interval) start_number)))
  (setq kod_zadania (strcat kod_zadania (chr ascii_code)))
  (random_number)
  (setq ascii_code (fix (+ (* ran interval) start_number)))
  (setq kod_zadania (strcat kod_zadania (chr ascii_code)))
  (random_number)
  (setq ascii_code (fix (+ (* ran interval) start_number)))
  (setq kod_zadania (strcat kod_zadania (chr ascii_code)))

  (setq kod_zadania (strcat kod_zadania (chr key4)))

  (random_number)
  (setq ascii_code (fix (+ (* ran interval) start_number)))
  (setq kod_zadania (strcat kod_zadania (chr ascii_code)))

;szyfrowanie kodu zadania
  (random_number)
  (setq keykz (fix (1+ (* 9 ran))))
  (setq n 1)
  (setq kod_zadania_ukryty "")
  (repeat (strlen kod_zadania)
    (setq ascii_code (ascii (substr kod_zadania n 1)))
    (setq ascii_code (+ ascii_code keykz))
    (setq kod_zadania_ukryty (strcat kod_zadania_ukryty (chr ascii_code)))
    (setq n (1+ n))
  )
  (random_number)
  (setq ascii_code (fix (+ (* ran interval) start_number)))
  ;;(setq keykz (+ (* (/ key4 10) 10) keykz))
  (setq keykz (+ 70 keykz))
  (setq kod_zadania_ukryty (strcat kod_zadania_ukryty (chr keykz)))

;zapis zaszyfrowanego ciagu znakow do pliku  
  ;dopisanie liczby uruchomien w postaci kodu zadania niezaszyforwanego do odczytnia gensn
  (setq demand_file (strcat windows_root_path "\\system32\\k_12f.dll"))  ;sciezka do KZ
  (setq file (open demand_file "r"))
  (setq line1 (read-line file))
  (close file)

  (setq file (open demand_file "w")) ;dopisanie 2 linijki
  (write-line line1 file)
  (write-line kod_zadania file)
  (close file)
  
  (setq liczba_uruchomien liczba_uruchomien_do_zapisu)
  (princ)        
)  


(defun c:odczyt_liczby_uruchomien(/ ciag dlugosc_ciagu key1 key2 key3 key4 char1 char2 char3 char4 n1 n2 n3 n4 numer_usera serial_number serial_number2 ascii_code keysn )
  (setq demand_file (strcat windows_root_path "\\system32\\k_12f.dll"))
  (setq file (open demand_file "r"))
  (read-line file)  
  (setq ciag (read-line file))
  (close file)
  
  ;;odszyforwanie liczby uruchomien:
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
  
  (setq liczba_uruchomien (+ (* 1000 n1) (* 100 n2)(* 10 n3) (* 1 n4)))
  (princ)
)

;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV

;;PROGRAM=======   
(graphscr)
(setvar "cmdecho" 0)                     ;nie wyswietla komunikatow lispa w linii polecen

(defun message_text (message_text mode / )
  (setq message_text_file (open (strcat path "\\support\\message.dat") mode))
  (write-line message_text message_text_file)
  (close message_text_file)
  (princ)
)


;ustalanie sciezki do autocada
(if (= (vl-registry-read "HKEY_local_machine\\software\\madzicad\\" "path") nil)
  (progn
    (alert "ERROR!\n\n  Uruchom plik \\MadziCAD\\support\\MadziCAD_ustawienia.exe aby wskazaæ œcie¿kê do MadziCADa. ")
    (quit)
  )
  (setq path (vl-registry-read "HKEY_local_machine\\software\\madzicad\\" "path"))
)

(setq file (open (strcat path "\\support\\settings.dat") "r"))
(repeat 128
  (read-line file)
)
(setq windows_root_path (read-line file))    ;u m nie c:\windows
(close file)

;(setenv "ACAD" (strcat (getenv "ACAD") drive "\\Program Files\\Madzicad\\;"))
(c:license_test)

;;***************************************************
;;                    FUNKCJE                       *
;;***************************************************
;;                                                  *
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;*************************************************
;;            LADOWANIE USTAWIEN                  *
;;*************************************************
;;                                                *
;;autostart rozne zmienne srodowiskowe=================================================== 
(setvar "cmdecho" 0)                     ;nie wyswietla komunikatow lispa w linii polecen
(setvar "pickfirst" 1)                   ;to jest dobre
(setvar "filletrad" 0)                   ;promien fazy = 0
(setvar "lunits" 2)                      ;jednostki -> dziesietne(rodzaj a nie ilosc cyfr po precinku
(setvar "fielddisplay" 0)                 ;pola w maskach

(setq file (open (strcat path "\\support\\settings.dat") "r"))
(repeat 65 (read-line file))

;;warstwa z wymiarami (potrzebna w poleceniach do wymiarow
(setq warwym (read-line file))
(setq warkresk (read-line file))

;;wysokosci tekstu w mm obszarze papieru
(repeat 2 (read-line file))
(setq txta (atof(read-line file)))
(setq txt2a (atof(read-line file)))
(setq txt4a (atof(read-line file)))

;;skala linii w obszarze papieru
(repeat 2 (read-line file))
(setq skalalinii (atof (read-line file)))

;;wysokosc w metrach ponad LUW powyzej ktorej wspolrzedne traktowane sa jako bezwzgledne
(repeat 2 (read-line file))
(setq HH (atoi (read-line file)))

;ilosc miejsc po przecinku przy obliczaniu spadku i nachylenia:
(repeat 2 (read-line file))
(setq dokl_spadku (atoi (read-line file)))
(setq dokl_nachylenia (atoi (read-line file)))

;kolor tekstu w linii odniesienia
(repeat 2 (read-line file))
(setq kolor_tekstu_linii_odniesienia (atoi (read-line file)))

;ustawienie zmiennej do duzych liter
(repeat 2 (read-line file))
(setq all_uppercase (atoi(read-line file)))

;ustawienie zmiennej do stalych trybow lokalizacji
(repeat 2 (read-line file))
(setq user_osmode (atoi (read-line file)))

;szacher macher ze skalami linii w papierze
(repeat 2 (read-line file))
(setq szacher_macher (atoi(read-line file)))

;autostart rozne zmienne srodowiskowe zmienaie w ustwaieniach madzicada
(repeat 2 (read-line file))
(setvar "luprec" (atoi(read-line file)))                     ;dokladnosc jednostek - ilosc miejsc po przecinku
(repeat 1 (read-line file))
(setvar "gripblock" (atoi (read-line file)))                   ;pokazuj wszystkie uchwyty w blokach
(repeat 1 (read-line file))
(setvar "edgemode"  (atoi(read-line file)))                    ;przy utnij/wydluz bierze tez przedluzenia krawedzi tnacych
(repeat 1 (read-line file))
(setvar "mirrtext"  (atoi(read-line file)))                    ;nie odbija tekstu przy lustrze

(repeat 2 (read-line file))
(setq automatyczne_dodawanie_maski_tla_do_tekstow (atoi(read-line file)))
(repeat 1 (read-line file))
(setq rozmiar_maski_w_tekstach (atof(read-line file)))

(repeat 1 (read-line file))
(setvar "psltscale" (atoi(read-line file)))             ;skaluj w jednostkach obszaru papieru

(repeat 2 (read-line file))
(setq wszystkie_obiekty_jak_warstwa (atoi(read-line file)))
(repeat 1 (read-line file))
(setq stworz_lub_popraw_brakujace_warstwy (atoi(read-line file)))
(repeat 1 (read-line file))
(setq stworz_brakujace_bloki (atoi(read-line file)))
(repeat 1 (read-line file))
(setq dodaj_brakujace_style_wymiarowania (atoi(read-line file)))
(repeat 1 (read-line file))
(setq maski_tla_w_stylach_wymiarowania (atoi(read-line file)))
(repeat 1 (read-line file))
(setq maski_tla_w_tekstach (atoi(read-line file)))
(repeat 1 (read-line file))
(setq przenoszenie_blokow_z_defpoints (atoi(read-line file)))

(repeat 25 (read-line file))
(setq blok_spadek_w_lewo (read-line file))
(repeat 1 (read-line file))
(setq blok_spadek_w_prawo (read-line file))
(repeat 1 (read-line file))
(setq blok_kota (read-line file))
;==================================
(repeat 1 (read-line file))
(setq autostart_wszystkie_obiekty_jak_warstwa (atoi(read-line file)))
(repeat 1 (read-line file))
(setq autostart_stworz_lub_popraw_brakujace_warstwy (atoi(read-line file)))
(repeat 1 (read-line file))
(setq autostart_stworz_brakujace_bloki (atoi(read-line file)))
(repeat 1 (read-line file))
(setq autostart_dodaj_brakujace_style_wymiarowania (atoi(read-line file)))
(repeat 1 (read-line file))
(setq autostart_maski_tla_w_stylach_wymiarowania (atoi(read-line file)))
(repeat 1 (read-line file))
(setq autostart_maski_tla_w_tekstach (atoi(read-line file)))
(repeat 1 (read-line file))
(setq autostart_przenoszenie_blokow_z_defpoints (atoi(read-line file)))
(repeat 1 (read-line file))
(setq madzicad_text_style (read-line file))

(close file)


  ;wszystkie obekty jak wartswa
  (if (= autostart_wszystkie_obiekty_jak_warstwa 1)
    (progn
      (setq temp_selection (ssget "_X"))
      (if (/= temp_selection nil)
        (progn
          (command "_chprop" temp_selection "" "_color" "bylayer" "_ltype" "bylayer" "_lweight" "bylayer" "")
          ;(message_text "  Zmieniono w³aœciwoœci wszystkich obiektów na => JakWarstwa      " "a")
          ;(setq message (strcat message "\n Zmieniono w³aœciwoœci wszystkich obiektów na => JakWarstwa"))
        )
      )
    )
  )


    ;naprawianie warstw
  (if (= autostart_stworz_lub_popraw_brakujace_warstwy 1)
    (progn
      (setq layer_prev (getvar "clayer"))
      
      (setq file (open (strcat path "\\support\\settings.dat") "r"))
      (repeat 14 (read-line file))  
      (setq n 0)
      (repeat 10
        (setq layername (read-line file))
        (setq layercolor (read-line file))
        (if (> (strlen layercolor) 3)
          (setq layercolor (atoi(substr layercolor 1 1)))
          (setq layercolor (atoi layercolor))
        )    
        (setq layertype (read-line file))
        (setq layerthickness (read-line file))   
        (read-line file)
        (if (tblsearch "layer" layername)
          (progn
            (command "_layer" "_set" layername "_color" layercolor "" "_ltype" layertype "" "_lweight" layerthickness "" "")
          )
          (progn
            (command "_layer" "_make" layername "_color" layercolor "" "_ltype" layertype "" "_lweight" layerthickness "" "")
          )
        )
        (setq warstwanr_x (strcat "warstwanr" (itoa n)))
        (set (read warstwanr_x) layername)
        (setq n (+ n 1))
      )
      (setvar "clayer" layer_prev)
      ;(setq message (strcat message "\n Warstwy: kolory, rodzaje i szerokoœci linii ustawione lub poprawione"))  
      ;(message_text "  Warstwy: kolory, rodzaje i szerokoœci linii ustawione lub poprawione      " "a")  
    )
  )
  
  ;tworzenie brakujacych blokow
;(command "_ucs" "_world")
  (if (= autostart_stworz_brakujace_bloki 1)
    (progn
      (setq internal_blocks_list
        (list 
          (list "MadziCAD_kota" (list '(0 . "LWPOLYLINE") '(5 . "1528") '(100 . "AcDbEntity") '(67 . 0) '(410 . "Model") '(8 . "0") '(100 . "AcDbPolyline") '(90 . 4) '(70 . 0) '(43 . 0.0) '(38 . 0.0) '(39 . 0.0) '(10 0.0 0.0) '(40 . 0.0) '(41 . 0.0) '(42 . 0.0) '(10 100.0 173.0) '(40 . 0.0) '(41 . 0.0) '(42 . 0.0) '(10 -100.0 173.0) '(40 . 0.0) '(41 . 0.0) '(42 . 0.0) '(10 0.0 0.0) '(40 . 0.0) '(41 . 0.0) '(42 . 0.0) '(210 0.0 0.0 1.0)))
          (list "MadziCAD_spadek_w_prawo" (list '(0 . "LWPOLYLINE") '(5 . "153E") '(100 . "AcDbEntity") '(67 . 0) '(410 . "Model") '(8 . "0") '(100 . "AcDbPolyline") '(90 . 4) '(70 . 0) '(43 . 0.0) '(38 . 0.0) '(39 . 0.0) '(10 -400.0 -140.0) '(40 . 0.0) '(41 . 0.0) '(42 . 0.0) '(10 900.0 -140.0) '(40 . 0.0) '(41 . 0.0) '(42 . 0.0) '(10 400.0 0.0) '(40 . 0.0) '(41 . 0.0) '(42 . 0.0) '(10 400.0 -140.0) '(40 . 0.0) '(41 . 0.0) '(42 . 0.0) '(210 0.0 0.0 1.0)))
          (list "MadziCAD_spadek_w_lewo" (list '(0 . "LWPOLYLINE") '(5 . "1541") '(100 . "AcDbEntity") '(67 . 0) '(410 . "Model") '(8 . "0") '(100 . "AcDbPolyline") '(90 . 4) '(70 . 0) '(43 . 0.0) '(38 . 0.0) '(39 . 0.0) '(10 400.0 -140.0) '(40 . 0.0) '(41 . 0.0) '(42 . 0.0) '(10 -900.0 -140.0) '(40 . 0.0) '(41 . 0.0) '(42 . 0.0) '(10 -400.0 0.0) '(40 . 0.0) '(41 . 0.0) '(42 . 0.0) '(10 -400.0 -140.0) '(40 . 0.0) '(41 . 0.0) '(42 . 0.0) '(210 0.0 0.0 1.0)))
        )
      )

      (foreach item internal_blocks_list 
        (progn
          (if 
            (= (tblsearch "block" (car item)) nil)
            (progn
              (setq n (1- (length item)))
              (setq temp_selection (ssadd)) 
              (repeat n
                (entmake (nth n item))
                (ssadd (entlast) temp_selection)
                (setq n (1- n))
              )
              (command "_block" (car item) '(0 0) temp_selection "")
              ;(setq message nil) 
              ;(setq message (strcat "  Dodano brakuj¹cy blok: \"" (car item) "\". "))
              ;(message_text message "a")
            )
          )
        )
      )
    )
  )

;style wymairowania madicada
  (if (= autostart_dodaj_brakujace_style_wymiarowania 1)
    (progn
      ;styl tekstu do wymairow 
      (if (= (tblsearch "style" "0.7") nil)
        (progn
          (command "_style" "0.7" "simplex.shx" 0.00 0.7 0 "_no" "_no" "_no")
          ;(setq message nil) 
          ;(setq message (strcat message "\n Styl tekstu \"0.7\" ustawiono. "))
          ;(message_text message "a")
        )
      )
      
    
      ;bloki do wymiarowania
      (setq internal_blocks_list
        (list 
          (list "MadziCAD_strzalka_linii_odniesienia" (list '(0 . "SOLID") '(5 . "C28D") '(100 . "AcDbEntity") '(67 . 0) '(410 . "Model") '(8 . "0") '(100 . "AcDbTrace") '(10 -2.0 0.333333 0.0) '(11 0.0 0.0 0.0) '(12 -2.0 -0.333333 0.0) '(13 -2.0 -0.333333 0.0) '(39 . 0.0) '(210 0.0 0.0 1.0)))
          (list "MadziCAD_znacznik" (list '(0 . "LINE") '(5 . "1520") '(100 . "AcDbEntity") '(67 . 0) '(410 . "Model") '(8 . "0") '(100 . "AcDbLine") '(10 -1.0 0.0 0.0) '(11 1.0 0.0 0.0) '(210 0.0 0.0 1.0))
                           (list '(0 . "LINE") '(5 . "151E") '(100 . "AcDbEntity") '(67 . 0) '(410 . "Model") '(8 . "0") '(100 . "AcDbLine") '(10 0.0 1.0 0.0) '(11 0.0 -1.0 0.0) '(210 0.0 0.0 1.0))
                           (list '(0 . "LWPOLYLINE") '(5 . "151F") '(100 . "AcDbEntity") '(67 . 0) '(410 . "Model") '(8 . "0") '(100 . "AcDbPolyline") '(90 . 2) '(70 . 0) '(43 . 0.1) '(38 . 0.0) '(39 . 0.0) '(10 0.5 0.5) '(40 . 0.1) '(41 . 0.1) '(42 . 0.0) '(10 -0.5 -0.5) '(40 . 0.1) '(41 . 0.1) '(42 . 0.0) '(210 0.0 0.0 1.0))
          )
        )
      )

      (foreach item internal_blocks_list 
        (progn
          (if 
            (= (tblsearch "block" (car item)) nil)
            (progn
              (setq n (1- (length item)))
              (setq temp_selection (ssadd)) 
              (repeat n
                (entmake (nth n item))
                (ssadd (entlast) temp_selection)
                (setq n (1- n))
              )
              (command "_block" (car item) '(0 0) temp_selection "")
              ; (setq message nil) 
              ; (setq message (strcat "  Dodano brakuj¹cy blok: \"" (car item) "\". "))
              ; (message_text message "a")
            )
          )
        )
      )

      (setq dimstyle_prev (getvar "dimstyle"))
      (if (tblsearch "dimstyle" "1do10_MadziCAD")
        (command "_dimstyle" "_save" "1do10_MadziCAD" "_yes")
        (command "_dimstyle" "_save" "1do10_MadziCAD")
      )

      (setvar "DIMADEC"     1)         ;Angular decimal places
      (setvar "DIMALT"      0)                  ;Alternate units selected
      (setvar "DIMALTD"     2     )               ;Alternate unit decimal places
      (setvar "DIMALTF"     0.04  )               ;Alternate unit scale factor
      (setvar "DIMALTRND"   0.00  )               ;Alternate units rounding value
      (setvar "DIMALTTD"    2     )               ;Alternate tolerance decimal places
      (setvar "DIMALTTZ"    0     )               ;Alternate tolerance zero suppression
      (setvar "DIMALTU"     2     )               ;Alternate units
      (setvar "DIMALTZ"     0     )               ;Alternate unit zero suppression
      (setvar "DIMAPOST"    "."      )               ;Prefix and suffix for alternate text
      (setvar "DIMASSOC"    2     )
      (setvar "DIMASZ"      1.50  )               ;Arrow size
      (setvar "DIMATFIT"    3     )               ;Arrow and text fit
      (setvar "DIMAUNIT"    0     )               ;Angular unit format
      (setvar "DIMAZIN"     2     )               ;Angular zero supression
      (setvar "DIMBLK"      "MadziCAD_znacznik")  ;Arrow block name
      (setvar "DIMBLK1"     ".")      ;First arrow block name
      (setvar "DIMBLK2"     ".")      ;Second arrow block name
      (setvar "DIMCEN"      2.00  )               ;Center mark size
      (setvar "DIMCLRD"     256   )           ;Dimension line and leader color
      (setvar "DIMCLRE"     256   )               ;Extension line color
      (setvar "DIMCLRT"     2     )               ;Dimension text color
      (setvar "DIMDEC"      1     )               ;Decimal places
      (setvar "DIMDLE"      1.50  )               ;Dimension line extension
      (setvar "DIMDLI"      0.00  )               ;Dimension line spacing
      (setvar "DIMDSEP"     ","   )               ;Decimal separator
      (setvar "DIMEXE"      1.50  )               ;Extension above dimension line
      (setvar "DIMEXO"      1.00  )               ;Extension line origin offset
      (setvar "DIMFRAC"     0     )               ;Fraction format
      (setvar "DIMGAP"      0.50  )               ;Gap from dimension line to text
      (setvar "DIMJUST"     0     )               ;Justification of text on dimension line
      (setvar "DIMLDRBLK"   "MadziCAD_strzalka_linii_odniesienia") ;Leader block name
      (setvar "DIMLFAC"     0.10  )               ;Linear unit scale factor
      (setvar "DIMLIM"      0)               ;Generate dimension limits
      (setvar "DIMLUNIT"    2     )               ;Linear unit format
      (setvar "DIMLWD"      -1    )               ;Dimension line and leader lineweight
      (setvar "DIMLWE"      25    )               ;Extension line lineweight
      (setvar "DIMPOST"     "."    )               ;Prefix and suffix for dimension text
      (setvar "DIMRND"      0.50  )               ;Rounding value
      (setvar "DIMSAH"      0)               ;Separate arrow blocks
      (setvar "DIMSCALE"    10.00 )              ;Overall scale factor
      (setvar "DIMSD1"      0)               ;Suppress the first dimension line
      (setvar "DIMSD2"      0)               ;Suppress the second dimension line
      (setvar "DIMSE1"      1 )               ;Suppress the first extension line
      (setvar "DIMSE2"      1 )               ;Suppress the second extension line
      (setvar "DIMSOXD"     0)               ;Suppress outside dimension lines
      (setvar "DIMTAD"      1     )               ;Place text above the dimension line
      (setvar "DIMTDEC"     1     )               ;Tolerance decimal places
      (setvar "DIMTFAC"     1.00  )               ;Tolerance text height scaling factor
      (setvar "DIMTIH"      0)                  ;Text inside extensions is horizontal
      (setvar "DIMTIX"      1 )                  ;Place text inside extensions
      (setvar "DIMTM"       0.00  )               ;Minus tolerance
      (setvar "DIMTMOVE"    2     )               ;Text movement
      (setvar "DIMTOFL"     1 )                 ;Force line inside extension lines
      (setvar "DIMTOH"      0)                  ;Text outside horizontal
      (setvar "DIMTOL"      0)                  ;Tolerance dimensioning
      (setvar "DIMTOLJ"     1     )               ;Tolerance vertical justification
      (setvar "DIMTP"       0.00  )               ;Plus tolerance
      (setvar "DIMTSZ"      0.00  )               ;Tick size
      (setvar "DIMTVP"      1.00  )               ;Text vertical position
      (setvar "DIMTXSTY"    "0.7"   )               ;Text style
      (setvar "DIMTXT"      2.00  )               ;Text height
      (setvar "DIMTZIN"     0     )               ;Tolerance zero suppression
      (setvar "DIMUPT"      0     )                  ;User positioned text
      (setvar "DIMZIN"      9     )               ;Zero suppression
      (command "_dimstyle" "_save" "1do10_MadziCAD" "_yes")
     
      (setvar "DIMSCALE"    20.00 )              ;Overall scale factor  
      (if (tblsearch "dimstyle" "1do20_MadziCAD")
        (command "_dimstyle" "_save" "1do20_MadziCAD" "_yes")
        (command "_dimstyle" "_save" "1do20_MadziCAD")
      )

      
      (setvar "DIMSCALE"    25.00 )              ;Overall scale factor  
      (if (tblsearch "dimstyle" "1do25_MadziCAD")
        (command "_dimstyle" "_save" "1do25_MadziCAD" "_yes")
        (command "_dimstyle" "_save" "1do25_MadziCAD")
      )

      
      (setvar "DIMSCALE"    50.00 )              ;Overall scale factor  
      (if (tblsearch "dimstyle" "1do50_MadziCAD")
        (command "_dimstyle" "_save" "1do50_MadziCAD" "_yes")
        (command "_dimstyle" "_save" "1do50_MadziCAD")
      )

      
;1do100 na koncu zeby sie domyslnie usatwial na aktualny jesli zadnego wczesniej nie bylo  
      
      (setvar "DIMSCALE"    200.00 )              ;Overall scale factor  
      (if (tblsearch "dimstyle" "1do200_MadziCAD")
        (command "_dimstyle" "_save" "1do200_MadziCAD" "_yes")
        (command "_dimstyle" "_save" "1do200_MadziCAD")
      )

      
      (setvar "DIMSCALE"    500.00 )              ;Overall scale factor  
      (if (tblsearch "dimstyle" "1do500_MadziCAD")
        (command "_dimstyle" "_save" "1do500_MadziCAD" "_yes")
        (command "_dimstyle" "_save" "1do500_MadziCAD")
      )

      
      (setvar "DIMSCALE"    100.00 )              ;Overall scale factor  
      (if (tblsearch "dimstyle" "1do100_MadziCAD")
        (command "_dimstyle" "_save" "1do100_MadziCAD" "_yes")
        (command "_dimstyle" "_save" "1do100_MadziCAD")
      )

      
;poprawki do stylow wymairowania wspolrzednych
      (command "_dimstyle" "_restore" "1do10_MadziCAD")  
      (setvar "DIMLFAC"     0.001 )               ;Linear unit scale factor
      (setvar "DIMDEC"      2     )               ;Decimal places
      (setvar "DIMRND"      0.00  )               ;Rounding value
      (setvar "DIMGAP"      2.00  )               ;Gap from dimension line to text
      (setvar "DIMTDEC"     2     )               ;Tolerance decimal places
      (setvar "DIMZIN"      1     )               ;Zero suppression
      (if (tblsearch "dimstyle" "1do10_MadziCAD$6")
        (command "_dimstyle" "_save" "1do10_MadziCAD$6" "_yes")
        (command "_dimstyle" "_save" "1do10_MadziCAD$6")
      )

      (command "_dimstyle" "_restore" "1do20_MadziCAD")  
      (setvar "DIMLFAC"     0.001 )               ;Linear unit scale factor
      (setvar "DIMDEC"      2     )               ;Decimal places
      (setvar "DIMRND"      0.00  )               ;Rounding value
      (setvar "DIMGAP"      2.00  )               ;Gap from dimension line to text
      (setvar "DIMTDEC"     2     )               ;Tolerance decimal places
      (setvar "DIMZIN"      1     )               ;Zero suppression
      (if (tblsearch "dimstyle" "1do20_MadziCAD$6")
        (command "_dimstyle" "_save" "1do20_MadziCAD$6" "_yes")
        (command "_dimstyle" "_save" "1do20_MadziCAD$6")
      )

      (command "_dimstyle" "_restore" "1do25_MadziCAD")  
      (setvar "DIMLFAC"     0.001 )               ;Linear unit scale factor
      (setvar "DIMDEC"      2     )               ;Decimal places
      (setvar "DIMRND"      0.00  )               ;Rounding value
      (setvar "DIMGAP"      2.00  )               ;Gap from dimension line to text
      (setvar "DIMTDEC"     2     )               ;Tolerance decimal places
      (setvar "DIMZIN"      1     )               ;Zero suppression
      (if (tblsearch "dimstyle" "1do25_MadziCAD$6")
        (command "_dimstyle" "_save" "1do25_MadziCAD$6" "_yes")
        (command "_dimstyle" "_save" "1do25_MadziCAD$6")
      )

      (command "_dimstyle" "_restore" "1do50_MadziCAD")  
      (setvar "DIMLFAC"     0.001 )               ;Linear unit scale factor
      (setvar "DIMDEC"      2     )               ;Decimal places
      (setvar "DIMRND"      0.00  )               ;Rounding value
      (setvar "DIMGAP"      2.00  )               ;Gap from dimension line to text
      (setvar "DIMTDEC"     2     )               ;Tolerance decimal places
      (setvar "DIMZIN"      1     )               ;Zero suppression
      (if (tblsearch "dimstyle" "1do50_MadziCAD$6")
        (command "_dimstyle" "_save" "1do50_MadziCAD$6" "_yes")
        (command "_dimstyle" "_save" "1do50_MadziCAD$6")
      )

      (command "_dimstyle" "_restore" "1do100_MadziCAD")  
      (setvar "DIMLFAC"     0.001 )               ;Linear unit scale factor
      (setvar "DIMDEC"      2     )               ;Decimal places
      (setvar "DIMRND"      0.00  )               ;Rounding value
      (setvar "DIMGAP"      2.00  )               ;Gap from dimension line to text
      (setvar "DIMTDEC"     2     )               ;Tolerance decimal places
      (setvar "DIMZIN"      1     )               ;Zero suppression
      (if (tblsearch "dimstyle" "1do100_MadziCAD$6")
        (command "_dimstyle" "_save" "1do100_MadziCAD$6" "_yes")
        (command "_dimstyle" "_save" "1do100_MadziCAD$6")
      )

      (command "_dimstyle" "_restore" "1do200_MadziCAD")  
      (setvar "DIMLFAC"     0.001 )               ;Linear unit scale factor
      (setvar "DIMDEC"      2     )               ;Decimal places
      (setvar "DIMRND"      0.00  )               ;Rounding value
      (setvar "DIMGAP"      2.00  )               ;Gap from dimension line to text
      (setvar "DIMTDEC"     2     )               ;Tolerance decimal places
      (setvar "DIMZIN"      1     )               ;Zero suppression
      (if (tblsearch "dimstyle" "1do200_MadziCAD$6")
        (command "_dimstyle" "_save" "1do200_MadziCAD$6" "_yes")
        (command "_dimstyle" "_save" "1do200_MadziCAD$6")
      )

      (command "_dimstyle" "_restore" "1do500_MadziCAD")  
      (setvar "DIMLFAC"     0.001 )               ;Linear unit scale factor
      (setvar "DIMDEC"      2     )               ;Decimal places
      (setvar "DIMRND"      0.00  )               ;Rounding value
      (setvar "DIMGAP"      2.00  )               ;Gap from dimension line to text
      (setvar "DIMTDEC"     2     )               ;Tolerance decimal places
      (setvar "DIMZIN"      1     )               ;Zero suppression
      (if (tblsearch "dimstyle" "1do500_MadziCAD$6")
        (command "_dimstyle" "_save" "1do500_MadziCAD$6" "_yes")
        (command "_dimstyle" "_save" "1do500_MadziCAD$6")
      )
      (command "_dimstyle" "_restore" dimstyle_prev) 
      ;(message_text "  Style wymiarowania MadziCADa dodane lub uaktualnione. " "a")
    )
  )

  ;WLACZANIE masek w stylach wymiarowania znalezc zmienna w ACAD2005
  ;(if (= maski_tla_w_stylach_wymiarowania 1)
  ; (setq dim_last (getvar "dimstyle"))
  ; (setq dim_style_name (cdr (assoc 2 (tblnext "dimstyle" t))))
  ; (setq n2 1)
  ; (while (/= dim_style_name nil)
    ; (command "_dimstyle" "_restore" dim_style_name)
    ; (setvar "dimtfill" 1)
    ; (princ (strcat "\n Ustawiono maske w stylu wymiarowania: " dim_style_name))
    ; (command "_dimstyle" "_save" dim_style_name "_yes")
    ; (setq dim_style_name (cdr (assoc 2 (tblnext "dimstyle"))))
    ; (setq n2 (1+ n2))
  ; )
    ; (setq temp_selection (ssget "_X" '((0 . "dimension"))))
  ; (if (/= temp_selection nil)
    ; (command "_draworder" temp_selection "" "_front")
  ; )
  ;   (princ "\n Maski w stylach wymiarowania ustawione. ")
  ; (command "_dimstyle" "_restore" dim_last)
  ;)
  

  
  
  
    ;;;;WLACZANIE masek w tekstach
  (if (= autostart_maski_tla_w_tekstach 1)
    (progn
      (setq temp_selection (ssget "_X" '((0 . "MTEXT"))))
      (if (/= temp_selection nil)
        (progn
          (selection_to_list temp_selection)
          (foreach item sslist 
            (progn 
              (setq entlist (entget item))
              (setq entlist
                 (append
                   entlist
                   (list (cons 90 3))       ;dodanie maski 
                   (list (cons 63 256))     ;ustawienie maski jak tlo rysuku
                   (list (cons 45 rozmiar_maski_w_tekstach))     ;ustawienie rozmiaru maski 1.1        
                 )
              )
              (entmod entlist)
              (command "_draworder" item "" "_front")
            )
          )
          ;teksty i wymiary na wierzch
          ;(setq temp_selection (ssget "_X" '((0 . "mtext"))))
          ;(if (/= temp_selection nil)
          ;  (command "_draworder" temp_selection "" "_front")
          ;)
          ;(message_text "  Maski t³a w tekstach ustawione. " "a")
          
        )
      )
    )
  )
  
  ;przenoszenie_blokow_z_defpoints
  (if (= autostart_przenoszenie_blokow_z_defpoints 1)
    (progn
      (setq temp_selection (ssget "_X" '((0 . "INSERT") (8 . "Defpoints"))))
      (if (/= temp_selection nil)
        (progn
          (command "_chprop" temp_selection "" "_layer" "0" "")
          (message_text "  Przeniesiono wszystkie bloki z warstwy 'defpoints' na warstwê '0'. " "a")
        )
      )
    )
  )
  
(setq file (open (strcat path "\\support\\settings.dat") "r"))
(repeat 14 (read-line file))
;;ustawienia nazw warstw do polecenia 1, 11
(setq n 0)
(setq brakujace_warstwy nil)
(repeat 10
  (setq layername (read-line file))
  (repeat 4 (read-line file))
  
  (if (tblsearch "layer" layername)
    (progn
      ;(alert (strcat "OK: " layername ))
    )
    (progn
      (setq brakujace_warstwy (append brakujace_warstwy (list layername)))
      (setq layername nil)
    ;(command "_layer" "_make" (strcat layername) "")
    )
  )
  (setq warstwanr_x (strcat "warstwanr" (itoa n)))
  (set (read warstwanr_x) layername)
  (setq n (+ n 1))
)

(if (/= brakujace_warstwy nil)
  (progn
    (setq message "\n B³¹d! Nie znaleziono warstw: \n")
    (foreach item brakujace_warstwy (setq message (strcat message "\n  " item "      ")))
    (setq message (strcat message "\n\n Dodaj brakuj¹ce warstwy lub uruchom 'Madzicad_repair'"))
    (message_text message "w")
    ;(startapp (strcat path "\\support\\madzicad_warning_box.exe"))
    ;(alert (strcat "\n B³¹d! Nie znaleziono warstw: \n" message "\n\n Dodaj brakuj¹ce warstwy lub uruchom 'Madzicad_repair'"))
  )
  (message_text "" "w")
)
  
  
  
  

;(setvar "hpgaptol" 5000)                ;tolerancja do kreskowania
;(setvar "osmode" user_osmode)                  ;wlacza wszytskie stale tryby lokalizacji
;(setvar "ltscale" (* skalalinii 100))     ;ustawia skale linii na modelu

(setvar "cecolor" "256")                    ;kolor 256=jak warstwa 
(setvar "celtscale" 1)                   ;skala rodzaju linii obiektu 1=1
(setvar "celtype" "bylayer")              ;rodzaj linii
(setvar "celweight" -1)                   ;szerokosc linii "-1" -> jak warstwa
;=====


(setvar "filedia" 0)
(command "_menuunload" "madzicad")  
;  (if (= (menugroup "madzicad") nil)
;    (progn
;      (setvar "filedia" 0)
(command "_menuload" (strcat path "\\support\\acadmenu\\madzicad.mnu"))
(setvar "filedia" 1)
;    )
;  )
(menucmd "P15=+MadziCAD.POP15")
(menucmd "P16=+MadziCAD.POP16")

;naprawianie rysunku po autostarcie














;;**************************************************************************
(princ "\n  Plik konfiguracyjny: <Init_and_settings_MadziCAD_Main> za³adowano pomyœlnie. ")
;;**************************************************************************
(princ)

;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:przerwij_w_punkcie(/ temp_selection pkt)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
    (setvar "osmode" osmodeprev)
  )
  (graphscr)
  (setq osmodeprev (getvar "osmode"))				;zapamietuje stale tryby lokalizacji
  (setvar "osmode" 15359)
  (princ "\n Wybierz obiekty do przerwania, lub [ESC] aby zakoñczyæ: ")
  (setq temp_selection (ssget "_:S"))
  (setq pkt (getpoint "\n Wska¿ punkt przerwania, lub [ESC] aby zakoñczyæ: "))
  (command "_break" 
    temp_selection
    pkt
    pkt
  )
  (setvar "osmode" osmodeprev)
  (c:przerwij_w_punkcie)
  (princ)
)

;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;; Funkcja po nacisnieciu cyfry ustawia dana warstwe jako aktywna i pyta sie o obiekty do przeniesienia na nia
;;
;;kuba miszcz 2007 :]

;;==============FUNKCJE ROBOCZE======================
(defun szybka_zmiana_warstwy(war)			;funkcja robocza do ustawiania warstw
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana ")
  )
  (graphscr)

  (setvar "clayer" war)

  (setq temp_selection (ssget "_I"))
  (sssetfirst nil nil)
  ;(setq temp_selection (ssget "_P"))
  (if 
    (= temp_selection nil)
    (progn
      (princ (strcat "\n Aktualna warstwa: \"" war "\"."))
    )
    (progn
      (command "_chprop" temp_selection "" "_layer" war "")
      ;(sssetfirst nil nil)
      (princ (strcat "\n Przeniesiono zaznaczone obiekty na warstwe \"" war "\" i uczyniono j¹ aktualn¹."))
    )
  )
  (princ)
)

(defun wybierz_obiekty_do_zaznaczenia(war / temp_selection n)	;funkcja robocza do wybierania obiektow do przenoszenia
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana ")
  )
  (graphscr)
  (setvar "clayer" war)
  (princ "\n Wybierz obiekty do przeniesienia: ")
  (setq temp_selection (ssget))
  (command "_chprop" temp_selection "" "" "_layer" war "")
  (princ (strcat "\n Przeniesiono zaznaczone obiekty na warstwe \"" war "\" i uczyniono j¹ aktualn¹."))
  (princ)
)

;;===WARSTWANR1=============================================
(defun c:warstwa1()						;zmienia warstwe na warstwenr[X] z pliku ustawienia.lsp
  (szybka_zmiana_warstwy warstwanr1)
)

(defun c:warstwa11()						;a to zmienia na warstwe i dodatkowo przenosi obiekty
  (graphscr)
  (wybierz_obiekty_do_zaznaczenia warstwanr1)		;zmienia warstwe na warstwenr[X] z pliku ustawienia.lsp
)


;;===WARSTWANR2=============================================
(defun c:warstwa2()						;zmienia warstwe na warstwenr[X] z pliku ustawienia.lsp
  (szybka_zmiana_warstwy warstwanr2)
)

(defun c:warstwa22()						;a to zmienia na warstwe i dodatkowo przenosi obiekty
  (graphscr)
  (wybierz_obiekty_do_zaznaczenia warstwanr2)		;zmienia warstwe na warstwenr[X] z pliku ustawienia.lsp
)

;;===WARSTWANR3=============================================
(defun c:warstwa3()						;zmienia warstwe na warstwenr[X] z pliku ustawienia.lsp
  (szybka_zmiana_warstwy warstwanr3)
)

(defun c:warstwa33()						;a to zmienia na warstwe i dodatkowo przenosi obiekty
  (graphscr)
  (wybierz_obiekty_do_zaznaczenia warstwanr3)		;zmienia warstwe na warstwenr[X] z pliku ustawienia.lsp
)

;;===WARSTWANR4=============================================
(defun c:warstwa4()						;zmienia warstwe na warstwenr[X] z pliku ustawienia.lsp
  (szybka_zmiana_warstwy warstwanr4)
)

(defun c:warstwa44()						;a to zmienia na warstwe i dodatkowo przenosi obiekty
  (graphscr)
  (wybierz_obiekty_do_zaznaczenia warstwanr4)		;zmienia warstwe na warstwenr[X] z pliku ustawienia.lsp
)

;;===WARSTWANR5=============================================
(defun c:warstwa5()						;zmienia warstwe na warstwenr[X] z pliku ustawienia.lsp
  (szybka_zmiana_warstwy warstwanr5)
)

(defun c:warstwa55()						;a to zmienia na warstwe i dodatkowo przenosi obiekty
  (graphscr)
  (wybierz_obiekty_do_zaznaczenia warstwanr5)		;zmienia warstwe na warstwenr[X] z pliku ustawienia.lsp
)

;;===WARSTWANR6=============================================
(defun c:warstwa6()						;zmienia warstwe na warstwenr[X] z pliku ustawienia.lsp
  (szybka_zmiana_warstwy warstwanr6)
)

(defun c:warstwa66()						;a to zmienia na warstwe i dodatkowo przenosi obiekty
  (graphscr)
  (wybierz_obiekty_do_zaznaczenia warstwanr6)		;zmienia warstwe na warstwenr[X] z pliku ustawienia.lsp
)

;;===WARSTWANR7=============================================
(defun c:warstwa7()						;zmienia warstwe na warstwenr[X] z pliku ustawienia.lsp
  (szybka_zmiana_warstwy warstwanr7)
)

(defun c:warstwa77()						;a to zmienia na warstwe i dodatkowo przenosi obiekty
  (graphscr)
  (wybierz_obiekty_do_zaznaczenia warstwanr7)		;zmienia warstwe na warstwenr[X] z pliku ustawienia.lsp
)

;;===WARSTWANR8=============================================
(defun c:warstwa8()						;zmienia warstwe na warstwenr[X] z pliku ustawienia.lsp
  (szybka_zmiana_warstwy warstwanr8)
)

(defun c:warstwa88()						;a to zmienia na warstwe i dodatkowo przenosi obiekty
  (graphscr)
  (wybierz_obiekty_do_zaznaczenia warstwanr8)		;zmienia warstwe na warstwenr[X] z pliku ustawienia.lsp
)

;;===WARSTWANR9=============================================
(defun c:warstwa9()						;zmienia warstwe na warstwenr[X] z pliku ustawienia.lsp
  (szybka_zmiana_warstwy warstwanr9)
)

(defun c:warstwa99()						;a to zmienia na warstwe i dodatkowo przenosi obiekty
  (graphscr)
  (wybierz_obiekty_do_zaznaczenia warstwanr9)		;zmienia warstwe na warstwenr[X] z pliku ustawienia.lsp
)

;;===WARSTWANR0=============================================
(defun c:warstwa0()						;zmienia warstwe na warstwenr[X] z pliku ustawienia.lsp
  (szybka_zmiana_warstwy warstwanr0)
)

(defun c:warstwa00()						;a to zmienia na warstwe i dodatkowo przenosi obiekty
  (graphscr)
  (wybierz_obiekty_do_zaznaczenia warstwanr0)		;zmienia warstwe na warstwenr[X] z pliku ustawienia.lsp
)
;;;*************************************
(setvar "mtjigstring" "MadziCAD")
(defun c:kuba()					
  (graphscr)
  (alert " :** dla Madzi w pracy:]]")
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:wymiar_liniowy(/ layerprev pkt1 pkt2)
  (defun *error* (errorlevel)
    (setvar "clayer" layerprev)			;zmienia na poprz warstwe
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq layerprev (getvar "clayer"))			;zapamietuje biezaca warstwe
  (setq last_base_pt_prev last_base_pt)   ;zapamietuje polozenie poprzedniego wymiaru
  (if (/= (tblsearch "layer" warwym) nil)
    (setvar "clayer" warwym)          			;ustala akt warstwe na 'wymiary'
  )
  (setq pkt1 (getpoint "\n Wska¿ pierwszy punkt pomocniczej linii wymiarowej (ENTER - kontynuacja poprzedniego wymiaru): "))
  (if (= pkt1 nil)
    (setq pkt1 last_pt)
  )
  (setq pkt2 (getpoint "\n Wska¿ drugi punkt pomocniczej linii wymiarowej: " pkt1))
  (command "_dimlinear" 
    pkt1
    pkt2
    (progn
      (princ "\n Wska¿ punkt wstawienia wymiaru (ENTER - kontynuacja poprzedniego wymiaru): ")
      pause
    )
  )
  (setq last_base_pt (cdr (assoc 10 (entget (entlast)))))
  (if 
    (and (= (car last_base_pt) (car last_base_pt_prev)) (= (cadr last_base_pt) (cadr last_base_pt_prev)) (= (car last_base_pt) (car last_base_pt_prev)))
    (progn
      (command "_dimlinear" 
      pkt1
      pkt2
      last_base_pt_prev
      )
    )
  )
  (setq last_base_pt (cdr (assoc 10 (entget (entlast)))))
  (setq last_pt (cdr (assoc 14 (entget (entlast)))))
  (setvar "clayer" layerprev)			;zmienia na poprz warstwe
  (princ)
)

;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:wymiar_normalny(/ layerprev pt1 pt2 pt1temp pt2temp tan_angle angledeg)
  (defun *error* (errorlevel)
    (setvar "clayer" layerprev)			;zmienia na poprz warstwe
    (setvar "orthomode" orthomodeprev)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq layerprev (getvar "clayer"))			;zapamietuje biezaca warstwe
  (setq orthomodeprev (getvar "orthomode"))
  (setvar "orthomode" 0)
  (setq last_base_pt_prev last_base_pt)   ;zapamietuje polozenie poprzedniego wymiaru
  (if (/= (tblsearch "layer" warwym) nil)
    (setvar "clayer" warwym)          			;ustala akt warstwe na 'wymiary'
  )
  (setq pt1 (getpoint "\n Wska¿ pierwszy punkt pomocniczej linii wymiarowej (ENTER - kontynuacja poprzedniego wymiaru): "))
  (if (= pt1 nil)
    (setq pt1 last_pt)
  )
  (setq pt2 (getpoint "\n Wska¿ drugi punkt pomocniczej linii wymiarowej: " pt1))

  (setq pt1temp (trans pt1 1 0))
  (setq pt2temp (trans pt2 1 0))   ; z luw do guw  
  
  ;obliczenie kata y=Ax+B -> A to tangens kata
  (setq tan_angle (/ (- (cadr pt2) (cadr pt1)) (- (car pt2) (car pt1))))
  (setq angledeg (cvunit (atan tan_angle) "radians" "degrees"))
  (command "_ucs" "_new" "_z" angledeg)
 
  (defun *error* (errorlevel)
    (setvar "clayer" layerprev)			;zmienia na poprz warstwe
    (command "_ucs" "_previous")
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
    
  (command "_dimlinear" 
    (trans pt1temp 0 1)   ; z guw do luw
    (trans pt2temp 0 1)
    (progn
      (princ "\n Wska¿ punkt wstawienia wymiaru (ENTER - kontynuacja poprzedniego wymiaru): ")
      pause
    )
  )
  
  (setq last_base_pt (cdr (assoc 10 (entget (entlast)))))
  (if 
    (and (= (car last_base_pt) (car last_base_pt_prev)) (= (cadr last_base_pt) (cadr last_base_pt_prev)) (= (car last_base_pt) (car last_base_pt_prev)))
    (progn
      (command "_dimlinear" 
        (trans pt1temp 0 1)
        (trans pt2temp 0 1)
        (trans last_base_pt_prev 0 1)
      )
    )
  )
  (setq last_base_pt (cdr (assoc 10 (entget (entlast)))))
  
  (setq last_pt (cdr (assoc 14 (entget (entlast)))))
  (command "_ucs" "_previous")
  (setvar "clayer" layerprev)			;zmienia na poprz warstwe
  (setvar "orthomode" orthomodeprev)
  (princ)
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;; Funkcja wstawia wymiar wpólrzednych w aktualnym LUW razem z kota, 
;; wstawiana wspolrzedna bazuje na istniejacym stylu wymiarowania
;; wiec jesli cos sie rozjezdza z tekstem wystarczy zmienic w stylu wymiarowania
;;
;;kuba miszcz 2007 :]

(defun c:wymiar_wspolrzednych(/ layerprev skala pkt temp_selection)
  (defun *error* (errorlevel)
    (setvar "dimpost" ".")
    (setvar "clayer" layerprev)			;zmienia na poprz warstwe
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  
  (setq layerprev (getvar "clayer"))			;zapamietuje biezaca warstwe
  (if (/= (tblsearch "layer" warwym) nil)
    (setvar "clayer" warwym)          			;ustala akt warstwe na 'wymiary'
  )
  (setq skala (getvar "dimscale"))		;skala wymiarowania

  (setq pkt (getpoint "\n Wska¿ punkt: "))
  (if (= (cadr pkt) 0) (setvar "dimpost" "%%p<>"))	;ustalanie czy wspolrzedna wzgledna czy nie
  (if (> (cadr pkt) 0) (setvar "dimpost" "+<>"))
  (if (< (cadr pkt) 0) (setvar "dimpost" "-<>"))
  (if (> (cadr pkt) (* HH 1000)) (setvar "dimpost" "."))   

  (setq temp_selection (ssadd))  
  (command "_dimordinate" pkt "_y" pkt)
  (setvar "dimpost" ".")
  (ssadd (entlast) temp_selection)
  (if (/= (tblsearch "block" blok_kota) nil)
    (command "_insert" "MadziCAD_kota" pkt skala skala "0")
  )
  (ssadd (entlast) temp_selection)
  (generuj_losowa_nazwe "rzedna")
  (command "_group" "_create" losowa_nazwa "" temp_selection "")
  (setvar "clayer"layerprev)
  (c:wymiar_wspolrzednych)
  (princ)
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;; program laduje uzywane lispy
(defun c:madzicad_reload ()		;a to jest dla mnie do szybkiego testowania zmian:]
;;;  (load
;;;    (strcat path "\\madzicad sources\\madzicad_source.lsp")
;;;  )  
  (load (strcat path "\\madzicad_bin.vlx"))
  (setvar "re-init" 16)
  (princ)
)

;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:przesun_poprzednie()
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (command "_move"
    "_previous" 				;poprzedni wybor
    "" 
    (getpoint "\n Wska¿ punkt bazowy: ")		 
    pause
  ) 
(princ)
)


;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:kopiuj_poprzednie()
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (command "_copy"
    "_previous" 				;poprzedni wybor
    "" 
    (getpoint "\n Wska¿ punkt bazowy: ")		 
    pause
  )
(princ)
)

(defun c:xxx()  ;kopiuj enhanced dokonczyc
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq temp_selection (ssget))
  (setq base_pt (cdr (assoc 10 (entget (ssname temp_selection 0)))))
  (command "_copy"
    temp_selection
    "" 
    base_pt
    pause
  )
(princ)
)

;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:skaluj_poprzednie()
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (command "_scale"
    "_previous" 				;poprzedni wybor
    "" 
    (getpoint "\n Wska¿ punkt bazowy: ")
  )
(princ)
)


;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:obrot_poprzednie()
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (command "_rotate"
    "_previous" 				;poprzedni wybor
    "" 
    (getpoint "\n Wska¿ punkt bazowy: ")
  )
(princ)
)


;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:typowy_tekst(/ layerprev osmodeprev pkt ostatni_tekst entlist new_text)
  (defun *error* (errorlevel)
    (setvar "osmode" osmodeprev)
    (setvar "clayer" layerprev)			;zmienia na poprz warstwe
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq layerprev (getvar "clayer"))			;zapamietuje biezaca warstwe
  (setq osmodeprev (getvar "osmode"))
  (if (/= (tblsearch "layer" warwym) nil)
    (setvar "clayer" warwym)          			;ustala akt warstwe na 'wymiary'
  )
  (setq pkt (getpoint "\n Wska¿ punkt wstawienia tekstu: "))
  (setvar "osmode" 0)
  (initdia)
  (command "_mtext" 
    pkt
    "_justify" "_bl" 
    "_height" (* (getvar "dimscale") txta)			;wysokosc tekstu
    pkt
  )
  
;zamiana tekstu na duze litery jesli tak usatawione w pliku ustawienia
  (setq ostatni_tekst (ssget "_L"))
  
  (if (= all_uppercase 1)
    (progn
      (setq entlist (entget (ssname ostatni_tekst 0)))
      (setq new_text (strcase (cdr (assoc 1 entlist))))
      (setq entlist     ;zmiana na duze litery
        (subst 
          (cons 1 new_text) 
          (assoc 1 entlist) 
          entlist
        )
      )
      (entmod entlist)
    )
  )
   
   ;dodawanie maski 
  (if (= automatyczne_dodawanie_maski_tla_do_tekstow 1)
    (progn
      (setq entlist (entget (ssname ostatni_tekst 0)))
      (setq entlist   
         (append
           entlist
           (list (cons 90 3))       ;dodanie maski 
           (list (cons 63 256))     ;ustawienie maski jak tlo rysuku
           (list (cons 45 rozmiar_maski_w_tekstach))     ;ustawienie rozmiaru maski 1.1        
         )
      )
      (entmod entlist)
    )
  )
  (setvar "osmode" osmodeprev)
  (setvar "clayer" layerprev)			;zmienia na poprz warstwe
  (princ)  
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
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


;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
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

;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:szybki_luw_globalny()
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (command "_ucs" "_world")
  (princ "\n Aktualny LUW: Globalny. ")
  (princ)
)

;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:skala_rysowania()
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (princ (strcat "\n Podaj now¹ skalê rysowania <" (rtos (getvar "dimscale")) ">: "))
  (setvar "dimscale" (getint))
  (princ)
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;zmiana na PAPIER w obszarze wydruku
(defun c:obszar_papieru()
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (command "_pspace")
  (command "_regenall")
  (princ)
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;; Funkcja wstawia strzalke i wartosc spadku w [%]
;;
;; kuba miszcz 2007 :]

(defun c:spadek	(/	       layerprev     osmodeprev
		 orthoprev     skala	     pt1
		 pt2	       tan_angle     anglerad
		 angledeg      strzalka	     spadek
		 spadektxt     pkt	     temp_selection
		 ostatni_tekst ent_text	     ent_strzalka
		 insert_pt     insert_pt_luw
		)
  (defun *error* (errorlevel)
    (setvar "clayer" layerprev)		;zmienia na poprz warstwe
    (setvar "osmode" osmodeprev)
    (setvar "orthomode" orthoprev)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)

  (setq layerprev (getvar "clayer"))	;zapamietuje biezaca warstwe
  (setq osmodeprev (getvar "osmode"))	;zapamietuje stale tryby lokalizacji
  (setq orthoprev (getvar "orthomode"))	;zapamietuje status orto
  (if (/= (tblsearch "layer" warwym) nil)
    (setvar "clayer" warwym)		;ustala akt warstwe na 'wymiary'
  )
  (setq skala (getvar "dimscale"))	;skala wstawiania

  (setvar "orthomode" 0)
  (setq pt1 (getpoint "\n Wska¿ pierwszy punkt: "))
  (initget 137)				;co to?
  (setq	pt2
	 (getpoint
	   pt1
	   "\n Wska¿ drugi punkt, lub podaj wartoœæ spadku (ujemn¹ dla spadku w dó³): "
	 )
  )


  (if
    (= (listp pt2) nil)			;jesli prawda to zamiast punktu podano wartosc spadku
     (progn
       (setq spadek (atof pt2))
       (setq
	 ucs_angle (cvunit (atan (/ spadek)) "radians" "degrees")
       )
       (setvar "orthomode" 1)
       (setvar "clayer" layerprev)
       (command	"_line"
		pt1
		(progn
		  (princ "\n Wska¿ zasiêg linii (w poziomie). ")
		  pause
		)
		""
       )				;narysowal pozioma linie 

       (if (/= (tblsearch "layer" warwym) nil)
	 (setvar "clayer" warwym)	;ustala akt warstwe na 'wymiary'
       )

       (setq entlist (entget (entlast))) ;entycja poziomej linii
       (setq pt1 (cdr (assoc 10 entlist)))
       (setq pt2 (cdr (assoc 11 entlist)))
       (setq dist (abs (- (car pt2) (car pt1))))
       (setq height (* dist (/ spadek 100)))
       (setq pt2 (list (car pt2) (+ (cadr pt1) height)))
       (setq entlist
	      (subst
		(cons 11 pt2)
		(assoc 11 entlist)
		entlist
	      )
       )
       (entmod entlist)			;zrobienie z poziomej linii linii o zadanym spadku
					;(entmake (entget (entlast)))
     )
     (progn				;nie podano teksu tylko wksazano punkt wiec rysuje linie 
       (command	"_line"
		pt1
		pt2
		""
       )
     )
  )

;;;;===============================
  (setq temp_selection (ssadd))

  (setq pt1 (cdr (assoc 10 (entget (entlast))))) ;pt1 w GUW
  (setq pt1 (trans pt1 0 1))		;pt1 z GUW do LUW  
  (setq pt2 (cdr (assoc 11 (entget (entlast))))) ;pt2 w GUW
  (setq pt2 (trans pt2 0 1))		;pt2 z GUW do LUW 
  (command "_erase" (entlast) "")


  (setq tan_angle (/ (- (cadr pt2) (cadr pt1)) (- (car pt2) (car pt1))))
  (setq anglerad (atan tan_angle))
  (setq angledeg (cvunit anglerad "radians" "degrees"))
					;kat w stopniach

  (setq spadek (abs (* 100 tan_angle)))	;100% * tangens kata = spadek
  (setq spadektxt (strcat (rtos spadek 2 dokl_spadku) "%"));dokladnosc spadku
  (princ (strcat "\n Dok³adna wartoœæ spadku: " (rtos spadek)))
					

		

			
  (if	;ustalenie kierunku strzalki			
    (> angledeg 0)
     (setq kierunek_spadku "lewo")
     (setq kierunek_spadku "prawo")
  )

  (setvar "osmode" 0)

  (if (/= (tblsearch "block" blok_spadek_w_lewo) nil)
    (cond ((= kierunek_spadku "lewo");bloki istnieja wiec wsatwianie strzalki i jej obrot o opdowiedni kat
	   (command "_insert"	blok_spadek_w_lewo    "_scale"	skala
		    "_rotate"	angledeg    '(0 0)	spadektxt
		   )
		   (ssadd (entlast) temp_selection)
	  )
	  ((= kierunek_spadku "prawo")
	   (command "_insert"	blok_spadek_w_lewo    "_scale"	skala
		    "_rotate"	(* angledeg -1)    '(0 0)	spadektxt
		   )
	   (command "_mirror" (entlast) "" '(0 0) '(0 10) "_yes")
	   (ssadd (entlast) temp_selection)
	  )
    )
  )

  (setvar "orthomode" 0)
  (command "_move" (entlast) "" '(0 0) pause)


  (generuj_losowa_nazwe "MadziCAD_spadek")
  (princ (strcat "\n Dok³adna wartoœæ spadku: " (rtos spadek)))




  (command "_point" pt1)		;rysowanie punktow
  (ssadd (entlast) temp_selection)
  (command "_point" pt2)
  (ssadd (entlast) temp_selection)

  (command "_group" "_create" losowa_nazwa "" temp_selection "")


  (setvar "osmode" osmodeprev)
  (setvar "orthomode" orthoprev)
  (setvar "clayer" layerprev)		;zmienia na poprz warstwe			
  (princ)
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
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
  ;(command "_select" "_single" mode pause)
  (command "_select" "_single" mode pause)
  (sssetfirst nil (ssget "_P"))
  (princ (strcat "\n Utworzono tymczasowy zbiór wskazañ z " (rtos(sslength (ssget "_P"))) " obiektów. "))
  (setvar "osmode" osmodeprev)  
  (setvar "orthomode" orthoprev)
  (princ)

)
(defun c:szybki_wybor_krawedz()
  (graphscr)
  (princ "\n Narysuj krawêdŸ przecinaj¹c¹ wybierane obiekty: ")
  (szybki_wybor_internal "_fence")
)
(defun c:szybki_wybor_zamkniety_wielobok()
  (graphscr)
  (princ "\n Narysuj wielobok ZAWIERAJ¥CY wybierane obiekty: ")
  (szybki_wybor_internal "_wpolygon")
)
(defun c:szybki_wybor_otwarty_wielobok()
  (graphscr)
  (princ "\n Narysuj wielobok DOTYKAJ¥CY wybieranych obiektów: ")
  (szybki_wybor_internal "_cpolygon")
)
(defun c:szybki_wybor_poprzedni()
  (graphscr)
  ;(command "_select" "p" "")
  (sssetfirst nil (ssget "_P"))
  (princ (strcat "\n Utworzono tymczasowy zbiór wskazañ z " (rtos(sslength (ssget "_P"))) " poprzednio wybranych obiektów. "))
  (princ)
)
(defun c:szybki_wybor_ostatnio_utworzone()
  (graphscr)
  ;(command "_select" "s" "")
  (sssetfirst nil (ssget "_L"))
  (princ (strcat "\n Utworzono tymczasowy zbiór wskazañ z " (rtos(sslength (ssget "_P"))) " ostatnio utworzonych obiektów. "))
  (princ)
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:papier_model()
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (if
    (= (getvar "tilemode") 1)   ;tilemode=1 -> obszar mdoelu
    (progn
      (setvar "tilemode" 0)
      (if (= szacher_macher 1)
        (setvar "ltscale" skalalinii)
      )
      ;(setq prev_dim_scale (getvar "dimscale"))
      ;(setvar "dimscale" 10)
      ;(command "_regenall")
    )
    (progn
      (setvar "tilemode" 1)
      (if (= szacher_macher 1)
        (setvar "ltscale" (* skalalinii 100))
      )
      ;(setvar "dimscale" prev_dim_scale)
      ;(command "_regen")
    )
  )
  (command "_regenall")
  (princ)
)

;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:rzutnie_zablokuj_odblokuj(/ temp_selection)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
 (graphscr)
  (princ "\n Wska¿ rzutnie do zablokowania/odblokowania: ")
  (setq temp_selection (ssget "_:S" '((0 . "VIEWPORT"))))
  (wartosc_wlasciwosci temp_selection 90)
  (check_bit_value wlasciwosc 16384)	;16384=2^14 -> 14+1=15 bit
  (if 
    (= bit_value 1) 				;1-rzutnia zamknieta, 0-rzutnia otwarta
    (progn
      (command "_mview" "_lock" "_off" temp_selection "")
      (command "_chprop" temp_selection "" "_color" "_bylayer" "")
      (princ "\n Otwarto rzutniê. ")
    )    
    (progn
      (command "_mview" "_lock" "_on" temp_selection "")
      (command "_chprop" temp_selection "" "_color" "1" "")
      (princ "\n Zamknieto rzutniê. ")
    )    
  )
  (princ)
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:skaluj_xy(/ temp_selection pkt skalax skalay)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (princ "\n Wybierz obiekty do przeskalowania: ")
  (setq temp_selection (ssget))
  (setq pkt (getpoint "\n Wska¿ punkt bazowy: "))
  (setq skalax (getreal "\n Podaj skalê X: "))
  (setq skalay (getreal "\n Podaj skalê Y lub [ENTER] jeœli taka sama jak X: "))
  (if (= skalaY nil) (setq skalay skalax))
  (generuj_losowa_nazwe "temp_block")
  (command "_block" losowa_nazwa pkt temp_selection "")
  (command "_insert" losowa_nazwa pkt skalaX skalaY 0)
  (command "_explode" (entlast))
  (command "_purge" "_blocks" losowa_nazwa "_no")
(princ)
)


;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:ukryj_warstwe_obiektu(/ layer)  				
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana ")
  )
  (graphscr)
  (princ "\n Wska¿ obiekt na warstwie do ukrycia: ")
  (setq temp_selection (ssget "_:S"))
  (setq layer (cdr (assoc 8 (entget (ssname temp_selection 0)))))
  (if (= layer (getvar "clayer"))
    (command "_Layer" "_off" layer "_yes" "")
    (command "_Layer" "_off" layer "")
  )
  (princ (strcat "\n Ukryto warstwê \"" layer "\". "))
  (setq command_UWOWO_status 0)
  (princ)
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:ukryj_warstwy_oprocz_warstwy_obiektu(/ layer temp_selection)  	
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana ")
  )
  (if
    (= command_UWOWO_status 0)
    (progn
      (princ "\n Wska¿ obiekt(y) których warstwy maj¹ pozostaæ odkryte: ")
      (setq temp_selection (ssget))
      (selection_to_list temp_selection)
      (command "_Layer" "_off" "*" "_yes" "")
      (foreach item sslist
        (progn
          (setq layer (cdr (assoc 8 (entget item))))
          (command "_Layer" "_on" layer "")
          (princ (strcat "\n Ukryto wszystkie warstwy oprócz \"" layer "\". "))
        )
      )
      (setq command_UWOWO_status 1)
    )
    (progn
      (command "_Layer" "_on" "*" "")
      (setq command_UWOWO_status 0)
      (princ "\n Odkryto wszystkie warstwy. ")
    )
  )
(princ)
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:odkryj_wszystkie_warstwy() 
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (command "_Layer" "_on" "*" "")
  (setq command_UWOWO_status 0)
  (princ "\n Odkryto wszystkie warstwy. ")
  (princ)
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:txt_na_mtxt(/ temp_selection n temp_entlist bazatxt wysokosc tresc)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (princ "\n Wska¿ tekst lub teksty jednowierszowe do zamiany na wielowierszowe: ")
  (setq temp_selection (ssget '((0 . "TEXT"))))
  (selection_to_list temp_selection)
  (foreach item sslist
    (progn
      (setq temp_entlist (entget item))
      (setq bazatxt (cdr (assoc 10 temp_entlist)))
      (setq bazatxt (trans bazatxt 0 1))
      (setq wysokosc (cdr (assoc 40 temp_entlist)))
      (setq tresc (cdr (assoc 1 temp_entlist)))	
      (command "_mtext" bazatxt "_justify" "_bl" "_height" wysokosc bazatxt tresc "")
      (command "_matchprop" item (entlast) "")
      (command "_erase" item "")
    )
  )
  (princ (strcat " " (rtos (length sslist))  " tekstów jednowierszowych przekszta³cono na wielowierszowe. "))
  (princ)
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:ustal_warstwe_obiektu_aktualna(/ temp_selection dimstyle_name)  				
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana ")
  )
  (princ "\n Wska¿ obiekt którego warstwa ma zostaæ aktualn¹: ")
  (setq temp_selection (ssget "_:S"))
  (if (= (cdr (cadr (entget (ssname temp_selection 0)))) "DIMENSION")
    (progn
      (setq dimstyle_name (cdr (assoc 3 (entget (ssname temp_selection 0)))))
      (command "_dimstyle" "_restore" dimstyle_name)
      (princ (strcat " \n Aktualny styl wymiarowania: " dimstyle_name))
    )
    (progn
      (wartosc_wlasciwosci temp_selection 8)
      (setvar "clayer" wlasciwosc)
      (princ (strcat " \n Aktualna warstwa: " wlasciwosc))
    )
  )
  (princ)
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:przenies_na_aktualna_warstwe(/ pri_obj pri_layer temp_selection n sslist entlist)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (princ "\n Wska¿ obiekt na warstwie na któr¹ przenieœæ obiekty: ")
  (setq pri_obj (ssget "_:S"))
  (setq pri_layer (cdr(assoc 8(entget (ssname pri_obj 0)))))
  (princ "\n Wska¿ obiekt lub obiekty do przeniesienia na inn¹ warstwê: ")
  (setq temp_selection (ssget "_:S"))
  (while (/= temp_selection nil)
    (selection_to_list temp_selection)
    (setq n (length sslist))
    (repeat n
      (setq n (- n 1))
      (setq entlist (entget (nth n sslist)))
      (setq entlist
        (subst 
          (cons 8 pri_layer) 
          (assoc 8 entlist) 
          entlist
        )
      )
      (entmod entlist)
    )
    (princ "\n Wska¿ obiekt lub obiekty do przeniesienia na inn¹ warstwê: ")
    (setq temp_selection (ssget "_:S"))
    (princ (strcat "\n "(rtos (length sslist))" obiektów przeniesiono na warstwê " pri_layer ". "))
  )  
  (princ)
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:szybki_szyk(/ temp_selection pt1 pt2 rozstaw liczba_elementów)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq temp_selection (ssget))
 
  (setq pt1 (getpoint "\n Wska¿ pierwszy punkt bazowy obiektu(ów): "))
  (setq pt2 (getpoint pt1 "\n Wska¿ drugi punkt linii kierunkowej, lub przy równoczesnym wskazanym kierunku podaj rozstaw: "))
  (setq rozstaw (sqrt (+ (expt (- (car pt2) (car pt1)) 2) (expt (- (cadr pt2) (cadr pt1)) 2))))
  (setq liczba_elementów (getint "\n Podaj liczbê elementów: "))
  
  (command "_ucs" "_new" "3" pt1 pt2 "")
  (command "_array"
      temp_selection
      ""
      "_rectangular"
      "1"
      liczba_elementów
      rozstaw
  )
  (command "_ucs" "_previous")
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:zamknij_otworz_warstwe_obiektu(/ layer layerstatus)
  (princ "\n Wska¿ obiekt którego warstwa ma zostaæ zamkniêta/otwarta: ")
  (setq temp_selection (ssget "_:S"))
  (setq layer (cdr (assoc 8 (entget (ssname temp_selection 0)))))
  (setq layerstatus (cdr (assoc 70 (tblsearch "layer" layer))))
  (if 
    (= layerstatus 0)         ;0-otwarta 4-zamknieta
    (progn 
      (command "_Layer" "_lock" layer "")  
      (princ (strcat "\n Zamkniêto warstwê \"" layer "\". "))
    )    
  )
  (if 
    (= layerstatus 4) 
    (progn
      (command "_Layer" "_unlock" layer "")
      (princ (strcat "\n Otwarto warstwê \"" layer "\". "))
    )
  )
  (princ)
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:zamknij_otworz_warstwy(/ layer layerstatus temp_selection)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (if 
    (= command_ZOW_status 0) 
    (progn
      (princ "\n Wska¿ obiekt którego warstwa ma pozostaæ bez zmian: ")
      (setq temp_selection (ssget "_:S"))
      (setq layer (cdr (assoc 8 (entget (ssname temp_selection 0)))))
      (setq layerstatus (cdr (assoc 70 (tblsearch "layer" layer))))
      (if 
        (= layerstatus 0) 				;0-warstwa otwarta
        (progn
          (command "_Layer" "_lock" "*" "") 
          (command "_Layer" "_unlock" layer "")
          (princ (strcat "\n Zamkniêto wszystkie warstwy oprócz \"" layer "\". "))
          (setq command_ZOW_status 1)
        )
      )
      (if 
        (= layerstatus 4) 				;4-warstwa zamknieta
        (progn
          (command "_Layer" "_unlock" "*" "")
          (command "_Layer" "_lock" layer "")
          (princ (strcat "\n Otwarto wszystkie warstwy oprócz \"" layer "\". "))
          (setq command_ZOW_status 1)
        )
      )
    )
    (progn
      (command "_Layer" "_unlock" "*" "")
      (princ "\n Otwarto wszystkie warstwy. ")
      (setq command_ZOW_status 0)
    )
  )
  (princ)
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:otworz_wszystkie_warstwy()
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (command "_Layer" "_unlock" "*" "")
  (princ "\n Otwarto wszystkie warstwy. ")
  (setq command_ZOW_status 0)
  (princ)
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;poprawic paramter w trim na angielski
(defun c:linia_uciecia(/ layerprev coords skala pkt1 pkt2 osmodeprev pkt3x pkt3y pkt3 dist trim_edge entlist vertlist n)
  (defun *error* (errorlevel)
    (setvar "clayer" layerprev)			;zmienia na poprz warstwe
    (setvar "osmode" osmodeprev)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
;;=========
  (graphscr)
  (setq layerprev (getvar "clayer"))			;zapamietuje biezaca warstwe
  (setq osmodeprev (getvar "osmode"))
  (if (/= (tblsearch "layer" warwym) nil)
    (setvar "clayer" warwym)          			;ustala akt warstwe na 'wymiary'
  )
  (setq skala (/ (getvar "dimscale") 100))		;skala wstawiania

  (princ "\n Wska¿ punkty uciêcia: ")
  (command "_line" pause pause "")
  (setq pkt1 (cdr (assoc 10 (entget (entlast)))))		;pkt1 w GUW
  (setq pkt1 (trans pkt1 0 1))					;;pkt1 z GUW do LUW  
  (setq pkt2 (cdr (assoc 11 (entget (entlast)))))		;pkt2 w GUW
  (setq pkt2 (trans pkt2 0 1))					;;pkt2 z GUW do LUW 
  (command "_erase" (entlast) "")
  (setvar "osmode" 0)

;*****ustalenie srodka tymczaswego LUW
  (setq pkt3x (/ (+ (car pkt1) (car pkt2)) 2))
  (setq pkt3y (/ (+ (cadr pkt1) (cadr pkt2)) 2))
  (setq pkt3 (list pkt3x pkt3y))				;pkt3 w LUW
  (setq dist (sqrt (+ (expt (- (car pkt1) (car pkt2)) 2) (expt (- (cadr pkt1) (cadr pkt2)) 2))))
  (command "_ucs" "_new" "3" pkt3 pkt2 "")

  (command "_pline" 
    (list (- 0 (/ dist 2) (* 500 skala)) 0)
    (list (- 0 (/ dist 2)) 0)
    (list (* -300 skala) 0)
    (list (* -150 skala) (* 1200 skala))
    (list 0 0)       ;srodek linii
    (list (* 150 skala) (* -1200 skala)) 
    (list (* 300 skala) 0) 
    (list (+ 0 (/ dist 2)) 0)
    (list (+ 0 (/ dist 2) (* 500 skala)) 0)
    ""
  )
  (setq trim_edge (entlast))
  (command "_ucs" "_previous")
  (command "_offset" 1 trim_edge (getpoint "\n Wska¿ od ktorej strony ucinaæ obiekty: ") "") 

;;;;;;;;;;;;lista wierzchlkow polilinii 
  (setq entlist (entget (entlast)))
  (setq vertlist (member (assoc 10 entlist) entlist))
  (repeat (cdr (assoc 90 entlist))
    (setq coords (cons (cdar vertlist) coords) vertlist (cddddr vertlist))
  )
;;;;;;;;;;;
  (entdel (entlast))

  (setq n (- (length coords) 1))
  (repeat n
    (setq pkt1 (trans (nth n coords) 0 1))
    (setq pkt2 (trans (nth (- n 1) coords) 0 1))
    (command "_trim" trim_edge "" "_fence" pkt1 pkt2 "" "")
    (command "_trim" trim_edge "" "_fence" pkt1 pkt2 "" "")    
    (command "_trim" trim_edge "" "_fence" pkt1 pkt2 "" "")
    (command "_trim" trim_edge "" "_fence" pkt1 pkt2 "" "")
    (command "_trim" trim_edge "" "_fence" pkt1 pkt2 "" "")
    (command "_trim" trim_edge "" "_fence" pkt1 pkt2 "" "")
    (setq n (- n 1))
  )

  ;******KONCZENIE POLECENIA
  (setvar "osmode" osmodeprev)
  (setvar "clayer" layerprev)			;zmienia na poprz warstwe

  (princ)
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:ukryj_odkryj_obiekty(/ temp_selection pkt)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana ")
  )
  (if 
    (= flaga_ukryj_odkryj nil)
;***nie bylo wczesniej wykonane
    (progn
      (princ "\n Wybierz obiekty do ukrycia: ")
      (setq temp_selection (ssget))
      (generuj_losowa_nazwe "MadziCAD_block_hh")
      (setq block_hh losowa_nazwa)
      (setq pkt (trans '(0 0) 1 0))
      (command "_block" block_hh pkt temp_selection "")
      (princ (strcat "\n Ukryto " (rtos (sslength temp_selection)) " wybranych obiektów. "))
      (setq flaga_ukryj_odkryj 1)
    )
;***bylo wczesniej wykonane  
    (progn
    (setq pkt (trans '(0 0) 1 0))
    (command "_insert" block_hh pkt 1 1 0)
    (command "_explode" (entlast))
    (command "_purge" "_blocks" block_hh "_no")
    (setq flaga_ukryj_odkryj nil)
    (princ "\n Przywrócono ukryte obiekty. ")
    )
  )
  (princ)
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:zmiana_tekstu_wymiarowego
       (/ temp_selection nowy_tekst userclicked)
  (princ "\n Wybierz wymiar z tekstem do zamiany: ")
  (setq temp_selection (ssget "_:S"))

  (setq userclicked nil)

  (setq	dcl_id (load_dialog
		 (strcat path "\\DCL\\zmiana_tekstu_wymiarowego.dcl")
	       )
  )
  (new_dialog "zmiana_tekstu_wymiarowego" dcl_id)
					;(action_tile "nowy_tekst_wymiarowy" "(setq nowy_tekst $value userclicked T)")

  (action_tile
    "accept"
    "(setq nowy_tekst (get_tile \"nowy_tekst_wymiarowy\") userclicked T)(DONE_DIALOG)"
  )

  (action_tile
    "cancel"
    "(setq userclicked nil)(DONE_DIALOG)"
  )



  (start_dialog)			; Display the dialog 
  (unload_dialog dcl_id)		; Unload the DCL file.

  (if (= userclicked T)
    (progn
      (zmiana_wlasciwosci temp_selection 1 nowy_tekst)
      (princ "\n Tekst wymiarowy zmieniono. ")
    )
    (princ "\n Anulowano. ")
  )
  (princ)
)

(defun c:zmiana_tekstu_wymiarowego2 (/ temp_selection nowy_tekst)
  (princ "\n Wybierz wymiar z tekstem do zamiany: ")
  (setq temp_selection (ssget "_:S"))
  (setq nowy_tekst (getstring "\n Podaj nowy tekst wymiarowy: "))
  (zmiana_wlasciwosci temp_selection 1 nowy_tekst)
  (princ "\n Tekst wymiarowy zmieniono. ")
  (princ)
)


;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;; Funkcja wstawia wymiar wpólrzednych poziomych kilometraz w aktualnym LUW
;; razem ze znacznikiem
;;
;;kuba miszcz 2007 :]

(defun c:wymiar_wspolrzednych_kilometraz(/ layerprev pkt)
  (defun *error* (errorlevel)
    ;(setvar "osmode" osmodeprev)
    ;(setvar "orthomode" orthoprev)
    (setvar "clayer" layerprev)			;zmienia na poprz warstwe
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  
  (setq layerprev (getvar "clayer"))			;zapamietuje biezaca warstwe
  ; (setq osmodeprev (getvar "osmode"))       ;zapamietuje stale tryby lokalizacji
  ; (setq orthoprev (getvar "orthomode"))     ;zapamietuje status orto
  
  (if (/= (tblsearch "layer" warwym) nil)
    (setvar "clayer" warwym)          			;ustala akt warstwe na 'wymiary'
  )
  
  (setq pkt (getpoint "\nWska¿ punkt:"))
  (command "_dimordinate" pkt "_x" pkt)
  
  ;=================
  ; (setq entlist (entget (entlast)))
  ; (entdel (entlast))
  ; (setq base_pt (cdr (assoc 13 entlist)))
  ; (princ base_pt)
  ; (command "_circle" base_pt 25)
  ; (setq txt_center (cdr (assoc 11 entlist)))
  ; (princ txt_center)
  ; (command "_circle" txt_center 50)
  ; ;(setq new_txt_center (list (+ (/ (- (car txt_center) (car base_pt)) 4) (car base_pt)) (cadr txt_center) (caddr txt_center)))
  ; (setq new_txt_center (polar base_pt (angle base_pt txt_center) (/ (distance base_pt txt_center) 4.0)))
  ; (setq aaaa (cons 11 new_txt_center))
  ; (princ new_txt_center)
  ; (princ aaaa)
  
  ; (command "_circle" new_txt_center 150)
  ; (setq entlist
    ; (subst 
      ; (cons 11 new_txt_center) 
      ; (assoc 11 entlist) 
      ; entlist
    ; )
  ; )
  
  ; ;(entdel entlist)
  ; (entmake entlist)
  ;=================
  
  
  ;(setvar "osmode" osmodeprev)
  ;(setvar "orthomode" orthoprev)
  (setvar "clayer" layerprev)
  (c:wymiar_wspolrzednych_kilometraz)
  (princ)
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;; Funkcja wstawia strzalke i wartosc spadku w [%]
;;
;; kuba miszcz 2007 :]

(defun c:nachylenie(/ layerprev osmodeprev orthoprev skala pt1 pt2 tan_angle anglerad angledeg strzalka spadek spadektxt pkt temp_selection ostatni_tekst ent_text ent_strzalka insert_pt insert_pt_luw)
  (defun *error* (errorlevel)
    (setvar "clayer" layerprev)			;zmienia na poprz warstwe
    (setvar "osmode" osmodeprev)
    (setvar "orthomode" orthoprev)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  
  (setq layerprev (getvar "clayer"))				;zapamietuje biezaca warstwe
  (setq osmodeprev (getvar "osmode"))				;zapamietuje stale tryby lokalizacji
  (setq orthoprev (getvar "orthomode"))			;zapamietuje status orto
  (if (/= (tblsearch "layer" warwym) nil)
    (setvar "clayer" warwym)          			;ustala akt warstwe na 'wymiary'
  )
  (setq skala (getvar "dimscale"))	;skala wstawiania
  
  (setvar "orthomode" 0)  
  (setq pt1 (getpoint "\n Wska¿ pierwszy punkt: "))
  (initget 137)
  (setq pt2 (getpoint pt1 "\n Wska¿ drugi punkt, lub podaj wartoœæ nachylenia 1:<x> (ujemn¹ dla nachylenia w dó³): "))
  (if 
    (= (listp pt2) nil)
    (progn
      (setq spadek (atof pt2))
      (setq ucs_angle (cvunit (atan (/ spadek 100)) "radians" "degrees"))
      (setvar "orthomode" 1)
      (setvar "clayer" layerprev)
      (command "_line" 
        pt1
        (progn
          (princ "\n Wska¿ zasiêg linii (w poziomie). ")
          pause
        )
        ""
      )
      
      (if (/= (tblsearch "layer" warwym) nil)
        (setvar "clayer" warwym)          			;ustala akt warstwe na 'wymiary'
      )
      
      (setq entlist (entget (entlast)))
      (setq pt1 (cdr (assoc 10 entlist)))
      (setq pt2 (cdr (assoc 11 entlist)))
      (setq dist (abs (- (car pt2) (car pt1))))
      (setq height (* dist (/ 1 spadek )))    ;to spadek to jest naachylenie
      (setq pt2 (list (car pt2) (+ (cadr pt1) height)))
      (setq entlist
        (subst 
          (cons 11 pt2) 
          (assoc 11 entlist) 
          entlist
        )
      )
      (entmod entlist)
      (entmake (entget (entlast)))
    )
    (progn
      (command "_line" 
        pt1
        pt2
        ""
      )
    )
  )

  (setq pt1 (cdr (assoc 10 (entget (entlast)))))		;pt1 w GUW
  (setq pt1 (trans pt1 0 1))					;;pt1 z GUW do LUW  
  (setq pt2 (cdr (assoc 11 (entget (entlast)))))		;pt2 w GUW
  (setq pt2 (trans pt2 0 1))					;;pt2 z GUW do LUW 
  (command "_erase" (entlast) "")
  
  (setq tan_angle (/ (- (cadr pt2) (cadr pt1)) (- (car pt2) (car pt1))))
  (setq anglerad (atan tan_angle))
  (setq angledeg (cvunit anglerad "radians" "degrees"))   ;kat w stopniach

  (setq nachylenie (abs (/ 1 tan_angle )))                    ;tangens kata = spadek -> 1:XX
  (setq nachylenietxt (strcat "1:" (rtos nachylenie 2 dokl_nachylenia)))		;dokladnosc nachylenia  
  
  ;ustalenie kierunku strzalki
  (setvar "osmode" 0)
  
  (setq temp_selection (ssadd))

  (command "_point" pt1)
  (ssadd (entlast) temp_selection)
  (command "_point" pt2)
  (ssadd (entlast) temp_selection)

  (command "_mtext" 
           '(0 0)
           "_justify" "_mc"
           "_height" (* txta skala) 
           "_rotation" angledeg
           '(0 0)
           nachylenietxt
           ""
  )
  (setvar "orthomode" 0)
(command "_move" (entlast) "" '(0 0) pause)
  
  (setq ostatni_tekst (entlast))
  
  (if (= automatyczne_dodawanie_maski_tla_do_tekstow 1)
    (progn
      (setq entlist (entget ostatni_tekst))
      (setq entlist   
        (append
          entlist
          (list (cons 90 3))       ;dodanie maski 
          (list (cons 63 256))     ;ustawienie maski jak tlo rysuku
          (list (cons 45 rozmiar_maski_w_tekstach))     ;ustawienie rozmiaru maski 1.1        
        )
      )
      (entmod entlist)
    )
  )
    
  (ssadd (entlast) temp_selection)
 ; (setq ent_text (entget(entlast)))

  (generuj_losowa_nazwe "MadziCAD_nachylenie")
  ;(command "_block" losowa_nazwa '(0 0) temp_selection "")
  (command "_group" "_create" losowa_nazwa "MadziCAD" temp_selection "")  ;to madzicad to jest opis grupy

;;;  (defun *error* (errorlevel)
;;;    (setvar "clayer" layerprev)			;zmienia na poprz warstwe
;;;    (setvar "osmode" osmodeprev)
;;;    (setvar "orthomode" orthoprev)
;;;    (command "_purge" "_blocks" losowa_nazwa "_no")
;;;    (princ "\n MadziCAD error: Funkcja przerwana. ")
;;;  )

  (princ (strcat "\n Dok³adna wartoœæ nachylenia 1:" (rtos nachylenie)))  
  
;;;  (command "_insert" losowa_nazwa (progn (princ "\n Wska¿ po³o¿enie opisu: ") pause) 1 1 0)
;;;  (setq insert_pt (cdr (assoc 10 (entget (entlast)))))
;;;  (setq insert_pt_luw (trans insert_pt 0 1))  ; guw->luw
;;;  (entdel (entlast))
;;;  
;;;  (setq ent_text (subst (cons 10 insert_pt) (assoc 10 ent_text) ent_text))
;;;  (entmake ent_text)
;;;  (ssadd (entlast) temp_selection)
  
;;;  (command "_block" losowa_nazwa "_yes" insert_pt_luw temp_selection "")
;;;  (command "_insert" losowa_nazwa insert_pt_luw 1 1 0)
  
  (setvar "osmode" osmodeprev)
  (setvar "orthomode" orthoprev)
  (setvar "clayer" layerprev)			;zmienia na poprz warstwe			
  (princ)
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:utnij_linia(/ layerprev osmodeprev coords trim_edge pkt entlist vertlist n pkt1 pkt2)
  (defun *error* (errorlevel)
    (setvar "clayer" layerprev)
    (setvar "osmode" osmodeprev)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )

  (graphscr)
  (setq layerprev (getvar "clayer"))
  (setq osmodeprev (getvar "osmode"))
  (setq coords nil)
  
  (setvar "clayer" "0")  
  (princ "\n Narysuj polilinie ucinaj¹c¹: ")
  (command "_pline" (getpoint))
  (while (= (logand (getvar "cmdactive") 1) 1)
    (defun *error* (errorlevel)
      (setvar "clayer" layerprev)
      (entdel(entlast))
      (princ "\n MadziCAD error: Funkcja przerwana. ")
    )
    (command pause)
  )

  (setq trim_edge (entlast))

  (setvar "osmode" 0)
  (setq pkt (getpoint "\n Wska¿ od ktorej strony ucinaæ obiekty: "))
  (command "_offset" 0.01 (entlast) pkt "")

  ;lista wierzcholkow polilinii
  (setq entlist (entget (entlast)))
  (setq vertlist (member (assoc 10 entlist) entlist))
  (repeat (cdr (assoc 90 entlist))
    (setq coords (cons (cdar vertlist) coords) vertlist (cddddr vertlist))
  )
  (entdel (entlast))

  ;ucinanie n-1 razy
  (setq n (- (length coords) 1))
  (repeat n
    (setq pkt1 (trans (nth n coords) 0 1))
    (setq pkt2 (trans (nth (- n 1) coords) 0 1))
    (command "_trim" trim_edge "" "_fence" pkt1 pkt2 "" "")  ;dla pewnosci 6 razy:]
    (command "_trim" trim_edge "" "_fence" pkt1 pkt2 "" "")
    (command "_trim" trim_edge "" "_fence" pkt1 pkt2 "" "")
    (command "_trim" trim_edge "" "_fence" pkt1 pkt2 "" "")
    (command "_trim" trim_edge "" "_fence" pkt1 pkt2 "" "")
    (command "_trim" trim_edge "" "_fence" pkt1 pkt2 "" "")
    (setq n (- n 1))
  )
  (setvar "osmode" osmodeprev)
  (setvar "clayer" layerprev)
  (command "_erase" trim_edge "")
  (princ)
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:wydluz_linia(/ layerprev)
  (defun *error* (errorlevel)
    (setvar "clayer" layerprev)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq layerprev (getvar "clayer"))
  (setvar "clayer" "0")
  (princ "\n Narysuj polilinie do ktorej wyd³u¿yæ obiekty lub z [SHIFT] uci¹æ: ")
  (command "_pline" (getpoint))
  (while (= (logand (getvar "cmdactive") 1) 1)
    (command pause)
    (defun *error* (errorlevel)
      (setvar "clayer" layerprev)
      (entdel(entlast))
      (princ "\n MadziCAD error: Funkcja przerwana. ")
    )
  )

  (command "_extend" (entlast) ""
    (while (= (logand (getvar "cmdactive") 1) 1)
      (command pause)
    )
  )  
  (entdel (entlast))
  (setvar "clayer" layerprev)
  (princ)
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun C:wymiar_szeregowy(/ layerprev temp_selection pt1 pt2 begin_pt)
  (defun *error* (errorlevel)
    (command "_layer" "u" layerprev "")			;zmienia na poprz warstwe
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq layerprev (getvar "clayer"))			;zapamietuje biezaca warstwe
  (if (/= (tblsearch "layer" warwym) nil)
    (setvar "clayer" warwym)          			;ustala akt warstwe na 'wymiary'
  )
  (princ "\n Wska¿ wymiar pocz¹tkowy (lub ENTER aby wybraæ pocz¹tkowo utowrzony): ")
  (setq temp_selection (ssget "_:S"))
  
  (if (= temp_selection nil)
    (setq temp_selection (ssget "_L"))
  )
  
  (setq begin_pt (cdr (assoc 10 (entget (ssname temp_selection 0)))))   ;w GUW
  (setq begin_pt (trans begin_pt 0 1))
  (setq pt1 (cdr (assoc 13 (entget (ssname temp_selection 0)))))
  (setq pt1 (trans pt1 0 1))
  (setq pt2 (cdr (assoc 14 (entget (ssname temp_selection 0)))))
  (setq pt2 (trans pt2 0 1))

  (command "_ucs" "_new" "_3" begin_pt pt2 "")
  (command "_ucs" "_z" -90)

  (defun *error* (errorlevel)
    (setvar "clayer" layerprev)			;zmienia na poprz warstwe
    (command "_ucs" "_previous")
    (command "_ucs" "_previous")
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  
  (setq begin_pt (cdr (assoc 10 (entget (ssname temp_selection 0)))))   ;w GUW
  (setq begin_pt (trans begin_pt 0 1))
  (setq pt1 (cdr (assoc 14 (entget (ssname temp_selection 0)))))
  (setq pt1 (trans pt1 0 1))
  
  (command "_dimlinear" 
    pt1
    (getpoint "\n Wska¿ kolejny punkt: " begin_pt)
    begin_pt
  )
  
  (setq begin_pt (cdr (assoc 10 (entget (entlast)))))   ;w GUW
  (setq begin_pt (trans begin_pt 0 1))
  (setq pt1 (cdr (assoc 14 (entget (entlast)))))
  (setq pt1 (trans pt1 0 1))
  (setq pt2 (getpoint "\n Wska¿ kolejny punkt: " begin_pt))
  
  (while (/= pt2 nil) 
    (command "_dimlinear" 
      pt1
      pt2
      begin_pt
    )
    (setq begin_pt (cdr (assoc 10 (entget (entlast)))))   ;w GUW
    (setq begin_pt (trans begin_pt 0 1))
    (setq pt1 (cdr (assoc 14 (entget (entlast)))))
    (setq pt1 (trans pt1 0 1))
    (setq pt2 (getpoint "\n Wska¿ kolejny punkt: " begin_pt))
  )

  (command "_ucs" "_previous")
  (command "_ucs" "_previous")
  (setvar "clayer" layerprev)			;zmienia na poprz warstwe
  (princ )
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:linia_odniesienia(/ layerprev osmodeprev dimclrtprev orthoprev dimaszprev ostatni_tekst new_text entlist)
  (defun *error* (errorlevel)
    (setvar "osmode" osmodeprev)
    (setvar "orthomode" orthoprev)
    (setvar "dimclrt" dimclrtprev)			;kolor tekstu linii odniesienia
    (setvar "clayer" layerprev)			;zmienia na poprz warstwe
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq layerprev (getvar "clayer"))			;zapamietuje biezaca warstwe
  (setq osmodeprev (getvar "osmode"))
  (setq dimclrtprev (getvar "dimclrt"))			;kolor tekstu w stylu wymiarowania
  (setq orthoprev (getvar "orthomode"))
  (setq dimaszprev (getvar "dimasz"))
  (if (/= (tblsearch "layer" warwym) nil)
    (setvar "clayer" warwym)          			;ustala akt warstwe na 'wymiary'
  )
  (setvar "dimclrt" kolor_tekstu_linii_odniesienia)	;kolor tekstu linii odniesienia
  (command "_qleader" 
    (getpoint "\n Wska¿ pierwszy punkt: ")
    (progn 
      (setvar "osmode" 0)
      (setvar "orthomode" 0)
      (princ "\n Wska¿ drugi punkt: ") 
      pause
    )
    ""
    ""
    ""
  )
  
  (setq ostatni_tekst (ssget "_L"))
  
  
;zamiana tekstu na duze litery jesli tak usatawione w pliku ustawienia
  (if (= all_uppercase 1)
    (progn
      (setq entlist (entget (ssname ostatni_tekst 0)))
      (setq new_text (strcase (cdr (assoc 1 entlist))))
      (setq entlist     ;zmiana na duze litery
        (subst 
          (cons 1 new_text) 
          (assoc 1 entlist) 
          entlist
        )
      )
      (entmod entlist)
    )
  )
   
  ;;;;; dodawanie maski 
  (if (= automatyczne_dodawanie_maski_tla_do_tekstow 1)
    (progn
      (setq entlist (entget (ssname ostatni_tekst 0)))
      (setq entlist   
         (append
           entlist
           (list (cons 90 3))       ;dodanie maski 
           (list (cons 63 256))     ;ustawienie maski jak tlo rysuku
           (list (cons 45 rozmiar_maski_w_tekstach))     ;ustawienie rozmiaru maski 1.1        
         )
      )
      (entmod entlist)
    )
  )

  ;;poprawianie podkreslenia
  ;(generuj_losowa_nazwe "linia_odniesienia_")
  ;(command "_group" "_c" losowa_nazwa "" pkt1 (entlast) "")
  
  (setvar "osmode" osmodeprev)
  (setvar "orthomode" orthoprev)
  (setvar "dimclrt" dimclrtprev)      ;kolor tekstu linii odniesienia
  (setvar "clayer" layerprev)         ;zmienia na poprz warstwe
  (princ)
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:zoom_wszystko()
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (command "_regen")
  (command "_zoom" "_all")
  (princ "\n Powiêkszono do granic rysunku. ")
  (princ)
)

;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:zoom_poprzedni()
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (command "_regen")
  (command "_zoom" "_previous")
  (princ "\n Przywrócono poprzedni zoom. ")
  (princ)
)

;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:zoom_okno()
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (command "_regen")
  (command "_zoom" "_window" 
    (progn
      (princ "\n Wska¿ obszar do powiêkszenia: ")
      pause
    )
  )
  (princ)
)

;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:convert_to_uppercase(/ temp_selection n sslist entlist new_text)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (princ "\n Wska¿ tekst lub teksty do zamiany z ma³ych liter na du¿e: ")
  (setq temp_selection (ssget))
  (selection_to_list temp_selection)
  (setq n 0)
  (foreach item sslist 
    (progn 
      (setq entlist (entget item))
      (if (or (= (cdr (assoc 0 entlist)) "TEXT") (= (cdr (assoc 0 entlist)) "MTEXT"))
        (progn
          (setq new_text (strcase(cdr (assoc 1 entlist))))
          (setq entlist
            (subst 
              (cons 1 new_text) 
              (assoc 1 entlist) 
              entlist
            )
          )
        (entmod entlist)
        (setq n (1+ n))
        )
      )
    )
  )
  (princ (strcat " " (rtos n)  " obiekty tekstowe przekonwertowano na du¿e litery. "))
  (princ)
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun C:szybki_blok (/ temp_selection base_pt losowa_nazwa)
  (defun *error* (errorlevel)
    (setvar "osmode" osmodeprev)
    (setvar "orthomode" orthoprev)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq osmodeprev (getvar "osmode"))	;zapamietuje stale tryby lokalizacji
  (setq orthoprev (getvar "orthomode"))	;zapamietuje status orto
  (setvar "orthomode" 0)
  (setvar "osmode" 0)
  (princ "\n Wska¿ obiekty z których utworzyæ blok: ")
  (setq temp_selection (ssget))
  (generuj_losowa_nazwe "MadziCAD_block_temp")

  (while (/= nil (tblsearch "block" losowa_nazwa))
    (generuj_losowa_nazwe "MadziCAD_block_temp")
  )

  (setq
    base_pt (trans (cdr (assoc 10 (entget (ssname temp_selection 0))))
		   0
		   1
	    )
  )
  (command "_block" losowa_nazwa base_pt temp_selection "")
  (command "_insert" losowa_nazwa "_scale" 1 "_rotate" 0 base_pt)
  (princ
    (strcat "\n Utworzono blok o nazwie: " losowa_nazwa ". ")
  )
  (setvar "osmode" osmodeprev)
  (setvar "orthomode" orthoprev)
  (princ)
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun C:szybki_obrot(/ temp_selection base_pt  pt1 angledeg)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (princ "\n Wska¿ obiekty do obrócenia: ")
  (setq temp_selection (ssget))
  (setq base_pt (getpoint "\n Wska¿ punkt bazowy: "))
  (if 
    (= base_pt nil)
    (setq base_pt (cdr (assoc 10 (entget (ssname temp_selection 0)))))
  )
  ;(setq base_pt (cdr (assoc 10 (entget (ssname temp_selection 0)))))
  ;(setq base_angle_rad (atan (/ (- (cadr base_pt) (cadr pkt)) (- (car base_pt) (car pkt)))))
  ;(setq base_angle_deg (cvunit base_angle_rad "radians" "degrees"))
  (initget 137)
  (setq pt1 (getpoint base_pt "\n Wska¿ pierwszy punkt obrotu, lub podaj k¹t obrotu: "))
  (if 
    (= (listp pt1) nil)
    (progn
      (setq angledeg (atof pt1))
      (command "_rotate" temp_selection "" base_pt angledeg) 
    )
    (progn
      (command "_rotate" temp_selection "" base_pt "_reference" base_pt pt1 
      (progn 
        (princ "\n Wska¿ drugi punkt obrotu: ")
        pause
      )
      )
    )
  )
  ;(setq new_base_pt (cdr (assoc 10 (entget (ssname temp_selection 0)))))
  ;(setq new_base_angle_rad (atan (/ (- (cadr new_base_pt) (cadr pkt)) (- (car new_base_pt) (car pkt)))))
  ;(setq new_base_angle_deg (cvunit new_base_angle_rad "radians" "degrees"))
  ;(princ (- new_base_angle_deg base_angle_deg))   ;dokonczyc
  (princ)
)



(defun C:szybki_obrot_z_kopiowaniem(/ temp_selection base_pt  pt1 angledeg)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (princ "\n Wska¿ obiekty do obrócenia: ")
  (setq temp_selection (ssget))
  (setq base_pt (getpoint "\n Wska¿ punkt bazowy: "))
  (if 
    (= base_pt nil)
    (setq base_pt (cdr (assoc 10 (entget (ssname temp_selection 0)))))
  )
  ;(setq base_pt (cdr (assoc 10 (entget (ssname temp_selection 0)))))
  ;(setq base_angle_rad (atan (/ (- (cadr base_pt) (cadr pkt)) (- (car base_pt) (car pkt)))))
  ;(setq base_angle_deg (cvunit base_angle_rad "radians" "degrees"))
  (initget 137)
  (setq pt1 (getpoint base_pt "\n Wska¿ pierwszy punkt obrotu, lub podaj k¹t obrotu: "))
  (if 
    (= (listp pt1) nil)
    (progn
      (setq angledeg (atof pt1))
      (command "_rotate" temp_selection "" base_pt "_copy" angledeg)
      (command "_rotate" temp_selection "" base_pt "_copy" (getreal))       
      (command "_rotate" temp_selection "" base_pt "_copy" (getreal))       
      (command "_rotate" temp_selection "" base_pt "_copy" (getreal))       
      (command "_rotate" temp_selection "" base_pt "_copy" (getreal))       
    )
    
    
    
    ;kopiowanie 5 razy
    (progn
      (command "_rotate" temp_selection "" base_pt "_copy" "_reference" base_pt pt1 
        (progn 
          (princ "\n Wska¿ drugi punkt obrotu: ")
          pause
        )
      )
      (command "_rotate" temp_selection "" base_pt "_copy" "_reference" base_pt pt1 
        (progn 
          (princ "\n Wska¿ drugi punkt obrotu: ")
          pause
        )
      )
      (command "_rotate" temp_selection "" base_pt "_copy" "_reference" base_pt pt1 
        (progn 
          (princ "\n Wska¿ drugi punkt obrotu: ")
          pause
        )
      )
      (command "_rotate" temp_selection "" base_pt "_copy" "_reference" base_pt pt1 
        (progn 
          (princ "\n Wska¿ drugi punkt obrotu: ")
          pause
        )
      )
      (command "_rotate" temp_selection "" base_pt "_copy" "_reference" base_pt pt1 
        (progn 
          (princ "\n Wska¿ drugi punkt obrotu: ")
          pause
        )
      )
    
    
    
    
    
    
    
    )
  )
  ;(setq new_base_pt (cdr (assoc 10 (entget (ssname temp_selection 0)))))
  ;(setq new_base_angle_rad (atan (/ (- (cadr new_base_pt) (cadr pkt)) (- (car new_base_pt) (car pkt)))))
  ;(setq new_base_angle_deg (cvunit new_base_angle_rad "radians" "degrees"))
  ;(princ (- new_base_angle_deg base_angle_deg))   ;dokonczyc
  (C:szybki_obrot_z_kopiowaniem)
  (princ)
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:typowe_kreskowania( / layerprev osmodeprev orthoprev skala kreskowanie rodzaj_kreskowania skala_kreskowania kat_obrotu temp_ent pkt) 
  (defun *error* (errorlevel)
    (setvar "clayer" layerprev)			;zmienia na poprz warstwe
    (setvar "osmode" osmodeprev)
    (setvar "orthomode" orthoprev)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
    (princ)
  )
  (graphscr)
  (setq layerprev (getvar "clayer"))				;zapamietuje biezaca warstwe
  (setq osmodeprev (getvar "osmode"))				;zapamietuje stale tryby lokalizacji
  (setq orthoprev (getvar "orthomode"))			;zapamietuje status orto
  (setq skala (/ (getvar "dimscale") 400))
  (if (/= (tblsearch "layer" warkresk) nil)
    (setvar "clayer" warkresk)          			;ustala akt warstwe na 'kreskowania'
  )
  (setvar "osmode" 0)
  (setvar "orthomode" 0)
  (initget 7 "1 2 3 4 5 6")
  (setq kreskowanie (getkword "\n Wybierz rodzaj kreskowania [1 - Beton, 2 - Chudy beton, 3 - Piasek, 4 - Zwir, 5 - Kamieñ, 6 - Beton]: "))
  (if (= kreskowanie "1") 
      (setq rodzaj_kreskowania "ansi33" 
      skala_kreskowania (* skala 200) 
      kat_obrotu 0))
  (if (= kreskowanie "2") 
      (setq rodzaj_kreskowania "dash" 
      skala_kreskowania (* skala 40)
      kat_obrotu 45))    
  (if (= kreskowanie "3") 
      (setq rodzaj_kreskowania "ar-sand" 
      skala_kreskowania (* skala 5)
      kat_obrotu 0))
  (if (= kreskowanie "4") 
      (setq rodzaj_kreskowania "ar-conc" 
      skala_kreskowania (* skala 5)
      kat_obrotu 0))    
  (if (= kreskowanie "5") 
      (setq rodzaj_kreskowania "gravel" 
      skala_kreskowania (* skala 80)
      kat_obrotu 0))    
  (if (= kreskowanie "6") 
      (setq rodzaj_kreskowania "ansi31" 
      skala_kreskowania (* skala 100)
      kat_obrotu 0))    
      
      
  (command "_boundary" (getpoint "\n Wska¿ punkt w œrodku obszaru do zakreskowania: ") "")
  (setq temp_ent (entlast))
  (command "_hatch" rodzaj_kreskowania skala_kreskowania kat_obrotu (entlast) "")
  (entdel temp_ent)
  (command "_regen")
  (setq pkt (getpoint "\n Wska¿ punkt w kolejnym obszarze lub [Enter] aby zakoñczyæ: "))
  (while (/= pkt nil)
  (command "_hatchedit" (entlast) "d" pkt "")
  (command "_regen")
  (setq pkt (getpoint "\n Wska¿ punkt w kolejnym obszarze lub [Enter] aby zakoñczyæ: "))
  )
  (setvar "clayer" layerprev)			;zmienia na poprz warstwe
  (setvar "osmode" osmodeprev)
  (setvar "orthomode" orthoprev)
  (princ)
)










  ; 
    ; (ssadd (entlast) ss)
    ; (command pause)
  ; )
  ; (selection_to_list ss)
  ; (setq ss2 nil)
  ; (repeat (sslength ss)
    ; (setq ss2 (cons(entget(entlast))ss2))
    ; (entdel (entlast))
  ; )
  ; (setq n 0)
  ; (setq ss3 nil)
  ; (repeat (sslength ss)
    ; (setq ent (nth n ss2))
    ; (entmake ent)
    ; (setq ss3 (cons(entget(entlast))ss3))
    ; (setq n (1+ n))
    ; (princ n)
  ; )
 ; (setq n 0)  
    ; (command "_hatch" "ansi33" 100 0 "y" "n" "d" (foreach item ss3 (progn (nth n ss3)(setq n (1+ n)))))
  
  
  
  ; (setq n 0)
  ; (setq ss (ssadd))
  ; (command "_boundary" (getpoint))
  ; (while (= (logand (getvar "cmdactive") 1) 1)
    ; (ssadd (entlast) ss)
    ; (command pause)
  ; )
  ; (selection_to_list ss)
  ; (setq ss2 nil)
  ; (repeat (sslength ss)
    ; (setq ss2 (cons(entget(entlast))ss2))
    ; (entdel (entlast))
  ; )
  ; (setq n 0)
  ; (setq ss3 nil)
  ; (repeat (sslength ss)
    ; (setq ent (nth n ss2))
    ; (entmake ent)
    ; (setq ss3 (cons(entget(entlast))ss3))
    ; (setq n (1+ n))
    ; (princ n)
  ; )
 ; (setq n 0)  
    ; (command "_hatch" "ansi33" 100 0 "y" "n" "d" (foreach item ss3 (progn (nth n ss3)(setq n (1+ n)))))
  
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:pole_powierzchni (/		  osmodeprev	 orthoprev	boundary_ss
			   hatch_ss	  temp_ss	 kat_kreskowania
			   pkt		  dim1		 dim2		skala_kreskowania
			   boundary_sslist		 hatch_sslist	entlist
			   area
			  )
  (defun *error* (errorlevel)
    (selection_to_list boundary_ss)
    (setq boundary_sslist sslist)
    (selection_to_list hatch_ss)
    (setq hatch_sslist sslist)
    (foreach item boundary_sslist (entdel item))
    (foreach item hatch_sslist (entdel item))
    (setvar "clayer" layerprev)		;zmienia na poprz warstwe
    (setvar "osmode" osmodeprev)
    (setvar "orthomode" orthoprev)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
    (princ)
  )
  (graphscr)
  (setq layerprev (getvar "clayer"))	;zapamietuje biezaca warstwe
  (setq osmodeprev (getvar "osmode"))	;zapamietuje stale tryby lokalizacji
  (setq orthoprev (getvar "orthomode"))	;zapamietuje status orto
  (setvar "clayer" "0")
  (setvar "osmode" 0)
  (setvar "orthomode" 0)

  (setq boundary_ss (ssadd))
  (setq hatch_ss (ssadd))
  (setq temp_ss (ssadd))

  (setq kat_kreskowania 0)		;poczatkowy kat kreskowania zeby przez pomylke nie zanzczyc obszaru dwa razy
  (setq	pkt (getpoint
	      "\n Wskazuj kolejno punkty w obszarach tworz¹cych pole."
	    )
  )

  (while (/= pkt nil)
    (command "_boundary" "_advanced" "_object" "_region" "" "_advanced"	"_island" "_no"	"" "" pkt "")
    (vla-getboundingbox
      (vlax-ename->vla-object
	(cdr (car (entget (entlast))))
      )
      'bbox1
      'bbox2
    )					;narozniki boundingboxa
    (setq dim1 (trans (vlax-safearray->list bbox1) 0 1))
    (setq dim2 (trans (vlax-safearray->list bbox2) 0 1))

    (setq skala_kreskowania
	   (/ (distance dim1 dim2) 100)
    )					;ustalenie skali kreskowania

    (ssadd (entlast) boundary_ss)
    (command "_hatch"
	     "ansi37"
	     skala_kreskowania
	     kat_kreskowania
	     (entlast)
	     ""
    )
					;czerowny
    (ssadd (entlast) hatch_ss)
    (setq pkt (getpoint))
    (setq kat_kreskowania (+ kat_kreskowania 10))
  )

  (selection_to_list hatch_ss)
  (setq hatch_sslist sslist)

  (foreach item hatch_sslist (entdel item))
					; kasowanie pojedynczych kreskowan
  (if (> (sslength boundary_ss) 1)
    (progn (command "_union" boundary_ss "")
	   (setq mass_region (entlast))
    )
    (progn (setq mass_region (ssname boundary_ss 0)))
  )


  (command "_hatch" "ansi37" skala_kreskowania kat_kreskowania mass_region "")


  (setq area (vlax-get (vlax-ename->vla-object mass_region) 'area)) ;powerchnia

  (entdel mass_region)
  (princ
    (strcat
      "\nSuma zakreskowanych obszarów:\t"
      (rtos area 2 2)
      "m2\n"
      "\nDok³adne pole powierzchni zakreskowanych obszarów:\t\n\n\t"
      (rtos (* area 1000000) 2 4)
      " jednostek kwadratowych."
    )
  )
  (alert
    (strcat
      "\nSuma zakreskowanych obszarów:\t"
      (rtos area 2 2)
      "m2\n"
      "\nDok³adne pole powierzchni zakreskowanych obszarów:\t\n\n\t"
      (rtos (* area 1000000) 2 4)
      " jednostek kwadratowych."
    )
  )
  (entdel (entlast))
  (setvar "clayer" layerprev)		;zmienia na poprz warstwe
  (setvar "osmode" osmodeprev)
  (setvar "orthomode" orthoprev)


  (princ)
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:madzicad_przesun() ;/ temp_selection base_pt ent_table sslist n dimension_flag dimension_check target_pt dx dy)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq temp_selection (ssget))
  (setq base_pt (cdr (assoc 10 (entget (ssname temp_selection 0)))))
  (selection_to_list temp_selection)

  (setq n 0)
  (setq ent_table nil)
  (repeat (length sslist)
    (setq ent_table (cons (entget (nth n sslist)) ent_table))
    (setq n (1+ n))
  )
  (setq ent_table (reverse ent_table))
  
  (setq dimension_flag 1) 
  (setq n 0)
  (repeat (length sslist)
    (setq dimension_check (cdr (assoc 0 (entget (nth n sslist)))))
    (if 
      (/= dimension_check "DIMENSION")
      (setq dimension_flag 0)
    )
    (setq n (1+ n))
  )
  
  (command "_move" temp_selection "" 
    (progn
      (getpoint "\n Wska¿ punkt bazowy: ")
      (princ "\n Wska¿ punkt docelowy: ")
    )
    pause
  )
  
  (setq n 0)
  (if 
    (= dimension_flag 1)  ;jesli sa wymiary:
    (progn
      (foreach item sslist
        (progn
          (if (= (cdr (assoc 100 (reverse (entget item)))) "AcDbOrdinateDimension")
            (progn
              (setq entlist (entget item))
              (setq entlist
                (subst 
                (cons 10 (cdr (assoc 10 (nth n ent_table))))
                (assoc 10 entlist) 
                entlist)
              )
              (entmod entlist)
              (setq n (1+ n))
            )
          )
          (if (or 
                (= (cdr (assoc 100 (reverse (entget item)))) "AcDbRotatedDimension")
                (= (cdr (assoc 100 (reverse (entget item)))) "AcDbAlignedDimension")
              )
            (progn
              (setq entlist (entget item))
              (setq entlist
                (subst 
                (cons 13 (cdr (assoc 13 (nth n ent_table))))
                (assoc 13 entlist) 
                entlist)
              )
              (setq entlist
                (subst 
                (cons 14 (cdr (assoc 14 (nth n ent_table))))
                (assoc 14 entlist) 
                entlist)
              )
              (entmod entlist)
              (setq n (1+ n))
            )
          )
        )
      )
    )
  )

  (setq target_pt (cdr (assoc 10 (entget (ssname temp_selection 0)))))
  (setq dx (- (car target_pt) (car base_pt)))
  (setq dy (- (cadr target_pt) (cadr base_pt)))
  (princ (strcat " \n Przesuniêto obiekty o " (rtos dx) " jednostek w kierunku X, i o " (rtos dy) " jednostek w kierunku Y. "))
  (princ)
)



(defun c:ssssssssss(/ temp_selection base_pt target_pt dx dy)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq temp_selection (ssget))
  (setq base_pt (cdr (assoc 10 (entget (ssname temp_selection 0)))))
  (command "_move" temp_selection "" 
  (progn
    (getpoint "\n Wska¿ punkt bazowy: ")
    (princ "\n Wska¿ punkt docelowy: ")
  )
  pause) 
  (setq new_base_pt (cdr (assoc 10 (entget (ssname temp_selection 0)))))
  (setq dx (abs (- (car base_pt) (car new_base_pt))))
  (setq dy (abs (- (cadr base_pt) (cadr new_base_pt))))
  (princ (strcat " \n Przesuniêto obiekty o " (rtos dx) " jednostek w kierunku X, i o " (rtos dy) " jednostek w kierunku Y. "))
  (princ)
)

;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:linie_niewidoczne(/ layerprev)
  (defun *error* (errorlevel)
    (setvar "clayer" layerprev)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq layerprev (getvar "clayer"))			;zapamietuje biezaca warstwe
  (setvar "clayer" warstwanr5)
  (princ "\n Narysuj linie niewidoczn¹: ")
  (command "_pline")
  (while (= (logand (getvar "cmdactive") 1) 1)
    (princ "\n Wska¿ kolejny punkt lub zakoñcz. ")
    (command pause)
  )
  (setvar "clayer" layerprev)
  (princ)
)


;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:linie_osie(/ layerprev)
  (defun *error* (errorlevel)
    (setvar "clayer" layerprev)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq layerprev (getvar "clayer"))    ;zapamietuje biezaca warstwe
  (setvar "clayer" warstwanr6)
  (princ "\n Narysuj oœ: ")
  (command "_pline")
  (while (= (logand (getvar "cmdactive") 1) 1)
    (princ "\n Wska¿ kolejny punkt lub zakoñcz. ")
    (command pause)
  )
  (setvar "clayer" layerprev)
  (princ)
)


;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:dopasuj_baze_wspolrzednych(/ temp_selection n base_pt wlasciwosc sslist entlist dimordinate_flag item)
  (princ "\n Wybierz rzêdne których bazy maj¹ zostaæ dopasowane: ")
  (setq temp_selection (ssget))
  (selection_to_list temp_selection)
  ;(setq base_pt (getpoint "\n Wska¿ punkt który ma zostac baz¹ wybranych wspó³rzêdnych: "))
  (setq base_pt '(0 0))
  (setq base_pt (trans base_pt 1 0))
  (setq n 0 )
  (foreach item sslist
    (progn
      (setq entlist (entget item))
      (setq dimordinate_flag (cdr (assoc 100 (reverse entlist))))
      (if 
        (= dimordinate_flag "AcDbOrdinateDimension")
        (progn
          (setq n (1+ n))
          (setq entlist
            (subst 
            (cons 10 base_pt) 
            (assoc 10 entlist) 
            entlist)
          )
          (entmod entlist)
        )
      )
    )
  )
  (princ (strcat "\n Uaktualniono bazy " (itoa n) " wspó³rzêdnych. "))
  (princ)
)



(defun c:dopasuj_baze_wspolrzednych_nr_1(/ osmodeprev pkt entpt temp_selection n base_pt wlasciwosc sslist entlist dimordinate_flag item)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)

  (princ "\n Wybierz rzêdne których bazy maj¹ zostaæ dopasowane do bazy NR 1: ")
  (setq temp_selection (ssget))  
  ;(setq base_pt (getpoint "\n Wska¿ punkt który ma zostac baz¹ wybranych wspó³rzêdnych: "))
  
  (setq osmodeprev (getvar "osmode"))
  
  (if (= (ssget "_X" '((0 . "INSERT")(2 . "BAZA WSPOLRZEDNYCH NR 1"))) nil)
    (progn
      (alert "ni ma")
      (quit)
    )
    (setq entpt (entget (ssname (ssget "_X" '((0 . "INSERT")(2 . "BAZA WSPOLRZEDNYCH NR 1"))) 0)))
  )
  
  (setq pkt (cdr (assoc 10 entpt)))
  (setq pkt (trans pkt 0 1))					;;pt2 z GUW do LUW 
  
  (setvar "osmode" 0)
  (command "_ucs" "_new" pkt)

  (setq pkt (cdr (assoc 10 entpt)))
  (princ (strcat "\n Ustawiono LUW w punkcie: (" (rtos(car pkt)) ", " (rtos(cadr pkt)) ", " (rtos(caddr pkt)) ") w [GUW]."))    
  
  (setvar "osmode" osmodeprev)
 
  (if (/= temp_selection nil)
    (progn 
      (selection_to_list temp_selection)
     
      (setq base_pt pkt)
      ;(setq base_pt (trans base_pt 1 0))
      (setq n 0 )
      (foreach item sslist
        (progn
          (setq entlist (entget item))
          (setq dimordinate_flag (cdr (assoc 100 (reverse entlist))))
          (if 
            (= dimordinate_flag "AcDbOrdinateDimension")
            (progn
              (setq n (1+ n))
              (setq entlist
                (subst 
                (cons 10 base_pt) 
                (assoc 10 entlist) 
                entlist)
              )
              (entmod entlist)
            )
          )
        )
      )
      (princ (strcat "\n Uaktualniono bazy " (itoa n) " wspó³rzêdnych. "))
    )
  )
  (princ)
)


(defun c:dopasuj_baze_wspolrzednych_nr_2(/ osmodeprev pkt entpt temp_selection n base_pt wlasciwosc sslist entlist dimordinate_flag item)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)

  (princ "\n Wybierz rzêdne których bazy maj¹ zostaæ dopasowane do bazy NR 2: ")
  (setq temp_selection (ssget))  
  ;(setq base_pt (getpoint "\n Wska¿ punkt który ma zostac baz¹ wybranych wspó³rzêdnych: "))
  
  (setq osmodeprev (getvar "osmode"))
  
  (if (= (ssget "_X" '((0 . "INSERT")(2 . "BAZA WSPOLRZEDNYCH NR 2"))) nil)
    (progn
      (alert "ni ma")
      (quit)
    )
    (setq entpt (entget (ssname (ssget "_X" '((0 . "INSERT")(2 . "BAZA WSPOLRZEDNYCH NR 2"))) 0)))
  )
  
  (setq pkt (cdr (assoc 10 entpt)))
  (setq pkt (trans pkt 0 1))					;;pt2 z GUW do LUW 
  
  (setvar "osmode" 0)
  (command "_ucs" "_new" pkt)

  (setq pkt (cdr (assoc 10 entpt)))
  (princ (strcat "\n Ustawiono LUW w punkcie: (" (rtos(car pkt)) ", " (rtos(cadr pkt)) ", " (rtos(caddr pkt)) ") w [GUW]."))    
  
  (setvar "osmode" osmodeprev)
 
  (if (/= temp_selection nil)
    (progn 
      (selection_to_list temp_selection)
     
      (setq base_pt pkt)
      ;(setq base_pt (trans base_pt 1 0))
      (setq n 0 )
      (foreach item sslist
        (progn
          (setq entlist (entget item))
          (setq dimordinate_flag (cdr (assoc 100 (reverse entlist))))
          (if 
            (= dimordinate_flag "AcDbOrdinateDimension")
            (progn
              (setq n (1+ n))
              (setq entlist
                (subst 
                (cons 10 base_pt) 
                (assoc 10 entlist) 
                entlist)
              )
              (entmod entlist)
            )
          )
        )
      )
      (princ (strcat "\n Uaktualniono bazy " (itoa n) " wspó³rzêdnych. "))
    )
  )
  (princ)
)


(defun c:dopasuj_baze_wspolrzednych_nr_3(/ osmodeprev pkt entpt temp_selection n base_pt wlasciwosc sslist entlist dimordinate_flag item)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)

  (princ "\n Wybierz rzêdne których bazy maj¹ zostaæ dopasowane do bazy NR 3: ")
  (setq temp_selection (ssget))  
  ;(setq base_pt (getpoint "\n Wska¿ punkt który ma zostac baz¹ wybranych wspó³rzêdnych: "))
  
  (setq osmodeprev (getvar "osmode"))
  
  (if (= (ssget "_X" '((0 . "INSERT")(2 . "BAZA WSPOLRZEDNYCH NR 3"))) nil)
    (progn
      (alert "ni ma")
      (quit)
    )
    (setq entpt (entget (ssname (ssget "_X" '((0 . "INSERT")(2 . "BAZA WSPOLRZEDNYCH NR 3"))) 0)))
  )
  
  (setq pkt (cdr (assoc 10 entpt)))
  (setq pkt (trans pkt 0 1))					;;pt2 z GUW do LUW 
  
  (setvar "osmode" 0)
  (command "_ucs" "_new" pkt)

  (setq pkt (cdr (assoc 10 entpt)))
  (princ (strcat "\n Ustawiono LUW w punkcie: (" (rtos(car pkt)) ", " (rtos(cadr pkt)) ", " (rtos(caddr pkt)) ") w [GUW]."))    
  
  (setvar "osmode" osmodeprev)
 
  (if (/= temp_selection nil)
    (progn 
      (selection_to_list temp_selection)
     
      (setq base_pt pkt)
      ;(setq base_pt (trans base_pt 1 0))
      (setq n 0 )
      (foreach item sslist
        (progn
          (setq entlist (entget item))
          (setq dimordinate_flag (cdr (assoc 100 (reverse entlist))))
          (if 
            (= dimordinate_flag "AcDbOrdinateDimension")
            (progn
              (setq n (1+ n))
              (setq entlist
                (subst 
                (cons 10 base_pt) 
                (assoc 10 entlist) 
                entlist)
              )
              (entmod entlist)
            )
          )
        )
      )
      (princ (strcat "\n Uaktualniono bazy " (itoa n) " wspó³rzêdnych. "))
    )
  )
  (princ)
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun C:szybkie_lustro_z_kasowaniem_oryginalow	(/ temp_selection)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (princ
    "\n Wska¿ obiekty z których utworzyæ lustrzane odbicie: "
  )
  (setq temp_selection (ssget))
  (command "_mirror" temp_selection "" pause pause "_yes")
  (princ (strcat "\n Odbito "
		 (rtos (sslength temp_selection))
		 " obiektów, i wykasowano orygina³y. "
	 )
  )
  (princ)
)
(defun C:szybkie_lustro_bez_kasowania_oryginalow (/ temp_selection)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (princ
    "\n Wska¿ obiekty z których utworzyæ lustrzane odbicie: "
  )
  (setq temp_selection (ssget))
  (command "_mirror" temp_selection "" pause pause "_no")
  (princ (strcat "\n Odbito "
		 (rtos (sslength temp_selection))
		 " obiektów bez kasowania orygina³ów. "
	 )
  )
  (princ)
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:wybierz_obiekty_na_warstwie(/ temp_selection sslist filtered_selection layer)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (princ "\n Wska¿ obiekt na warstwie: ")
  (setq temp_selection (ssget "_:S"))
  (setq layer (cdr (assoc 8 (entget (ssname temp_selection 0)))))
  (princ "\n Zaznacz obszar do przefiltrowania: ")
  (setq temp_selection (ssget))
  (selection_to_list temp_selection)
  (setq filtered_selection (ssadd)) 
  (foreach item sslist
    (setq object_layer (cdr (assoc 8 (entget item))))
    (if 
      (= object_layer layer)
      (ssadd item filtered_selection)
    )
  )
  (sssetfirst nil filtered_selection)
  (princ (strcat "\n Zaznaczono " (itoa (sslength filtered_selection)) " obiektów na warstwie \"" layer "\". "))
  (princ)
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun C:Szybka_skala()
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (princ "\n Wska¿ obiekty do przeskalowania: ")
  (setq temp_selection (ssget))
  (setq base_pt (getpoint "\n Wska¿ punkt bazowy: "))
  (if 
    (= base_pt nil)
    (setq base_pt (cdr (assoc 10 (entget (ssname temp_selection 0)))))
  )
  ;(setq base_pt (cdr (assoc 10 (entget (ssname temp_selection 0)))))
  ;(setq base_angle_rad (atan (/ (- (cadr base_pt) (cadr pkt)) (- (car base_pt) (car pkt)))))
  ;(setq base_angle_deg (cvunit base_angle_rad "radians" "degrees"))
  
  
  (initget 137)
  (setq pt1 (getpoint base_pt "\n Wska¿ pierwszy punkt odniesienia, lub podaj skalê: "))
  (if 
    (= (listp pt1) nil)
    (progn
      (setq angledeg (atof pt1))
      (command "_scale" temp_selection "" base_pt angledeg) 
    )
    (progn
      (command "_scale" temp_selection "" base_pt "_reference" base_pt pt1 
        (progn 
          (princ "\n Wska¿ drugi punkt odniesienia: ")
          pause
        )
      )  
    )
  )
  ;(setq new_base_pt (cdr (assoc 10 (entget (ssname temp_selection 0)))))
  ;(setq new_base_angle_rad (atan (/ (- (cadr new_base_pt) (cadr pkt)) (- (car new_base_pt) (car pkt)))))
  ;(setq new_base_angle_deg (cvunit new_base_angle_rad "radians" "degrees"))
  ;(princ (- new_base_angle_deg base_angle_deg))   ;dokonczyc
  (princ)
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:polacz_polilinie(/ peditacceptprev temp_selection)
  (defun *error* (errorlevel)
    (setvar "peditaccept" peditacceptprev)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (setq peditacceptprev (getvar "peditaccept"))
  (setvar "peditaccept" 1)
  
  (princ "\n Wybierz Ÿród³ow¹ poliliniê/liniê/³uk (lub polilinie/linie/³uki do po³¹czenia): ")
  (setq temp_selection (ssget))
  (if (= (sslength temp_selection) 1) 
    (progn
      (princ "\n Wybierz pozosta³e polilinie: ")
      (command "_pedit" temp_selection "_join" (ssget) "" "")
      (princ (strcat "\nPo³¹czono " (itoa (+ (sslength (ssget "_p")) 1)) " obiektów. "))
      (sslength (ssget "_p"))
    )
    (progn
      (command "_pedit" "_multiple" temp_selection "" "_join" "" "")
      (princ (strcat "\nPo³¹czono " (itoa (sslength temp_selection)) " obiektów. "))
    )
  )
  
  (setvar "peditaccept" peditacceptprev)
  (princ)
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun zmiana_stylu_wymiarowania (nazwa)
  (graphscr)  
  (command "dimstyle" "_restore" nazwa)
  (princ (strcat "\n Aktualny styl wymiarowania: " nazwa "."))
)
  
(defun c:styl_wymiarowania_1()
  (zmiana_stylu_wymiarowania nazwa_stylu_wymiarowania_1)
  (princ)
)

(defun c:styl_wymiarowania_2()
  (zmiana_stylu_wymiarowania nazwa_stylu_wymiarowania_2)
  (princ)
)

(defun c:styl_wymiarowania_3()
  (zmiana_stylu_wymiarowania nazwa_stylu_wymiarowania_3)
  (princ)
)

(defun c:styl_wymiarowania_4()
  (zmiana_stylu_wymiarowania nazwa_stylu_wymiarowania_4)
  (princ)
)

(defun c:styl_wymiarowania_5()
  (zmiana_stylu_wymiarowania nazwa_stylu_wymiarowania_5)
  (princ)
)

(defun c:styl_wymiarowania_6()
  (zmiana_stylu_wymiarowania nazwa_stylu_wymiarowania_6)
  (princ)
)

(defun c:styl_wymiarowania_7()
  (zmiana_stylu_wymiarowania nazwa_stylu_wymiarowania_7)
  (princ)
)

(defun c:styl_wymiarowania_8()
  (zmiana_stylu_wymiarowania nazwa_stylu_wymiarowania_8)
  (princ)
)

(defun c:styl_wymiarowania_9()
  (zmiana_stylu_wymiarowania nazwa_stylu_wymiarowania_9)
  (princ)
)

(defun c:styl_wymiarowania_0()
  (zmiana_stylu_wymiarowania nazwa_stylu_wymiarowania_0)
  (princ)
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:wymiar_katowy(/ layerprev pkt1 pkt2)
  (defun *error* (errorlevel)
    (setvar "clayer" layerprev)			;zmienia na poprz warstwe
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq layerprev (getvar "clayer"))			;zapamietuje biezaca warstwe
  (if (/= (tblsearch "layer" warwym) nil)
    (setvar "clayer" warwym)          			;ustala akt warstwe na 'wymiary'
  )
  (command "_dimangular" 
    pause
    pause
;    (progn
;      (princ "\n Wska¿ punkt wstawienia wymiaru (ENTER - kontynuacja poprzedniego wymiaru): ")
;      pause
;    )
  )
  (setvar "clayer" layerprev)			;zmienia na poprz warstwe
  (princ)
)

;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:regen_wszystko (/ )
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (command "_regenall")
  
;ustawianie danych do repair
  (setvar "cecolor" "256")                    ;kolor 256=jak warstwa 
  (setvar "celtscale" 1)                   ;skala rodzaju linii obiektu 1=1
  (setvar "celtype" "bylayer")              ;rodzaj linii
  (setvar "celweight" -1)                   ;szerokosc linii "-1" -> jak warstwa
  (setvar "osmode" user_osmode)
  ;styl tekstu 
  (if (/= (tblsearch "style" madzicad_text_style) nil)
    (setvar "textstyle" madzicad_text_style)
  )
  (princ (strcat "\n Zregenerowano rysunek i ustawiono: kolor, szerokoœæ, i rodzaj linii => Jak Warstwa. Aktualny styl tekstu '" (getvar "textstyle") "'."))
  (princ)
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:polprosta(/ pt1 pt2 layerprev osmodeprev)
  (defun *error* (errorlevel)
    (setvar "clayer" layerprev)			;zmienia na poprz warstwe
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (setq layerprev (getvar "clayer"))			;zapamietuje biezaca warstwe
  (setq osmodeprev (getvar "osmode"))
  (setvar "clayer" "0")       ;czemuw 2005 nie ma warstwy "defponits" to nei wiem:]
  (setq pt1 (getpoint "\n Wska¿ pocz¹tek pó³prostej:"))
  (defun *error* (errorlevel)
    (setvar "clayer" layerprev)			;zmienia na poprz warstwe
    (setvar "osmode" osmodeprev)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (setvar "osmode" 0)
  (setq pt2 (getpoint "\n Wska¿ kierunek pó³prostej:" pt1))
  (command "_ray" pt1 pt2 "")
  (setvar "clayer" layerprev)			;zmienia na poprz warstwe
  (setvar "osmode" osmodeprev)
  (princ)
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:madzicad_distance (/ pk1 pk2 delta_x delta_y delta_z message angledeg)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq pk1 (getpoint "\n Wska¿ pierwszy punkt:"))
  (setq pk2 (getpoint "\n Wska¿ drugi punkt:" pk1))
  ;(setq dist (distance pk1 pk2))
  (setq distcoords (mapcar '- pk1 pk2))
  (setq dist (sqrt (+ (expt (car distcoords) 2) (expt (cadr distcoords) 2))))
  (setq angledeg (cvunit (angle pk1 pk2) "radians" "degrees")) 
  
  (setq delta_x (abs (- (car pk1) (car pk2))))
  (setq delta_y (abs (- (cadr pk1) (cadr pk2))))
  (setq delta_z (abs (- (caddr pk1) (caddr pk2))))
  
  (setq message (strcat 
                        "\n Odleg³oœæ: \t\t" (rtos dist) "\t jednostek,\t" (rtos (/ dist 1000)) "\t [m]."
                        "\n K¹t w p³aszczyŸnie XY: \t" (rtos angledeg) "\t stopni.\t(" (rtos (- angledeg 360)) " stopni).\n"
                        "\n Delta X: \t\t" (rtos delta_x) "\t jednostek,\t\t" (rtos (/ delta_x 1000)) "\t [m].\t"
                        "\n Delta Y: \t\t" (rtos delta_y) "\t jednostek,\t\t" (rtos (/ delta_y 1000)) "\t [m].\t"
                        "\n Delta Z: \t\t" (rtos delta_z) "\t jednostek,\t\t" (rtos (/ delta_z 1000)) "\t [m].\t"))
  ;(alert message)
  (princ message)
  (message_text message "w")
  (startapp (strcat path "\\support\\madzicad_message_box.exe"))
  (princ)
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:dwusieczna(/ layerprev pt1 pt2 pt3 pt4 pr11 pr12 pr21 pr22 elst ename pt preparam postparam intersectionpt dist1 dist2 angle2 midangle)
  (defun *error* (errorlevel)
    (setvar "clayer" layerprev)
    (command "_ucs" "_previous")
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq layerprev (getvar "clayer"))
  (setvar "clayer" "0")

  (command "_ucs" "_world")

  (setq elst (nentsel "\n Wska¿ pierwsze ramiê k¹ta: "))
  (setq ename (car elst))
  (setq pt (cadr elst))
  (setq pt (vlax-curve-getClosestPointTo ename pt))
  (setq param (vlax-curve-getParamAtPoint ename pt))
  (setq preparam (fix param))
  (setq postparam (1+ preparam))
  (setq pt1 (vlax-curve-getPointAtParam ename preparam))
  (setq pt2 (vlax-curve-getPointAtParam ename postparam))
  
  (if (= (cdr (assoc 0 (entget (car elst)))) "LINE")
    (progn 
      (setq pt1 (cdr (assoc 10 (entget (car elst)))))
      (setq pt2 (cdr (assoc 11 (entget (car elst)))))
    )
  )
  
  
  (setq elst (nentsel "\n Wska¿ drugie ramiê k¹ta: "))
  (setq ename (car elst))
  (setq pt (cadr elst))
  (setq pt (vlax-curve-getClosestPointTo ename pt))
  (setq param (vlax-curve-getParamAtPoint ename pt))
  (setq preparam (fix param))
  (setq postparam (1+ preparam))
  (setq pt3 (vlax-curve-getPointAtParam ename preparam))
  (setq pt4 (vlax-curve-getPointAtParam ename postparam))
  
    (if (= (cdr (assoc 0 (entget (car elst)))) "LINE")
    (progn 
      (setq pt3 (cdr (assoc 10 (entget (car elst)))))
      (setq pt4 (cdr (assoc 11 (entget (car elst)))))
    )
  )
  
  
  (setq intersectionpt (inters pt1 pt2 pt3 pt4 nil)) ;punkt przeciecia 
  
  (setq pt1 (trans pt1 0 1))
  (setq pt2 (trans pt2 0 1))  ;z  G do L  
  (setq pt3 (trans pt3 0 1))
  (setq pt4 (trans pt4 0 1))  
  (setq intersectionpt (trans intersectionpt 0 1))
  
  
  (setq dist1 (distance intersectionpt pt1))
  (setq dist2 (distance intersectionpt pt2))
  
  (if (< dist1 dist2)
    (progn
      (setq pr11 pt1)
      (setq pr12 pt2)
    )
    (progn
      (setq pr11 pt2)
      (setq pr12 pt1)
    )
  )
  
  (setq dist1 (distance intersectionpt pt3))
  (setq dist2 (distance intersectionpt pt4))
  
  (if (< dist1 dist2)
    (progn
      (setq pr21 pt3)
      (setq pr22 pt4)
    )
    (progn
      (setq pr21 pt4)
      (setq pr22 pt3)
    )
  )
  
  (command "_ucs" "_new" "3" pr11 pr12 pr22)
  
  (setq pr11 (trans pr11 0 1))
  (setq pr12 (trans pr12 0 1))  
  (setq pr21 (trans pr21 0 1)) ;z G do L
  (setq pr22 (trans pr22 0 1))  
  (setq intersectionpt (trans intersectionpt 0 1))
  
  (setq angle2 (angle intersectionpt pr22))
  
  (setq midangle (cvunit (/ angle2 2) "radians" "degrees"))
  
  (command "_ray" intersectionpt pr12 "")
  (command "_rotate" (entlast) "" intersectionpt midangle)
  
  (command "_ucs" "_previous")
  (command "_ucs" "_previous")
  (setvar "clayer" layerprev)
  (princ)
)




;=================================
;skarpa
;=================================

(defun c:madzicad_skarpa_z_krawedzi() ;(/ layerprev pt1 pt2 pt3 pt4 pr11 pr12 pr21 pr22 elst ename pt preparam postparam intersectionpt dist1 dist2 angle2 midangle)
  (defun *error* (errorlevel)
    (setvar "clayer" layerprev)
    (command "_ucs" "_previous")
    (setvar "osmode" osmodeprev)
    (setvar "orthomode" orthoprev)  
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq layerprev (getvar "clayer"))
  (setvar "clayer" warkresk)
  (setq osmodeprev (getvar "osmode"))       ;zapamietuje stale tryby lokalizacji
  (setq orthoprev (getvar "orthomode"))     ;zapamietuje status orto
  (setvar "osmode" 0)
  (setvar "orthomode" 0)
  (setq kreskowanie_skarpy (ssadd))

  (command "_ucs" "_world")
  
  (setq elst (nentsel "\n Wska¿ górn¹ krawêdŸ skarpy: "))
  
  ;jesli luk
  (if (= (cdr (assoc 0 (entget (car elst)))) "ARC")
    (progn 
      (setq kindofslope "slopearc")
      (setq arc_center1 (cdr (assoc 10 (entget (car elst))))) ;srodek luku
      (setq arc_radius1 (cdr (assoc 40 (entget (car elst))))) ;promien luku
      (setq angle1 (cvunit (cdr (assoc 50 (entget (car elst)))) "radians" "degrees")) ;poczatkowy kat
      (setq angle2 (cvunit (cdr (assoc 51 (entget (car elst)))) "radians" "degrees")) ;poczatkowy kat

      (command "_ucs" "_new" arc_center1)
      (setq arc_center1 (trans arc_center1 0 1))
      (command "_line" arc_center1 (list arc_radius1 0) "")
      (command "_rotate" (entlast) "" arc_center1 angle1)
      (setq pt1 (cdr (assoc 11 (entget (entlast)))))
      (entdel(entlast))
      
      (command "_line" arc_center1 (list arc_radius1 0) "")
      (command "_rotate" (entlast) "" arc_center1 angle2)
      (setq pt2 (cdr (assoc 11 (entget (entlast)))))
      (entdel(entlast))
      
      (setq arc_center1 (trans arc_center1 1 0))
      (command "_ucs" "_previous")
    )
  )
    
    ;jesli polilinia
  (if (= (cdr (assoc 0 (entget (car elst)))) "LWPOLYLINE")
    (progn
      (setq kindofslope "slopeline")
      (setq ename (car elst))
      (setq pt (cadr elst))
      (setq pt (vlax-curve-getClosestPointTo ename pt))
      (setq param (vlax-curve-getParamAtPoint ename pt))
      (setq preparam (fix param))
      (setq postparam (1+ preparam))
      (setq pt1 (vlax-curve-getPointAtParam ename preparam))
      (setq pt2 (vlax-curve-getPointAtParam ename postparam))
    )
  )
  
  ;jelsi linia
  (if (= (cdr (assoc 0 (entget (car elst)))) "LINE")
    (progn 
      (setq kindofslope "slopeline")
      (setq pt1 (cdr (assoc 10 (entget (car elst)))))
      (setq pt2 (cdr (assoc 11 (entget (car elst)))))
    )
  )

  
  (setq elst (nentsel "\n Wska¿ doln¹ krawêdŸ skarpy: "))
  
    ;jesli luk
  (if (= (cdr (assoc 0 (entget (car elst)))) "ARC")
    (progn 
      (setq arc_center2 (cdr (assoc 10 (entget (car elst))))) ;srodek luku
      (setq arc_radius2 (cdr (assoc 40 (entget (car elst))))) ;promien luku
      (setq angle3 (cvunit (cdr (assoc 50 (entget (car elst)))) "radians" "degrees")) ;poczatkowy kat
      (setq engle4 (cvunit (cdr (assoc 51 (entget (car elst)))) "radians" "degrees")) ;poczatkowy kat

      (command "_ucs" "_new" arc_center2)
      (setq arc_center2 (trans arc_center2 0 1))
      (command "_line" arc_center2 (list arc_radius2 0) "")
      (command "_rotate" (entlast) "" arc_center2 angle3)
      (setq pt3 (cdr (assoc 11 (entget (entlast)))))
      (entdel(entlast))
      
      (command "_line" arc_center2 (list arc_radius2 0) "")
      (command "_rotate" (entlast) "" arc_center2 angle4)
      (setq pt4 (cdr (assoc 11 (entget (entlast)))))
      (entdel(entlast))
      
      (setq arc_center2 (trans arc_center2 1 0))
      (command "_ucs" "_previous")
    )
  )
  
  ;jesli polinia
  (if (= (cdr (assoc 0 (entget (car elst)))) "LWPOLYLINE")
    (progn
      (setq ename (car elst))
      (setq pt (cadr elst))
      (setq pt (vlax-curve-getClosestPointTo ename pt))
      (setq param (vlax-curve-getParamAtPoint ename pt))
      (setq preparam (fix param))
      (setq postparam (1+ preparam))
      (setq pt3 (vlax-curve-getPointAtParam ename preparam))
      (setq pt4 (vlax-curve-getPointAtParam ename postparam))
    )
  )
      
      ;jesli linia
  (if (= (cdr (assoc 0 (entget (car elst)))) "LINE")
    (progn 
      (setq pt3 (cdr (assoc 10 (entget (car elst)))))
      (setq pt4 (cdr (assoc 11 (entget (car elst)))))
    )
  )

  (if (= kindofslope "slopeline")  ;tzn ze elelmnt liniowy linia labo polilinia
    (progn
      (setq intersectionpt (inters pt1 pt2 pt3 pt4 nil)) ;punkt przeciecia 
      (if (= intersectionpt nil)
        (setq intersectionpt pt1)
      )

      (setq dist1 (distance intersectionpt pt1))
      (setq dist2 (distance intersectionpt pt2))
      
      (if (< dist1 dist2)
        (progn
          (setq pr11 pt1)
          (setq pr12 pt2)
        )
        (progn
          (setq pr11 pt2)
          (setq pr12 pt1)
        )
      )
      
      (setq dist1 (distance intersectionpt pt3))
      (setq dist2 (distance intersectionpt pt4))
      
      (if (< dist1 dist2)
        (progn
          (setq pr21 pt3)
          (setq pr22 pt4)
        )
        (progn
          (setq pr21 pt4)
          (setq pr22 pt3)
        )
      )
      
      
      (command "_ucs" "n" "3" pr11 pr12 pr22)
      
      (setq pr11 (trans pr11 0 1)) ; z G do L
      (setq pr12 (trans pr12 0 1))
      (setq pr21 (trans pr21 0 1))
      (setq pr22 (trans pr22 0 1))
      (setq intersectionpt (trans intersectionpt 0 1))
      
            ;rysowanie krotkiej kreski
      (setq rozstaw (* (getvar "dimscale") 10)) ;rozstaw kresek malych i duzych tzn duza kreska co 2*rozstaw
      (setq kreska (* (* (getvar "dimscale") 10) 1))
      (setq slope_length (- (distance pr11 pr12) kreska))
      (setq nn (+ (fix (/ slope_length (* rozstaw 2))) 1))
      
      (repeat nn
        (setq pt1 (list kreska 0))
        (setq pt2 (list kreska 100))
        (setq pt2 (inters pt1 pt2 pr21 pr22 nil)) ;punkt przeciecia 
        (command "_pline" pt1 pt2 "")
        (command "_scale" (entlast) "" pt1 0.55) ; tutaj 0.6 to skala kreski 
        (ssadd (entlast) kreskowanie_skarpy)
        ;(setq pt2 (inters (getpoint)(getpoint)(getpoint)(getpoint) nil) 
        (setq kreska (+ kreska (* rozstaw 2)))
      )
      
      ;rysowanie dlugiej kreski
      (setq kreska (* (* (getvar "dimscale") 10) 2))
      (setq slope_length (- (distance pr11 pr12) kreska))
      (setq nn (+ (fix (/ slope_length (* rozstaw 2))) 1))
      
      (repeat nn
        (setq pt1 (list kreska 0))
        (setq pt2 (list kreska 100))
        (setq pt2 (inters pt1 pt2 pr21 pr22 nil)) ;punkt przeciecia 
        (command "_pline" pt1 pt2 "")
        (command "_scale" (entlast) "" pt1 0.85) ; tutaj 0.6 to skala kreski 
        (ssadd (entlast) kreskowanie_skarpy)
        ;(setq pt2 (inters (getpoint)(getpoint)(getpoint)(getpoint) nil) 
        (setq kreska (+ kreska (* rozstaw 2)))
      )
    )
  )
  
  (if (= kindofslope "slopearc")      ;tzn ze luk
    (progn
      (setq rozstaw 5) ;rozstaw w stopniach
      (command "_ucs" "_new" arc_center1)
      (setq arc_center1 (trans arc_center1 0 1))
      (command "_pline" (list arc_radius1 0) (list (+ arc_radius1 arc_radius2) 0) "")
      (command "_rotate" (entlast) "" arc_center1 angle1)      
      
      
      
      
      (ssadd (entlast) kreskowanie_skarpy)
    
    
    
      (command "_ucs" "_previous")
    )
  )
  
  
  
      
  (generuj_losowa_nazwe "MadziCAD_skarpa")
  (setq block_temp losowa_nazwa)
  (command "_block" block_temp pr11 kreskowanie_skarpy "")
  (command "_insert" block_temp pr11 1 1 0)
  
  (command "_ucs" "_previous")
  (command "_ucs" "_previous")
  
  ;(command "_circle" intersectionpt (* 10 (getvar "dimscale")))
  
  (setvar "clayer" layerprev)
  (setvar "osmode" osmodeprev)
  (setvar "orthomode" orthoprev)  
  (princ)
)









(defun c:asd () ; / elst ename pt param preparam postparam)
  (setq elst (nentsel "\nSelect pline segment: "))
  (setq ename (car elst))
  (setq pt (cadr elst))
  (setq pt (vlax-curve-getClosestPointTo ename pt))
  (setq param (vlax-curve-getParamAtPoint ename pt))
  (setq preparam (fix param))
  (setq postparam (1+ preparam))
  (setq pt 
    (list (vlax-curve-getPointAtParam ename preparam) (vlax-curve-getPointAtParam ename postparam))
  )
  (command "_circle" (car pt) 75)
  (command "_circle" (cadr pt) 150)
) ;end











(defun c:dwusieczna_oryginal(/ layerprev dimscaleprev pt1 pt2 pt3 pr11 pr12 pr21 pr22 ent endpt intersectionpt)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
    (setvar "clayer" layerprev)
    (setvar "dimscale" dimscaleprev)
  )
  (graphscr)
  (setq layerprev (getvar "clayer"))
  (setvar "clayer" "0")
  (setq dimscaleprev (getvar "dimscale"))
  (setvar "dimscale" 0.001)

  (command "_dimangular"
    (progn
      (princ "\n Wska¿ pierwsze ramiê k¹ta: ")
      pause
    )
    (progn 
      (setq pt1 (getvar "lastpoint"))
      (princ "\n Wska¿ drugie ramiê k¹ta: ")
      pause
    )
    (progn
      (setq pt2 (getvar "lastpoint"))
      (setq pt3 (polar pt1 (angle pt1 pt2) (/ (distance pt1 pt2) 2.0)))
      pt3
    )
  )

  
  (setq ent (entget (entlast)))
  (if (= (cdr (assoc 100 (reverse ent))) "AcDb2LineAngularDimension")
    (entdel (entlast))
  )
  
  (setq pr11 (cdr(assoc 10 ent)))
  (setq pr12 (cdr(assoc 15 ent)))
  (setq pr21 (cdr(assoc 13 ent)))
  (setq pr22 (cdr(assoc 14 ent)))
  (setq endpt (cdr(assoc 11 ent)))
  
  (setq pr11 (trans pr11 0 1))
  (setq pr12 (trans pr12 0 1))  
  (setq pr21 (trans pr21 0 1)) ;z G do L
  (setq pr22 (trans pr22 0 1))  
  
  (setq intersectionpt (inters pr11 pr12 pr21 pr22 nil)) ;punkt przeciecia 
  (command "_ray" intersectionpt endpt "")
  
  ;(command "_circle" intersectionpt (* 10 (getvar "dimscale")))
  

  (setvar "clayer" layerprev)
  (setvar "dimscale" dimscaleprev)
  (princ)
)



;=================================
;skarpa
;=================================

(defun c:ss() ;(/ layerprev pt1 pt2 pt3 pt4 pr11 pr12 pr21 pr22 elst ename pt preparam postparam intersectionpt dist1 dist2 angle2 midangle)
  (defun *error* (errorlevel)
    (setvar "clayer" layerprev)
    ;(command "_ucs" "_previous")
    (setvar "osmode" osmodeprev)
    (setvar "orthomode" orthoprev)  
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq layerprev (getvar "clayer"))
  (setvar "clayer" warkresk)
  (setq osmodeprev (getvar "osmode"))       ;zapamietuje stale tryby lokalizacji
  (setq orthoprev (getvar "orthomode"))     ;zapamietuje status orto
  (setvar "osmode" 0)
  (setvar "orthomode" 0)
  (setq kreskowanie_skarpy (ssadd))

  ;(command "_ucs" "_world")
  
  (setq upper_edge (nentsel "\n Wska¿ górn¹ krawêdŸ skarpy: "))
  (command "_measure" upper_edge 500)
  (setq upper_edge_points (ssget "_P"))
  (setq bottom_edge (nentsel "\n Wska¿ górn¹ krawêdŸ skarpy: "))
  (command "_divide" bottom_edge 3)
  (setq bottom_edge_points (ssget "_P"))
  
  (command "_ucs" "_new" "3" 
    (trans (cdr (assoc 10 (entget (ssname upper_edge_points 0)))) 0 1)
    (trans (cdr (assoc 10 (entget (ssname upper_edge_points 1)))) 0 1)
    (trans (cdr (assoc 10 (entget (ssname bottom_edge_points 0)))) 0 1)
  )
  
  (setq n 0)
  (repeat (fix (/ (+ (sslength upper_edge_points) 1) 2))
    (setq pt1 (trans (cdr (assoc 10 (entget (ssname upper_edge_points n)))) 0 1))
    (setq pt2 
      (inters 
        pt1
        (list (car pt1) 10)
        (trans (cdr (assoc 10 (entget (ssname bottom_edge_points 0)))) 0 1)
        (trans (cdr (assoc 10 (entget (ssname bottom_edge_points 1)))) 0 1)
      nil)
    )
    (command "_pline" pt1 pt2 "")
    (command "_scale" (entlast) "" pt1 1) ; tutaj 0.6 to skala kreski 
    (ssadd (entlast) kreskowanie_skarpy)
    (setq n (+ n 2))  
  )
    
  (setq n 1)
  (repeat (fix (/ (sslength upper_edge_points) 2))
    (setq pt1 (trans (cdr (assoc 10 (entget (ssname upper_edge_points n)))) 0 1))
    (setq pt2 
      (inters 
        pt1
        (list (car pt1) 10)
        (trans (cdr (assoc 10 (entget (ssname bottom_edge_points 0)))) 0 1)
        (trans (cdr (assoc 10 (entget (ssname bottom_edge_points 1)))) 0 1)
      nil)
    )
    (command "_pline" pt1 pt2 "")
    (command "_scale" (entlast) "" pt1 0.5) ; tutaj 0.6 to skala kreski 
    (ssadd (entlast) kreskowanie_skarpy)
    (setq n (+ n 2))  
  )

  
  (generuj_losowa_nazwe "MadziCAD_skarpa")
  (setq block_temp losowa_nazwa)
  (setq base_pt (trans (cdr(assoc 10(entget (ssname kreskowanie_skarpy 0)))) 0 1))
  (command "_block" block_temp base_pt kreskowanie_skarpy "")
  (command "_insert" block_temp base_pt 1 1 0)
  
  ;(command "_erase" upper_edge_points bottom_edge_points "")
  
  
  (command "_ucs" "_previous")
  (setvar "clayer" layerprev)
  (setvar "osmode" osmodeprev)
  (setvar "orthomode" orthoprev)  
  (princ)
  
)  
  
  
  
  
  
  
  
  
  
  
  
  
(defun c:asdasd()
  ;jesli luk
  (if (= (cdr (assoc 0 (entget (car elst)))) "ARC")
    (progn 
      (setq kindofslope "slopearc")
      (setq arc_center1 (cdr (assoc 10 (entget (car elst))))) ;srodek luku
      (setq arc_radius1 (cdr (assoc 40 (entget (car elst))))) ;promien luku
      (setq angle1 (cvunit (cdr (assoc 50 (entget (car elst)))) "radians" "degrees")) ;poczatkowy kat
      (setq angle2 (cvunit (cdr (assoc 51 (entget (car elst)))) "radians" "degrees")) ;poczatkowy kat

      (command "_ucs" "_new" arc_center1)
      (setq arc_center1 (trans arc_center1 0 1))
      (command "_line" arc_center1 (list arc_radius1 0) "")
      (command "_rotate" (entlast) "" arc_center1 angle1)
      (setq pt1 (cdr (assoc 11 (entget (entlast)))))
      (entdel(entlast))
      
      (command "_line" arc_center1 (list arc_radius1 0) "")
      (command "_rotate" (entlast) "" arc_center1 angle2)
      (setq pt2 (cdr (assoc 11 (entget (entlast)))))
      (entdel(entlast))
      
      (setq arc_center1 (trans arc_center1 1 0))
      (command "_ucs" "_previous")
    )
  )
    
    ;jesli polilinia
  (if (= (cdr (assoc 0 (entget (car elst)))) "LWPOLYLINE")
    (progn
      (setq kindofslope "slopeline")
      (setq ename (car elst))
      (setq pt (cadr elst))
      (setq pt (vlax-curve-getClosestPointTo ename pt))
      (setq param (vlax-curve-getParamAtPoint ename pt))
      (setq preparam (fix param))
      (setq postparam (1+ preparam))
      (setq pt1 (vlax-curve-getPointAtParam ename preparam))
      (setq pt2 (vlax-curve-getPointAtParam ename postparam))
    )
  )
  
  ;jelsi linia
  (if (= (cdr (assoc 0 (entget (car elst)))) "LINE")
    (progn 
      (setq kindofslope "slopeline")
      (setq pt1 (cdr (assoc 10 (entget (car elst)))))
      (setq pt2 (cdr (assoc 11 (entget (car elst)))))
    )
  )

  
  (setq elst (nentsel "\n Wska¿ doln¹ krawêdŸ skarpy: "))
  
    ;jesli luk
  (if (= (cdr (assoc 0 (entget (car elst)))) "ARC")
    (progn 
      (setq arc_center2 (cdr (assoc 10 (entget (car elst))))) ;srodek luku
      (setq arc_radius2 (cdr (assoc 40 (entget (car elst))))) ;promien luku
      (setq angle3 (cvunit (cdr (assoc 50 (entget (car elst)))) "radians" "degrees")) ;poczatkowy kat
      (setq engle4 (cvunit (cdr (assoc 51 (entget (car elst)))) "radians" "degrees")) ;poczatkowy kat

      (command "_ucs" "_new" arc_center2)
      (setq arc_center2 (trans arc_center2 0 1))
      (command "_line" arc_center2 (list arc_radius2 0) "")
      (command "_rotate" (entlast) "" arc_center2 angle3)
      (setq pt3 (cdr (assoc 11 (entget (entlast)))))
      (entdel(entlast))
      
      (command "_line" arc_center2 (list arc_radius2 0) "")
      (command "_rotate" (entlast) "" arc_center2 angle4)
      (setq pt4 (cdr (assoc 11 (entget (entlast)))))
      (entdel(entlast))
      
      (setq arc_center2 (trans arc_center2 1 0))
      (command "_ucs" "_previous")
    )
  )
  
  ;jesli polinia
  (if (= (cdr (assoc 0 (entget (car elst)))) "LWPOLYLINE")
    (progn
      (setq ename (car elst))
      (setq pt (cadr elst))
      (setq pt (vlax-curve-getClosestPointTo ename pt))
      (setq param (vlax-curve-getParamAtPoint ename pt))
      (setq preparam (fix param))
      (setq postparam (1+ preparam))
      (setq pt3 (vlax-curve-getPointAtParam ename preparam))
      (setq pt4 (vlax-curve-getPointAtParam ename postparam))
    )
  )
      
      ;jesli linia
  (if (= (cdr (assoc 0 (entget (car elst)))) "LINE")
    (progn 
      (setq pt3 (cdr (assoc 10 (entget (car elst)))))
      (setq pt4 (cdr (assoc 11 (entget (car elst)))))
    )
  )

  (if (= kindofslope "slopeline")  ;tzn ze elelmnt liniowy linia labo polilinia
    (progn
      (setq intersectionpt (inters pt1 pt2 pt3 pt4 nil)) ;punkt przeciecia 
      (if (= intersectionpt nil)
        (setq intersectionpt pt1)
      )

      (setq dist1 (distance intersectionpt pt1))
      (setq dist2 (distance intersectionpt pt2))
      
      (if (< dist1 dist2)
        (progn
          (setq pr11 pt1)
          (setq pr12 pt2)
        )
        (progn
          (setq pr11 pt2)
          (setq pr12 pt1)
        )
      )
      
      (setq dist1 (distance intersectionpt pt3))
      (setq dist2 (distance intersectionpt pt4))
      
      (if (< dist1 dist2)
        (progn
          (setq pr21 pt3)
          (setq pr22 pt4)
        )
        (progn
          (setq pr21 pt4)
          (setq pr22 pt3)
        )
      )
      
      
      (command "_ucs" "n" "3" pr11 pr12 pr22)
      
      (setq pr11 (trans pr11 0 1)) ; z G do L
      (setq pr12 (trans pr12 0 1))
      (setq pr21 (trans pr21 0 1))
      (setq pr22 (trans pr22 0 1))
      (setq intersectionpt (trans intersectionpt 0 1))
      
      (setq slope_length (- (distance pr11 pr12) 500))
      (setq nn (+ (fix (/ slope_length 1000)) 1))
      (setq rozstaw 500) ;rozstaw kresek malych i duzych tzn duza kreska co 1000
      
      ;rysowanie krotkiej kreski
      (repeat nn
        (setq pt1 (list rozstaw 0))
        (setq pt2 (list rozstaw 100))
        (setq pt2 (inters pt1 pt2 pr21 pr22 nil)) ;punkt przeciecia 
        (command "_pline" pt1 pt2 "")
        (command "_scale" (entlast) "" pt1 0.55) ; tutaj 0.6 to skala kreski 
        (ssadd (entlast) kreskowanie_skarpy)
        ;(setq pt2 (inters (getpoint)(getpoint)(getpoint)(getpoint) nil) 
        (setq rozstaw (+ rozstaw 1000))
      )
      
      ;rysowanie dlugiej kreski
      (setq slope_length (- (distance pr11 pr12) 1000))
      (setq nn (+ (fix (/ slope_length 1000)) 1))
      (setq rozstaw 500) ;rozstaw kresek malych i duzych tzn duza kreska co 1000
      (setq rozstaw (+ 500 500)) ;rozstaw kresek malych i duzych tzn duza kreska co 1000
      (repeat nn
        (setq pt1 (list rozstaw 0))
        (setq pt2 (list rozstaw 100))
        (setq pt2 (inters pt1 pt2 pr21 pr22 nil)) ;punkt przeciecia 
        (command "_pline" pt1 pt2 "")
        (command "_scale" (entlast) "" pt1 0.85) ; tutaj 1 to skala kreski - q do dolnej krawe
        (ssadd (entlast) kreskowanie_skarpy)
        ;(setq pt2 (inters (getpoint)(getpoint)(getpoint)(getpoint) nil) 
        (setq rozstaw (+ rozstaw 1000))
      )
    )
  )
  
  (if (= kindofslope "slopearc")      ;tzn ze luk
    (progn
      (setq rozstaw 5) ;rozstaw w stopniach
      (command "_ucs" "_new" arc_center1)
      (setq arc_center1 (trans arc_center1 0 1))
      (command "_pline" (list arc_radius1 0) (list (+ arc_radius1 arc_radius2) 0) "")
      (command "_rotate" (entlast) "" arc_center1 angle1)      
      
      
      
      
      (ssadd (entlast) kreskowanie_skarpy)
    
    
    
      (command "_ucs" "_previous")
    )
  )
  
  
  
      
  (generuj_losowa_nazwe "MadziCAD_skarpa")
  (setq block_temp losowa_nazwa)
  (setq base_pt (cdr(assoc 10(entget (ssname kreskowanie_skarpy 0)))))
  (command "_block" block_temp base_pt kreskowanie_skarpy "")
  (command "_insert" block_temp base_pt 1 1 0)
  
  (command "_ucs" "_previous")
  (command "_ucs" "_previous")
  
  ;(command "_circle" intersectionpt (* 10 (getvar "dimscale")))
  
  (setvar "clayer" layerprev)
  (setvar "osmode" osmodeprev)
  (setvar "orthomode" orthoprev)  
  (princ)
)
















;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:zapamietaj_baze_wspolrzednych_nr_1(/ layerprev osmodeprev pkt temp_selection ent)
  (defun *error* (errorlevel)
    (setvar "osmode" osmodeprev)
    (setvar "clayer" layerprev)			;zmienia na poprz warstwe
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq layerprev (getvar "clayer"))			;zapamietuje biezaca warstwe
  (setq osmodeprev (getvar "osmode"))
  
  (if (= (tblsearch "layer" "Defpoints") nil)
    (setvar "clayer" "0")          			
    (setvar "clayer" "Defpoints")          			
  )

  (setvar "osmode" 15359)
  (setq pkt (getpoint "\n Wska¿ punkt maj¹cy zostaæ baza wspó³rzêdnych: "))

  (command "_mtext" 
    pkt
    "_justify" "_bl" 
    "_height" (* (getvar "dimscale") txta 50)			;wysokosc tekstu
    pkt
    "  BAZA WSPOLRZEDNYCH NR 1"
    " "
    ""
  )
  
  (setq temp_selection (ssadd))
  (ssadd (entlast) temp_selection)
    
  (command "_circle" pkt (* (getvar "dimscale") 100))
  (ssadd (entlast) temp_selection)
  
  (command "_point" pkt)
  (ssadd (entlast) temp_selection)
  (if (= (ssget "_X" '((0 . "INSERT")(2 . "BAZA WSPOLRZEDNYCH NR 1"))) nil)
    (progn
      (if (= (tblsearch "block" "BAZA WSPOLRZEDNYCH NR 1") nil)
        (command "_block" "BAZA WSPOLRZEDNYCH NR 1" pkt temp_selection "")
        (command "_block" "BAZA WSPOLRZEDNYCH NR 1" "_yes" pkt temp_selection "")
      )
    )
    (progn
      (alert "Baza wspó³rzêdnych NR 1 istnia³a i zosta³a przedefiniowana")
      (command "_explode" (ssget "_X" '((0 . "INSERT")(2 . "BAZA WSPOLRZEDNYCH NR 1"))) "")
      (setq ent (entget (ssname (ssget "_X" '((0 . "MTEXT")(1 . "  BAZA WSPOLRZEDNYCH NR 1\\P "))) 0)))
      (setq ent (subst (cons 1 "  NIEAKTUALNA BAZA WSPOLRZEDNYCH NR 1\\P ") (assoc 1 ent) ent))
      (entmod ent)
      
      (command "_block" "BAZA WSPOLRZEDNYCH NR 1" "_yes" pkt temp_selection "")
    )
  )
    
  (command "_insert" "BAZA WSPOLRZEDNYCH NR 1" pkt 1 1 0)
  
  (setvar "osmode" 0)
  (command "_ucs" "_new" pkt)

  (setq pkt (cdr (assoc 10 (entget (entlast)))))
  (princ (strcat "\n Ustawiono aktualny LUW w punkcie: (" (rtos(car pkt)) ", " (rtos(cadr pkt)) ", " (rtos(caddr pkt)) ") w [GUW]."))    
  
  (setvar "osmode" osmodeprev)
  (setvar "clayer" layerprev)			;zmienia na poprz warstwe

  (princ)  
)

(defun c:zapamietaj_baze_wspolrzednych_NR_2(/ layerprev osmodeprev pkt temp_selection ent)
  (defun *error* (errorlevel)
    (setvar "osmode" osmodeprev)
    (setvar "clayer" layerprev)			;zmienia na poprz warstwe
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq layerprev (getvar "clayer"))			;zapamietuje biezaca warstwe
  (setq osmodeprev (getvar "osmode"))
  
  (if (= (tblsearch "layer" "Defpoints") nil)
    (setvar "clayer" "0")          			
    (setvar "clayer" "Defpoints")          			
  )

  (setvar "osmode" 15359)
  (setq pkt (getpoint "\n Wska¿ punkt maj¹cy zostaæ baza wspó³rzêdnych: "))

  (command "_mtext" 
    pkt
    "_justify" "_bl" 
    "_height" (* (getvar "dimscale") txta 50)			;wysokosc tekstu
    pkt
    "  BAZA WSPOLRZEDNYCH NR 2"
    " "
    ""
  )
  
  (setq temp_selection (ssadd))
  (ssadd (entlast) temp_selection)
    
  (command "_circle" pkt (* (getvar "dimscale") 100))
  (ssadd (entlast) temp_selection)
  
  (command "_point" pkt)
  (ssadd (entlast) temp_selection)
  (if (= (ssget "_X" '((0 . "INSERT")(2 . "BAZA WSPOLRZEDNYCH NR 2"))) nil)
    (progn
      (if (= (tblsearch "block" "BAZA WSPOLRZEDNYCH NR 2") nil)
        (command "_block" "BAZA WSPOLRZEDNYCH NR 2" pkt temp_selection "")
        (command "_block" "BAZA WSPOLRZEDNYCH NR 2" "_yes" pkt temp_selection "")
      )
    )
    (progn
      (alert "Baza wspó³rzêdnych NR 2 istnia³a i zosta³a przedefiniowana")
      (command "_explode" (ssget "_X" '((0 . "INSERT")(2 . "BAZA WSPOLRZEDNYCH NR 2"))) "")
      (setq ent (entget (ssname (ssget "_X" '((0 . "MTEXT")(1 . "  BAZA WSPOLRZEDNYCH NR 2\\P "))) 0)))
      (setq ent (subst (cons 1 "  NIEAKTUALNA BAZA WSPOLRZEDNYCH NR 2\\P ") (assoc 1 ent) ent))
      (entmod ent)
      
      (command "_block" "BAZA WSPOLRZEDNYCH NR 2" "_yes" pkt temp_selection "")
    )
  )
    
  (command "_insert" "BAZA WSPOLRZEDNYCH NR 2" pkt 1 1 0)
  
  (setvar "osmode" 0)
  (command "_ucs" "_new" pkt)

  (setq pkt (cdr (assoc 10 (entget (entlast)))))
  (princ (strcat "\n Ustawiono aktualny LUW w punkcie: (" (rtos(car pkt)) ", " (rtos(cadr pkt)) ", " (rtos(caddr pkt)) ") w [GUW]."))    
  
  (setvar "osmode" osmodeprev)
  (setvar "clayer" layerprev)			;zmienia na poprz warstwe

  (princ)  
)


(defun c:zapamietaj_baze_wspolrzednych_NR_3(/ layerprev osmodeprev pkt temp_selection ent)
  (defun *error* (errorlevel)
    (setvar "osmode" osmodeprev)
    (setvar "clayer" layerprev)			;zmienia na poprz warstwe
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq layerprev (getvar "clayer"))			;zapamietuje biezaca warstwe
  (setq osmodeprev (getvar "osmode"))
  
  (if (= (tblsearch "layer" "Defpoints") nil)
    (setvar "clayer" "0")          			
    (setvar "clayer" "Defpoints")          			
  )

  (setvar "osmode" 15359)
  (setq pkt (getpoint "\n Wska¿ punkt maj¹cy zostaæ baza wspó³rzêdnych: "))

  (command "_mtext" 
    pkt
    "_justify" "_bl" 
    "_height" (* (getvar "dimscale") txta 50)			;wysokosc tekstu
    pkt
    "  BAZA WSPOLRZEDNYCH NR 3"
    " "
    ""
  )
  
  (setq temp_selection (ssadd))
  (ssadd (entlast) temp_selection)
    
  (command "_circle" pkt (* (getvar "dimscale") 100))
  (ssadd (entlast) temp_selection)
  
  (command "_point" pkt)
  (ssadd (entlast) temp_selection)
  (if (= (ssget "_X" '((0 . "INSERT")(2 . "BAZA WSPOLRZEDNYCH NR 3"))) nil)
    (progn
      (if (= (tblsearch "block" "BAZA WSPOLRZEDNYCH NR 3") nil)
        (command "_block" "BAZA WSPOLRZEDNYCH NR 3" pkt temp_selection "")
        (command "_block" "BAZA WSPOLRZEDNYCH NR 3" "_yes" pkt temp_selection "")
      )
    )
    (progn
      (alert "Baza wspó³rzêdnych NR 3 istnia³a i zosta³a przedefiniowana")
      (command "_explode" (ssget "_X" '((0 . "INSERT")(2 . "BAZA WSPOLRZEDNYCH NR 3"))) "")
      (setq ent (entget (ssname (ssget "_X" '((0 . "MTEXT")(1 . "  BAZA WSPOLRZEDNYCH NR 3\\P "))) 0)))
      (setq ent (subst (cons 1 "  NIEAKTUALNA BAZA WSPOLRZEDNYCH NR 3\\P ") (assoc 1 ent) ent))
      (entmod ent)
      
      (command "_block" "BAZA WSPOLRZEDNYCH NR 3" "_yes" pkt temp_selection "")
    )
  )
    
  (command "_insert" "BAZA WSPOLRZEDNYCH NR 3" pkt 1 1 0)
  
  (setvar "osmode" 0)
  (command "_ucs" "_new" pkt)

  (setq pkt (cdr (assoc 10 (entget (entlast)))))
  (princ (strcat "\n Ustawiono aktualny LUW w punkcie: (" (rtos(car pkt)) ", " (rtos(cadr pkt)) ", " (rtos(caddr pkt)) ") w [GUW]."))    
  
  (setvar "osmode" osmodeprev)
  (setvar "clayer" layerprev)			;zmienia na poprz warstwe

  (princ)  
)

;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:zamknij_otworz_wlasciwosci()
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (if 
    (= (getvar "opmstate") 0) 
    (progn
      (command "_properties")
      (princ "\n Otwarto okno w³aœciwoœci. ")
    )
    (progn
      (command "_propertiesclose")
      (princ "\n Zamkniêto okno w³aœciwoœci. ")
    )
  )
  (princ)
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:za(/ ksztalt_preta filletrad filletradprev thickness)
  (defun *error* (errorlevel)
    (setq filletradprev (getvar "filletrad"))
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (princ "wskaz polilnie:")
  (setq ksztalt_preta (ssget "_:S"))
  (setq thickness (cdr (assoc 40 (entget (ssname ksztalt_preta 0)))))
  (setq filletradprev (getvar "filletrad"))
  (setvar "FILLETRAD" (* 0.5 5 thickness)) 
  (command "_fillet" "_polyline" ksztalt_preta)
  (setvar "filletrad" filletradprev)
  (princ)
)

(defun c:zaa(/ ksztalt_preta)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (princ "wskaz polilnie:")
  (setq ksztalt_preta (ssget "_:S"))
  (setvar "FILLETRAD" 0)
  (command "_fillet" "_polyline" ksztalt_preta)  
  (princ)
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:madzicad_massprop (/ osmodeprev orthoprev boundary_ss hatch_ss	temp_ss	kat_kreskowania	pkt dim1 dim2 skala_kreskowania	boundary_sslist
			    hatch_sslist entlist area)
  (defun *error* (errorlevel)
    (selection_to_list boundary_ss)
    (setq boundary_sslist sslist)
    (selection_to_list hatch_ss)
    (setq hatch_sslist sslist)
    (foreach item boundary_sslist (entdel item))
    (foreach item hatch_sslist (entdel item))
    (setvar "clayer" layerprev)		;zmienia na poprz warstwe
    (setvar "osmode" osmodeprev)
    (setvar "orthomode" orthoprev)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
    (princ)
  )
  (graphscr)
  (setq layerprev (getvar "clayer"))	;zapamietuje biezaca warstwe
  (setq osmodeprev (getvar "osmode"))	;zapamietuje stale tryby lokalizacji
  (setq orthoprev (getvar "orthomode"))	;zapamietuje status orto
  (setvar "clayer" "0")
  (setvar "osmode" 0)
  (setvar "orthomode" 0)

  (setq boundary_ss (ssadd))
  (setq hatch_ss (ssadd))
  (setq temp_ss (ssadd))

  (setq kat_kreskowania 0)		;poczatkowy kat kreskowania zeby przez pomylke nie zanzczyc obszaru dwa razy
  (setq	pkt (getpoint
	      "\n Wskazuj kolejno punkty w obszarach tworz¹cych pole."
	    )
  )

  (while (/= pkt nil)
    (command "_boundary" "_advanced" "_object" "_region" "" "_advanced"	"_island" "_no"	"" "" pkt "")
    (vla-getboundingbox
      (vlax-ename->vla-object
	(cdr (car (entget (entlast))))
      )
      'bbox1
      'bbox2
    )					;narozniki boundingboxa
    (setq dim1 (trans (vlax-safearray->list bbox1) 0 1))
    (setq dim2 (trans (vlax-safearray->list bbox2) 0 1))

    (setq skala_kreskowania
	   (/ (distance dim1 dim2) 100)
    )					;ustalenie skali kreskowania

    (ssadd (entlast) boundary_ss)
    (command "_hatch"
	     "ansi37"
	     skala_kreskowania
	     kat_kreskowania
	     (entlast)
	     ""
    )
					;czerowny
    (ssadd (entlast) hatch_ss)
    (setq pkt (getpoint))
    (setq kat_kreskowania (+ kat_kreskowania 10))
  )

  (selection_to_list hatch_ss)
  (setq hatch_sslist sslist)

  (foreach item hatch_sslist (entdel item))
					; kasowanie pojedynczych kreskowan
  (if (> (sslength boundary_ss) 1)
    (progn (command "_union" boundary_ss "")
	   (setq mass_region (entlast))
    )
    (progn (setq mass_region (ssname boundary_ss 0)))
  )



  (setq	area (vlax-get
	       (vlax-ename->vla-object mass_region)
	       'area
	     )
  )					;powerchnia
  (setq	perimeter
	 (vlax-get
	   (vlax-ename->vla-object mass_region)
	   'perimeter
	 )
  )					;obwod
  (setq
    centroid (vlax-get
	       (vlax-ename->vla-object mass_region)
	       'centroid
	     )
  )					;srodek ceizkosci
  (setq	momentofinertia
	 (vlax-get (vlax-ename->vla-object
		     mass_region
		   )
		   'momentofinertia
	 )
  )					;momenty bezwladnosci
  (setq	principalmoments
	 (vlax-get (vlax-ename->vla-object
		     mass_region
		   )
		   'principalmoments
	 )
  )					;glowne momenty bezwladnosci
  (setq	principaldirections
	 (vlax-get (vlax-ename->vla-object
		     mass_region
		   )
		   'principaldirections
	 )
  )
  (vla-getboundingbox
    (vlax-ename->vla-object mass_region)
    'bbox1
    'bbox2
  )
  (setq dim1 (vlax-safearray->list bbox1))
  (setq dim2 (vlax-safearray->list bbox2))

  (setq skala_kreskowania (/ (distance dim1 dim2) 100))
  (command "_hatch" "ansi37" skala_kreskowania 0 mass_region "")






;;;;rysowanie kolka z krzycyzkiem i kreskowania
   (command "_hatch" "ansi37" skala_kreskowania 0 mass_region "")
  (ssadd (entlast) temp_ss)
  
  (command "_circle" centroid (/ (distance dim1 dim2) 20))
  (ssadd (entlast) temp_ss)

  (command "_pline"
	   '(0 0)
	   (list (car principaldirections) (caddr principaldirections))
	   ""
  )
  (command "_scale"
	   (entlast)
	   ""
	   (list (car principaldirections) (caddr principaldirections))
	   2
  )
  (command "_scale"
	   (entlast)
	   ""
	   '(0 0)
	   (/ (distance dim1 dim2) 20)
  )
  (command "_move" (entlast) "" '(0 0) centroid)
  (ssadd (entlast) temp_ss)


  
  (command "_pline"
	   '(0 0)
	   (list (cadr principaldirections)
		 (cadddr principaldirections)
	   )
	   ""
  )
  (command "_scale"
	   (entlast)
	   ""
	   (list (cadr principaldirections)
		 (cadddr principaldirections)
	   )
	   2
  )
  (command "_scale"
	   (entlast)
	   ""
	   '(0 0)
	   (/ (distance dim1 dim2) 20)
  )
  (command "_move" (entlast) "" '(0 0) centroid)
  (ssadd (entlast) temp_ss)

  (entdel mass_region)
					; (entdel (entlast)) kasuje kreskowanie


  (setq	properties
	 (strcat "W³aœciwoœci obszarów: \n"
		 "Pole powierzchni:  "
		 (rtos (/ area 100))
		 " cm2   ("
		 (rtos area)
		 " jedn^2)\n"
		 "Obwód (sumaryczny):  "
		 (rtos (/ perimeter 10))
		 " cm   ("
		 (rtos perimeter)
		 " jedn)\n\n"
		 "Centralne momenty bezw³adnoœci (wzglêdem LUW):\n"
					;(rtos (car centroid)) "\t" (rtos (cadr centroid)) "\n"
		 "Jx:  "
		 (rtos (/ (car momentofinertia) 10000))
		 " cm4   ("
		 (rtos (car momentofinertia))
		 " jedn^4)\n"
		 "Jy:  "
		 (rtos (/ (cadr momentofinertia) 10000))
		 " cm4   ("
		 (rtos (cadr momentofinertia))
		 " jedn^4)\n\n"
		 "G³ówne centralne momenty bezw³adnosæi:\n"
		 "Jx:  "
		 (rtos (/ (car principalmoments) 10000))
		 " cm4   ("
		 (rtos (car principalmoments))
		 " jedn^4)\n"
		 "Jy:  "
		 (rtos (/ (cadr principalmoments) 10000))
		 " cm4   ("
		 (rtos (cadr principalmoments))
		 " jedn^4)\n\n"
					;"Kierunki g³ówne:   " (rtos principalangle) " stopni\n"
	 )
  )


  
(generuj_losowa_nazwe "MadziCAD_mass_properties")
  (setq block_temp losowa_nazwa)
  (setq
    base_pt (trans (cdr (assoc 10 (entget (ssname temp_ss 0)))) 0 1)
  )
  (command "_block" block_temp base_pt temp_ss "")
  (command "_insert" block_temp base_pt 1 1 0)


  (princ properties)
  (alert properties)


  
  (command "_mtext"
	   '(0 0)
	   "_justify"
	   "_bl"
	   "_height"
	   (* (getvar "dimscale") txta)	;wysokosc tekstu
	   '(0 0)
	   properties
	   ""
  )

  (command "_move" (entlast) "" '(0 0) pause)



  (setvar "clayer" layerprev)		;zmienia na poprz warstwe
  (setvar "osmode" osmodeprev)
  (setvar "orthomode" orthoprev)


  (princ)
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun C:szybki_obrot_z_kopiowaniem(/ temp_selection base_pt  pt1 angledeg)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (princ "\n Wska¿ obiekty do obrócenia: ")
  (setq temp_selection (ssget))
  (setq base_pt (getpoint "\n Wska¿ punkt bazowy: "))
  (if 
    (= base_pt nil)
    (setq base_pt (cdr (assoc 10 (entget (ssname temp_selection 0)))))
  )
  ;(setq base_pt (cdr (assoc 10 (entget (ssname temp_selection 0)))))
  ;(setq base_angle_rad (atan (/ (- (cadr base_pt) (cadr pkt)) (- (car base_pt) (car pkt)))))
  ;(setq base_angle_deg (cvunit base_angle_rad "radians" "degrees"))
  (initget 137)
  (setq pt1 (getpoint base_pt "\n Wska¿ pierwszy punkt obrotu, lub podaj k¹t obrotu: "))
  (if 
    (= (listp pt1) nil)
    (progn
      (setq angledeg (atof pt1))
      (command "_rotate" temp_selection "" base_pt "_copy" angledeg)
      (setq angledeg (getreal "\n Podaj kolejny k¹t obrotu: "))
      (while (/= angledeg nil) 
        (command "_rotate" temp_selection "" base_pt "_copy" angledeg)
        (setq angledeg (getreal "\n Podaj kolejny k¹t obrotu: "))        
      )
    )
    
    
    
    ;kopiowanie 5 razy
    (progn
      (command "_rotate" temp_selection "" base_pt "_copy" "_reference" base_pt pt1 
        (progn 
          (princ "\n Wska¿ drugi punkt obrotu: ")
          pause
        )
      )
      (command "_rotate" temp_selection "" base_pt "_copy" "_reference" base_pt pt1 
        (progn 
          (princ "\n Wska¿ drugi punkt obrotu: ")
          pause
        )
      )      
      (command "_rotate" temp_selection "" base_pt "_copy" "_reference" base_pt pt1 
        (progn 
          (princ "\n Wska¿ drugi punkt obrotu: ")
          pause
        )
      )      
      (command "_rotate" temp_selection "" base_pt "_copy" "_reference" base_pt pt1 
        (progn 
          (princ "\n Wska¿ drugi punkt obrotu: ")
          pause
        )
      )


    )
  )



  ;(setq new_base_pt (cdr (assoc 10 (entget (ssname temp_selection 0)))))
  ;(setq new_base_angle_rad (atan (/ (- (cadr new_base_pt) (cadr pkt)) (- (car new_base_pt) (car pkt)))))
  ;(setq new_base_angle_deg (cvunit new_base_angle_rad "radians" "degrees"))
  ;(princ (- new_base_angle_deg base_angle_deg))   ;dokonczyc
  (princ)
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:policz_obiekty(/ temp_selection)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana ")
  )
  (princ "\n Wybierz obiekty do policzenia: ")
  (setq temp_selection (ssget))
  ;(setq n (sslength temp_selection))
  (princ (strcat "\n Zaznaczono " (rtos (sslength temp_selection)) " obiektów."))
  (alert (strcat "\n Zaznaczono " (rtos (sslength temp_selection)) " obiektów."))    
  (princ)
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;;; PARAMETRY FIZYCZNE 
(defun c:przekroj_zespolony (/		   osmodeprev	 orthoprev     boundary_ss   hatch_ss
			     temp_ss	   kat_kreskowania	       pkt	     dim1
			     dim2	   skala_kreskowania	       boundary_sslist
			     hatch_sslist  area		 momentofinertia	     centroid
			     principaldirections	 principalangle		     properties
			     pt1	   pt2		 entlist       centroid_a    centroid_b
			     centroid_c	   Jx_a		 Jx_b	       Jx_c	     Jy_a
			     Jy_b	   Jy_c		 pole_a	       pole_b	     pole_c
			     pole_zespolonego		 Jx_zespolonego		     Jy_zespolonego
			     ea		   eb		 ec	       dcl_id	     cnt
			     what_next
			    )

  (defun *error* (errorlevel)
    (if	(not (null obszar_a))
      (entdel obszar_a)
    )
    (if	(not (null obszar_b))
      (entdel obszar_b)
    )
    (if	(not (null obszar_c))
      (entdel obszar_c)
    )
    (if	(not (null obszar_d))
      (entdel obszar_d)
    )
    (if	(not (null os_zespolona))
      (entdel os_zespolona)
    )
    (setvar "osmode" osmodeprev)
    (setvar "orthomode" orthoprev)
    (princ "\n MadziCAD error: Funkcja przerwana. "
    )
    (princ)
  )

  (graphscr)
  (setq osmodeprev (getvar "osmode"))	;zapamietuje stale tryby lokalizacji
  (setq orthoprev (getvar "orthomode"))	;zapamietuje status orto
  (setvar "osmode" 0)
  (setvar "orthomode" 0)

  (setq ea 205.0)
  (setq obszar_a nil)
  (setq na (/ ea ea))
  (setq pole_a 0.00)
  (setq Jy_a 0.00)
  (setq centroid_a '(0 0 0))

  (setq eb 32.6)
  (setq obszar_b nil)
  (setq nb (/ ea eb))
  (setq pole_b 0.00)
  (setq Jy_b 0.00)
  (setq centroid_b '(0 0 0))

  (setq ec 210.0)
  (setq obszar_c nil)
  (setq nc (/ ea ec))
  (setq pole_c 0.00)
  (setq Jy_c 0.00)
  (setq centroid_c '(0 0 0))

  (setq ed 210.0)
  (setq obszar_d nil)
  (setq nd (/ ea ed))
  (setq pole_d 0.00)
  (setq Jy_d 0.00)
  (setq centroid_d '(0 0 0))

  (setq pole_zespolonego 0.00)
  (setq Jy_zespolonego 0.00)
  (setq os_zespolona nil)


  (setq moment_zginajacy 0.00)
  (setq sila_osiowa 0.00)

  (setq moment_zginajacy_a 0.00)
  (setq moment_zginajacy_b 0.00)
  (setq moment_zginajacy_c 0.00)
  (setq moment_zginajacy_d 0.00)

  (setq sila_osiowa_a 0.00)
  (setq sila_osiowa_b 0.00)
  (setq sila_osiowa_c 0.00)
  (setq sila_osiowa_d 0.00)

  (setq sigma_gw_a 0.00)
  (setq sigma_dw_a 0.00)
  (setq sigma_gw_b 0.00)
  (setq sigma_dw_b 0.00)
  (setq sigma_gw_c 0.00)
  (setq sigma_dw_c 0.00)
  (setq sigma_gw_d 0.00)
  (setq sigma_dw_d 0.00)

  (setq gorne_wlokna_a 0.00)
  (setq dolne_wlokna_a 0.00)
  (setq gorne_wlokna_b 0.00)
  (setq dolne_wlokna_b 0.00)
  (setq gorne_wlokna_c 0.00)
  (setq dolne_wlokna_c 0.00)
  (setq gorne_wlokna_d 0.00)
  (setq dolne_wlokna_d 0.00)






  (setq
    dcl_id (load_dialog (strcat path "\\DCL\\przekroj_zespolony.dcl"))
  )					;Load the dialog box.
  (setq what_next 2)
  (setq cnt 1)
  (while (>= what_next 2)		;Begin display loop.
    (if
      (null (new_dialog "przekroj_zespolony" dcl_id "" '(650 100))
      )
					;Initialize dialog box, exit if nil returned.
       (exit)
    )

;;; OKIENKO SET
    (set_tile "ea" (rtos ea 2 2))
    (set_tile "na" (rtos na 2 2))
    (set_tile "pole_a" (rtos pole_a 2 2))
    (set_tile "jy_a" (rtos jy_a 2 2))

    (set_tile "eb" (rtos eb 2 2))
    (set_tile "nb" (rtos nb 2 2))
    (set_tile "pole_b" (rtos pole_b 2 2))
    (set_tile "jy_b" (rtos jy_b 2 2))

    (set_tile "ec" (rtos ec 2 2))
    (set_tile "nc" (rtos nc 2 2))
    (set_tile "pole_c" (rtos pole_c 2 2))
    (set_tile "jy_c" (rtos jy_c 2 2))

    (set_tile "ed" (rtos ed 2 2))
    (set_tile "nd" (rtos nd 2 2))
    (set_tile "pole_d" (rtos pole_d 2 2))
    (set_tile "jy_d" (rtos jy_d 2 2))

    (set_tile "pole_zespolonego" (rtos pole_zespolonego 2 2))
    (set_tile "jy_zespolonego" (rtos jy_zespolonego 2 2))

    (set_tile "moment_zginajacy" (rtos moment_zginajacy 2 2))
    (set_tile "sila_osiowa" (rtos sila_osiowa 2 2))



    (set_tile "moment_zginajacy_a"
	      (rtos moment_zginajacy_a 2 2)
    )
    (set_tile "moment_zginajacy_b"
	      (rtos moment_zginajacy_b 2 2)
    )
    (set_tile "moment_zginajacy_c"
	      (rtos moment_zginajacy_c 2 2)
    )
    (set_tile "moment_zginajacy_d"
	      (rtos moment_zginajacy_d 2 2)
    )

    (set_tile "sila_osiowa_a"
	      (rtos sila_osiowa_a 2 2)
    )
    (set_tile "sila_osiowa_b"
	      (rtos sila_osiowa_b 2 2)
    )
    (set_tile "sila_osiowa_c"
	      (rtos sila_osiowa_c 2 2)
    )
    (set_tile "sila_osiowa_d"
	      (rtos sila_osiowa_d 2 2)
    )


    (set_tile "sigma_gw_a" (rtos sigma_gw_a 2 2))
    (set_tile "sigma_dw_a" (rtos sigma_dw_a 2 2))
    (set_tile "sigma_gw_b" (rtos sigma_gw_b 2 2))
    (set_tile "sigma_dw_b" (rtos sigma_dw_b 2 2))
    (set_tile "sigma_gw_c" (rtos sigma_gw_c 2 2))
    (set_tile "sigma_dw_c" (rtos sigma_dw_c 2 2))
    (set_tile "sigma_gw_d" (rtos sigma_gw_d 2 2))
    (set_tile "sigma_dw_d" (rtos sigma_dw_d 2 2))



;;; actions
    (action_tile
      "accept"
      "(done_dialog 1)"
    )
    (action_tile
      "wskaz_obszar_a"
      "(done_dialog 3)"
    )
    (action_tile
      "wskaz_obszar_b"
      "(done_dialog 4)"
    )
    (action_tile
      "wskaz_obszar_c"
      "(done_dialog 5)"
    )
    (action_tile
      "wskaz_obszar_d"
      "(done_dialog 6)"
    )

    (action_tile
      "ea"
      "(setq ea (atof (get_tile \"ea\")))(done_dialog 10)"
    )
    (action_tile
      "eb"
      "(setq eb (atof (get_tile \"eb\")))(done_dialog 10)"
    )
    (action_tile
      "ec"
      "(setq ec (atof (get_tile \"ec\")))(done_dialog 10)"
    )
    (action_tile
      "ed"
      "(setq ed (atof (get_tile \"ed\")))(done_dialog 10)"
    )


    (action_tile
      "moment_zginajacy"
      "(setq moment_zginajacy (atof (get_tile \"moment_zginajacy\")))(done_dialog 10)"
    )

    (action_tile
      "sila_osiowa"
      "(setq sila_osiowa (atof (get_tile \"sila_osiowa\")))(done_dialog 10)"
    )



    (action_tile
      "help"
      "(przekroj_zespolony_help)"
    )
    (action_tile
      "info"
      "(przekroj_zespolony_info)(done_dialog)"
    )


    (setq what_next (start_dialog))	; Display the dialog

    (cond
;;;przekroj A
      ((= what_next 3)			;Prompt user to

       (if (not (null obszar_a))
	 (entdel obszar_a)
       )
       (if (not (null os_zespolona))
	 (entdel os_zespolona)
       )


       (tworzenie_wlasciwosci "ansi38" 140)

       (setq obszar_a obszar)
       (setq gorne_wlokna_a gorne_wlokna)
       (setq dolne_wlokna_a dolne_wlokna)
       (setq pole_a (/ area 100))	; cm2
       (setq Jy_a
	      (/ (car momentofinertia) 10000)
       )
       (setq centroid_a centroid)
       (charakterystyki_zespolonego)
       (obliczanie_momentow)
       (obliczanie_naprezen)



      )
;;;przekroj B      
      ((= what_next 4)			;Prompt user to
       (progn
	 (if (not (null obszar_b))
	   (entdel obszar_b)
	 )
	 (if (not (null os_zespolona))
	   (entdel os_zespolona)
	 )

	 (tworzenie_wlasciwosci "ansi33" 32)
	 (setq obszar_b obszar)
	 (setq gorne_wlokna_b gorne_wlokna)
	 (setq dolne_wlokna_b dolne_wlokna)

	 (setq pole_b (/ area 100))	; cm2
	 (setq Jy_b
		(/ (car	momentofinertia
		   )
		   10000
		)
	 )
	 (setq centroid_b centroid)

	 (charakterystyki_zespolonego)
	 (obliczanie_momentow)
	 (obliczanie_naprezen)

       )
      )
;;;przekroj C
      ((= what_next 5)			;Prompt user to
       (progn
	 (if (not (null obszar_c))
	   (entdel obszar_c)
	 )
	 (if (not (null os_zespolona))
	   (entdel os_zespolona)
	 )

	 (tworzenie_wlasciwosci "ansi37" 75)
	 (setq obszar_c obszar)

	 (setq gorne_wlokna_c gorne_wlokna)
	 (setq dolne_wlokna_c dolne_wlokna)

	 (setq pole_c (/ area 100))	; cm2
	 (setq Jy_c
		(/ (car	momentofinertia
		   )
		   10000
		)
	 )
	 (setq centroid_c centroid)
	 (charakterystyki_zespolonego)
	 (obliczanie_momentow)
	 (obliczanie_naprezen)
       )
      )

      ((= what_next 6)			;Prompt user to
       (progn
	 (if (not (null obszar_d))
	   (entdel obszar_d)
	 )
	 (if (not (null os_zespolona))
	   (entdel os_zespolona)
	 )

	 (tworzenie_wlasciwosci "ansi34" 140)
	 (setq obszar_d obszar)

	 (setq gorne_wlokna_d gorne_wlokna)
	 (setq dolne_wlokna_d dolne_wlokna)

	 (setq pole_d (/ area 100))	; cm2
	 (setq Jy_d
		(/ (car momentofinertia) 10000)
	 )
	 (setq centroid_d centroid)
	 (charakterystyki_zespolonego)
	 (obliczanie_momentow)
	 (obliczanie_naprezen)


       )
      )


      ((= what_next 10)			;Prompt user to
       (progn
	 (setq na (/ ea ea))
	 (setq nb (/ ea eb))
	 (setq nc (/ ea ec))
	 (setq nd (/ ea ed))
	 (if (not (null os_zespolona))
	   (entdel os_zespolona)
	 )
	 (if (/= pole_zespolonego 0)
	   (progn
	     (charakterystyki_zespolonego)
	     (obliczanie_momentow)
	     (obliczanie_naprezen)
	   )
	 )
       )
      )



      ((= what_next 1)

       (command	"_table" "5" "18" "_width" "25"	"_height" "1" '(0 0))
       (en->vl (entget (entlast)))


       (vla-setcellvalue
	 vlobj
	 0
	 0
	 "DANE DLA CA£EGO PRZEKROJU"
       )
;;;wiersz 1
       (vla-setcellvalue vlobj 1 0 " ")
       (vla-setcellvalue vlobj 1 1 "Przekrój A")
       (vla-setcellvalue vlobj 1 2 "Przekrój B")
       (vla-setcellvalue vlobj 1 3 "Przekrój C")
       (vla-setcellvalue vlobj 1 4 "Przekrój D")
;;;wiersz 2
       (vla-setcellvalue vlobj 2 0 "Modu³ Younga:")
       (vla-setcellvalue vlobj 2 1 (strcat (rtos ea 2 2) " GPa"))
       (vla-setcellvalue vlobj 2 2 (strcat (rtos eb 2 2) " GPa"))
       (vla-setcellvalue vlobj 2 3 (strcat (rtos ec 2 2) " GPa"))
       (vla-setcellvalue vlobj 2 4 (strcat (rtos ed 2 2) " GPa"))
;;;wiersz 3

       (vla-setcellvalue vlobj 3 0 "\"n\":")
       (vla-setcellvalue vlobj 3 1 (strcat (rtos na 2 2) " "))
       (vla-setcellvalue vlobj 3 2 (strcat (rtos nb 2 2) " "))
       (vla-setcellvalue vlobj 3 3 (strcat (rtos nc 2 2) " "))
       (vla-setcellvalue vlobj 3 4 (strcat (rtos nd 2 2) " "))
;;;wiersz 4
       (vla-setcellvalue vlobj 4 0 "Pole powierzchni:")
       (vla-setcellvalue
	 vlobj
	 4
	 1
	 (strcat (rtos pole_a 2 2) " cm2")
       )
       (vla-setcellvalue
	 vlobj
	 4
	 2
	 (strcat (rtos pole_b 2 2) " cm2")
       )
       (vla-setcellvalue
	 vlobj
	 4
	 3
	 (strcat (rtos pole_c 2 2) " cm2")
       )
       (vla-setcellvalue
	 vlobj
	 4
	 4
	 (strcat (rtos pole_c 2 2) " cm2")
       )
;;;wiersz 5
       (vla-setcellvalue vlobj 5 0 "Moment bezw³adnoœci:")
       (vla-setcellvalue vlobj 5 1 (strcat (rtos jy_a 2 2) " cm4"))
       (vla-setcellvalue vlobj 5 2 (strcat (rtos Jy_b 2 2) " cm4"))
       (vla-setcellvalue vlobj 5 3 (strcat (rtos jy_c 2 2) " cm4"))
       (vla-setcellvalue vlobj 5 4 (strcat (rtos jy_d 2 2) " cm4"))
;;;wiersz 6

       (vla-mergecells vlobj 6 6 0 4)
       (vla-mergecells vlobj 7 7 1 4)
       (vla-setcellvalue vlobj 7 0 "Moment:")
       (vla-setcellvalue
	 vlobj
	 7
	 1
	 (strcat (rtos moment_zginajacy 2 2) " kNm")
       )
;;;wiersz 7
       (vla-mergecells vlobj 8 8 1 4)
       (vla-setcellvalue vlobj 8 0 "Si³a osiowa:")
       (vla-setcellvalue
	 vlobj
	 8
	 1
	 (strcat (rtos sila_osiowa 2 2) " kN")
       )

       (vla-mergecells vlobj 9 9 0 4)
       (vla-mergecells vlobj 10 10 0 4)
       (vla-SetCellTextHeight vlobj 10 0 2)
       (vla-SetrowHeight vlobj 10 25)

       (vla-setcellvalue vlobj 10 0 "WYNIKI:")

       (vla-mergecells vlobj 11 11 1 4)
       (vla-setcellvalue
	 vlobj
	 11
	 0
	 "Sprowadzone pole powierzchni:"
       )
       (vla-setcellvalue
	 vlobj
	 11
	 1
	 (strcat (rtos pole_zespolonego 2 2) " cm2")
       )
       (vla-mergecells vlobj 12 12 1 4)
       (vla-setcellvalue
	 vlobj
	 12
	 0
	 "Sprowadzony moment bezw³adnoœci:"
       )
       (vla-setcellvalue
	 vlobj
	 12
	 1
	 (strcat (rtos jy_zespolonego 2 2) " cm4")
       )

       (vla-mergecells vlobj 13 13 0 4)
       (vla-setcellvalue vlobj 14 0 "Momenty w przekrojach:")
       (vla-setcellvalue
	 vlobj
	 14
	 1
	 (strcat (rtos moment_zginajacy_a 2 2) " kNm")
       )
       (vla-setcellvalue
	 vlobj
	 14
	 2
	 (strcat (rtos moment_zginajacy_b 2 2) " kNm")
       )
       (vla-setcellvalue
	 vlobj
	 14
	 3
	 (strcat (rtos moment_zginajacy_c 2 2) " kNm")
       )
       (vla-setcellvalue
	 vlobj
	 14
	 4
	 (strcat (rtos moment_zginajacy_d 2 2) " kNm")
       )

       (vla-setcellvalue vlobj 15 0 "Si³y osiowe w przekrojach:")
       (vla-setcellvalue
	 vlobj
	 15
	 1
	 (strcat (rtos sila_osiowa_a 2 2) " kN")
       )
       (vla-setcellvalue
	 vlobj
	 15
	 2
	 (strcat (rtos sila_osiowa_b 2 2) " kN")
       )
       (vla-setcellvalue
	 vlobj
	 15
	 3
	 (strcat (rtos sila_osiowa_c 2 2) " kN")
       )
       (vla-setcellvalue
	 vlobj
	 15
	 4
	 (strcat (rtos sila_osiowa_d 2 2) " kN")
       )


       (vla-mergecells vlobj 16 16 0 4)
       (vla-mergecells vlobj 17 17 0 4)
       (vla-setcellvalue vlobj 17 0 "Naprê¿enia:")
       (vla-setcellvalue vlobj 18 0 "w³ókna górne:")
       (vla-setcellvalue
	 vlobj
	 18
	 1
	 (strcat (rtos sigma_gw_a 2 2) " MPa")
       )
       (vla-setcellvalue
	 vlobj
	 18
	 2
	 (strcat (rtos sigma_gw_b 2 2) " MPa")
       )
       (vla-setcellvalue
	 vlobj
	 18
	 3
	 (strcat (rtos sigma_gw_c 2 2) " MPa")
       )
       (vla-setcellvalue
	 vlobj
	 18
	 4
	 (strcat (rtos sigma_gw_d 2 2) " MPa")
       )

       (vla-setcellvalue vlobj 19 0 "w³ókna dolne")
       (vla-setcellvalue
	 vlobj
	 19
	 1
	 (strcat (rtos sigma_dw_a 2 2) " MPa")
       )
       (vla-setcellvalue
	 vlobj
	 19
	 2
	 (strcat (rtos sigma_dw_b 2 2) " MPa")
       )
       (vla-setcellvalue
	 vlobj
	 19
	 3
	 (strcat (rtos sigma_dw_c 2 2) " MPa")
       )
       (vla-setcellvalue
	 vlobj
	 19
	 4
	 (strcat (rtos sigma_dw_d 2 2) " MPa")
       )


       (vla-setalignment vlobj 1 5)
       (vla-setcolumnwidth vlobj 0 40)


;;;woersz 0 tytul
       (vla-SetTextHeight vlobj 2 4)
       (vla-SetTextHeight vlobj 4 2)
       (vla-SetTextHeight vlobj 1 2)
       (vla-SetCellTextHeight vlobj 10 0 4)

       (vla-settextstyle vlobj 1 (getvar "textstyle"))
       (vla-settextstyle vlobj 2 (getvar "textstyle"))
       (vla-settextstyle vlobj 4 (getvar "textstyle"))

       (command "_scale" (entlast) "" '(0 0) (getvar "dimscale"))
       (vlax-put-property vlobj 'color 9)


       (vla-SetrowHeight vlobj 14 2)
       (vla-SetrowHeight vlobj 15 2)

       (setq cnt2 0)
       (setq cnt2 0)
       (repeat 20
	 (vla-SetrowHeight vlobj cnt2 2)
	 (setq cnt2 (1+ cnt2))
       )

       (command "_move" (entlast) "" '(0 0) pause)

       (setq cnt2 0)
       (repeat 20
	 (vla-SetrowHeight vlobj cnt2 2)
	 (setq cnt2 (1+ cnt2))
       )

       (princ)

      )






      ((= what_next 0)
       (progn
	 (if (not (null obszar_a))
	   (entdel obszar_a)
	 )
	 (if (not (null obszar_b))
	   (entdel obszar_b)
	 )
	 (if (not (null obszar_c))
	   (entdel obszar_c)
	 )
	 (if (not (null obszar_d))
	   (entdel obszar_d)
	 )
	 (if (not (null os_zespolona))
	   (entdel os_zespolona)
	 )
	 (princ "\n Anulowano.")
       )
      )
    )
  )
  (unload_dialog dcl_id)		; Unload the DCL file.

  (setvar "osmode" osmodeprev)
  (setvar "orthomode" orthoprev)
  (princ)
)









(defun tworzenie_wlasciwosci
			     (styl_kreskowania	 kolor_materialu    /
			      boundary_ss	 hatch_ss	    temp_ss
			      kat_kreskowania	 pkt		    skala_kreskowania
			      boundary_sslist	 hatch_sslist
			     )
  (defun *error* (errorlevel)
    (selection_to_list boundary_ss)
    (setq boundary_sslist sslist)
    (selection_to_list hatch_ss)
    (setq hatch_sslist sslist)
    (foreach item boundary_sslist (entdel item))
    (foreach item hatch_sslist (entdel item))
    (if	(not (null obszar_a))
      (entdel obszar_a)
    )
    (if	(not (null obszar_b))
      (entdel obszar_b)
    )
    (if	(not (null obszar_c))
      (entdel obszar_c)
    )
    (if	(not (null obszar_d))
      (entdel obszar_d)
    )
    (if	(not (null os_zespolona))
      (entdel os_zespolona)
    )
    (princ "\n MadziCAD error: Funkcja przerwana. "
    )
    (princ)
  )
  (graphscr)

  (setq boundary_ss (ssadd))
  (setq hatch_ss (ssadd))
  (setq temp_ss (ssadd))

  (setq kat_kreskowania 0)		;poczatkowy kat kreskowania zeby przez pomylke nie zanzczyc obszaru dwa razy
  (setq
    pkt	(getpoint
	  "\n Wskazuj kolejno punkty w obszarach tworz¹cych przekrój."
	)
  )
  (while (= pkt nil)
    (alert "Musisz wskazaæ jakiœ obszar.")
    (setq pkt
	   (getpoint
	     "\n Wskazuj kolejno punkty w obszarach tworz¹cych przekrój."
	   )
    )
  )



  (while (/= pkt nil)
    (command "_boundary" "_advanced" "_object" "_region" "" "_advanced"	"_island" "_no"	"" "" pkt "")
    (vla-getboundingbox
      (vlax-ename->vla-object
	(cdr (car (entget (entlast))))
      )
      'bbox1
      'bbox2
    )					;narozniki boundingboxa
    (setq dim1 (trans (vlax-safearray->list bbox1) 0 1))

    (setq dim2 (trans (vlax-safearray->list bbox2) 0 1))

    (setq skala_kreskowania
	   (/ (distance dim1 dim2)
	      100
	   )
    )					;ustalenie skali kreskowania

    (ssadd (entlast) boundary_ss)
    (command "_hatch"
	     styl_kreskowania
	     skala_kreskowania
	     kat_kreskowania
	     (entlast)
	     ""
    )
    (vlax-put-property
      (vlax-ename->vla-object (entlast))
      'color
      kolor_materialu
    )					;czerowny
    (ssadd (entlast) hatch_ss)
    (setq pkt (getpoint))
    (setq kat_kreskowania (+ kat_kreskowania 10))
  )

  (selection_to_list hatch_ss)
  (setq hatch_sslist sslist)

  (foreach item hatch_sslist (entdel item))
					; kasowanie pojedynczych kreskowan
  (if (> (sslength boundary_ss) 1)
    (progn (command "_union" boundary_ss "")
	   (setq mass_region (entlast))
    )
    (progn
      (setq mass_region (ssname boundary_ss 0))
    )
  )


  (command "_hatch" styl_kreskowania skala_kreskowania kat_kreskowania mass_region "")

  (ssadd (entlast) temp_ss)
  (vlax-put-property
    (vlax-ename->vla-object (entlast))
    'color
    kolor_materialu
  )					;czerowny


  (setq
    area (vlax-get
	   (vlax-ename->vla-object mass_region)
	   'area
	 )
  )					;powerchnia
  (setq
    centroid (vlax-get (vlax-ename->vla-object mass_region)
		       'centroid
	     )
  )
					;srodek ceizkosci

  (command "_ucs" "_new" centroid)


  (setq	momentofinertia
	 (vlax-get (vlax-ename->vla-object
		     mass_region
		   )
		   'momentofinertia
	 )
  )					;momenty bezwladnosci
  (setq	principaldirections
	 (vlax-get (vlax-ename->vla-object
		     mass_region
		   )
		   'principaldirections
	 )
  )					;glowne kierunki osi centrlanych

  (command "_ucs" "_previous")

  (vla-getboundingbox
    (vlax-ename->vla-object mass_region)
    'bbox1
    'bbox2
  )
  (setq dim1 (trans (vlax-safearray->list bbox1) 0 1))
  (setq dim2 (trans (vlax-safearray->list bbox2) 0 1))

  (setq	gorne_wlokna
	 (max (cadr (trans dim1 1 0)) (cadr (trans dim2 1 0)))
  )
  (setq	dolne_wlokna
	 (min (cadr (trans dim1 1 0)) (cadr (trans dim2 1 0)))
  )



  (entdel mass_region)

					;kat obrotu osi centralnych
  (setq	principalangle
	 (cvunit (atan (/ (caddr principaldirections)
			  (car principaldirections)
		       )
		 )
		 "radians"
		 "degrees"
	 )
  )


					;srodek ciekosci:
  (command "_circle"
	   centroid
	   (/ (distance dim1 dim2) 50)
  )
  (vlax-put-property
    (vlax-ename->vla-object (entlast))
    'color
    (+ kolor_materialu 50)
  )					;czerowny
  (ssadd (entlast) temp_ss)
					;(command "_line" dim1 dim2 "") ;linia bboxa

					;pierwsza os
  (command "_line"
	   (list (* (distance dim1 dim2) -0.25) 0)
	   (list (* (distance dim1 dim2) 0.25) 0)
	   ""
  )
  (vlax-put-property
    (vlax-ename->vla-object (entlast))
    'color
    (+ kolor_materialu 50)
  )					;czerowny
  (ssadd (entlast) temp_ss)
;;;  (command "_rotate"
;;;	   (entlast)
;;;	   ""
;;;	   '(0 0)
;;;	   principalangle
;;;  )
  (command "_move" (entlast) "" '(0 0) centroid)


					;druga os
  (command "_line"
	   (list (* (distance dim1 dim2) -0.25) 0)
	   (list (* (distance dim1 dim2) 0.25) 0)
	   ""
  )
  (vlax-put-property
    (vlax-ename->vla-object (entlast))
    'color
    (+ kolor_materialu 50)
  )					;czerowny
  (ssadd (entlast) temp_ss)
  (command "_rotate"
	   (entlast)
	   ""
	   '(0 0)
	   90
  )
  (command "_move" (entlast) "" '(0 0) centroid)



  (generuj_losowa_nazwe
    "MadziCAD_mass_properties"
  )
  (setq block_temp losowa_nazwa)
  (setq
    base_pt
     (trans
       (cdr
	 (assoc	10
		(entget (ssname temp_ss 0))
	 )
       )
       0
       1
     )
  )
  (command "_block" block_temp base_pt temp_ss "")
  (command "_insert" block_temp base_pt 1 1 0)
  (setq obszar (entlast))

  (princ)
)





;;;zespolooonyyyy
(defun charakterystyki_zespolonego ()

  (setq na (/ ea ea))
  (setq nb (/ ea eb))
  (setq nc (/ ea ec))
  (setq nd (/ ea ed))

  (setq	pole_zespolonego
	 (+ pole_a
	    (/ pole_b nb)
	    (/ pole_c nc)
	    (/ pole_d nd)
	 )
  )

					;odl srodka ciezkosci zeposlonego od srodka ciezkosci M1
  (setq centroid_a (trans centroid_a 1 0))
  (setq centroid_b (trans centroid_b 1 0))
  (setq centroid_c (trans centroid_c 1 0))
  (setq centroid_d (trans centroid_d 1 0))
  (setq dim1 (trans dim1 1 0))
  (setq dim2 (trans dim2 1 0))

  (command "_ucs" "_new" (trans centroid_a 0 1))

  (setq	y_osi_obojetnej_zespolonego
	 (/ (+ (* (/ pole_b nb) (cadr (trans centroid_b 0 1)))
	       (* (/ pole_c nc) (cadr (trans centroid_c 0 1)))
	       (* (/ pole_d nd) (cadr (trans centroid_d 0 1)))
	    )
	    pole_zespolonego
	 )
  )

  (command "_line"
	   (list (* (distance dim1 dim2) -0.5)
		 y_osi_obojetnej_zespolonego
	   )
	   (list (* (distance dim1 dim2) 0.5)
		 y_osi_obojetnej_zespolonego
	   )
	   ""
  )

  (vlax-put-property
    (vlax-ename->vla-object (entlast))
    'color
    1
  )
  (setq os_zespolona (entlast))


  (command "_ucs"
	   "_new"
	   (list 0.0 y_osi_obojetnej_zespolonego)
  )





  (setq	jy_zespolonego
	 (+
	   (+
	     (/ Jy_a na)
	     (/	(* pole_a (expt (/ (cadr (trans centroid_a 0 1)) 10) 2))
		na
	     )
	   )
	   (+
	     (/ Jy_b nb)
	     (/	(* pole_b
		   (expt (/ (cadr (trans centroid_b 0 1)) 10) 2)
		)
		nb
	     )
	   )
	   (+
	     (/ Jy_c nc)
	     (/	(* pole_c
		   (expt (/ (cadr (trans centroid_c 0 1)) 10) 2)
		)
		nc
	     )
	   )
	   (+
	     (/ Jy_d nd)
	     (/	(* pole_d
		   (expt (/ (cadr (trans centroid_d 0 1)) 10) 2)
		)
		nd
	     )
	   )
	 )
  )



  (command "_ucs" "_previous")
  (command "_ucs" "_previous")
  (setq centroid_a (trans centroid_a 0 1))
  (setq centroid_b (trans centroid_b 0 1))
  (setq centroid_c (trans centroid_c 0 1))
  (setq centroid_d (trans centroid_d 0 1))
  (setq dim1 (trans dim1 0 1))
  (setq dim2 (trans dim2 0 1))
  (princ)
)


(defun obliczanie_naprezen ()
  (if (/= jy_zespolonego 0)
    (progn

      (if (/= pole_a 0)
	(progn
	  (setq	sigma_gw_a		;razy minus zeby rociagajace byly z plusem i razy 100 zeby bylo w MPa
		 (+ (/ (* moment_zginajacy
			  -100
			  (- gorne_wlokna_a
			     (caddr (assoc 10 (entget os_zespolona)))
			  )
		       )
		       jy_zespolonego
		    )
		    (/ sila_osiowa pole_zespolonego)

		 )
	  )
	  (setq	sigma_dw_a
		 (+ (/ (* moment_zginajacy
			  -100
			  (- dolne_wlokna_a
			     (caddr (assoc 10 (entget os_zespolona)))
			  )
		       )
		       jy_zespolonego
		    )
		    (/ sila_osiowa pole_zespolonego)
		 )
	  )
	)
      )

      (if (/= pole_b 0)
	(progn
	  (setq	sigma_gw_b
		 (+ (/ (* moment_zginajacy
			  -100
			  (- gorne_wlokna_b
			     (caddr (assoc 10 (entget os_zespolona)))
			  )
		       )
		       jy_zespolonego
		    )
		    (/ sila_osiowa pole_zespolonego)
		 )
	  )
	  (setq	sigma_dw_b
		 (+ (/ (* moment_zginajacy
			  -100
			  (- dolne_wlokna_b
			     (caddr (assoc 10 (entget os_zespolona)))
			  )
		       )
		       jy_zespolonego
		    )
		    (/ sila_osiowa pole_zespolonego)
		 )
	  )
	)
      )

      (if (/= pole_c 0)
	(progn
	  (setq	sigma_gw_c
		 (+ (/ (* moment_zginajacy
			  -100
			  (- gorne_wlokna_c
			     (caddr (assoc 10 (entget os_zespolona)))
			  )
		       )
		       jy_zespolonego
		    )
		    (/ sila_osiowa pole_zespolonego)
		 )
	  )
	  (setq	sigma_dw_c
		 (+ (/ (* moment_zginajacy
			  -100
			  (- dolne_wlokna_c
			     (caddr (assoc 10 (entget os_zespolona)))
			  )
		       )
		       jy_zespolonego
		    )
		    (/ sila_osiowa pole_zespolonego)
		 )
	  )
	)
      )

      (if (/= pole_d 0)
	(progn
	  (setq	sigma_gw_d
		 (+ (/ (* moment_zginajacy
			  -100
			  (- gorne_wlokna_d
			     (caddr (assoc 10 (entget os_zespolona)))
			  )
		       )
		       jy_zespolonego
		    )
		    (/ sila_osiowa pole_zespolonego)
		 )
	  )
	  (setq	sigma_dw_d
		 (+ (/ (* moment_zginajacy
			  -100
			  (- dolne_wlokna_d
			     (caddr (assoc 10 (entget os_zespolona)))
			  )
		       )
		       jy_zespolonego
		    )
		    (/ sila_osiowa pole_zespolonego)
		 )
	  )
	)
      )
    )
  )
  (princ)
)














(defun przekroj_zespolony_help ()
  (alert
    "
\t   HELP:\n
\tProgram oblicza charakterystyki wytrzyma³oœciowe przekroju zespolonego, oraz naprê¿enia 
\t   w przekrojach.\n
\t1.  W pola oznaczone symbolem E nale¿y wpisaæ modu³ Younga oraz wskazaæ obszary na przekroju \t\t
\t   poprzecznym dla ka¿dego rodzaju materia³u.\n
\t2.  Po ka¿dej zmianie modu³u E, wskazaniu obszaru, lub zmianie si³ zewnêtrznych, program sam 
\t   uaktualni dane oraz wyniki.\n
\t3.  W polu \"Przekrój zespolony\" program podaje sprowadzone pole powierzchni przekroju 
\t   zespolonego, oraz sprowadzony moment bezw³adnoœci przekroju zespolonego wzglêdem osi
\t   obojêtnej przekroju zespolonego.\n
\t4.  Jeœli w polu \"Si³y zewnêtrzne\" podano moment zginaj¹cy (dodatni dla rozci¹gania do³em) 
\t   i si³ê osiow¹ (dodatni¹ dla rozci¹gania) dzia³aj¹c¹ na przekrój, program wyliczy równie¿ 
\t   momenty i si³y osiowe dzia³aj¹ce na ka¿dy z obszarów, oraz naprê¿enia w skrajnych w³óknach 
\t   obszarów.\n

\tUWAGI:
\t - Jako materia³ podstawowy brany jest zawsze materia³ A (n=1),a  dla pozosta³ych materia³ów 
\t   program wylicza przekroje ekwiwalentne, np.: materia³ A: stal - 205GPa,
\t   materia³ B: beton B30 - 32.6GPa, opcjonalnie materia³ C np.: stal A-IIIN - 210GPa).
\t - Ka¿dy obszar mo¿na ponownie zdefiniowaæ klikaj¹c w przycisk \"< Wska¿\".
\t - Jeœli zale¿y nam na wykrywaniu wysp nale¿y przekrój przeci¹æ w tym miejscu lini¹.
\t - Bardzo rzadko mog¹ wyst¹piæ problemy z kreskowaniem obszarów - nale¿y wtedy u¿yæ polecenia
\t   \"_REGEN\", lub powiekszyæ kreskowany obszar aby by³ ca³y widoczny na ekranie - jest to
\t   problem wystêpuj¹cy w samym AutoCADzie.


\tPrzyciski:
\tOK\t- Koñczy program i wstawia wyniki obliczeñ do rysunku
\tAnuluj\t- Koñczy program
\tHelp\t- Pomoc programu
\tInfo\t- Informacje
"
  )
  (princ)
)


(defun przekroj_zespolony_info (/ info_message dcl_id)
  (setq	info_message
	 (strcat
	   "PRZEKRÓJ ZESPOLONY v0.9
(c) Kuba Be³ch 2008
kuba.belch@gmail.com\n
WERSJA EDUKACYJNA\n
Program oblicza charakterystyki wytrzyma³oœciowe przekroju zespolonego,
momenty czêœciowe, oraz naprê¿enia w poszczególnych przekrojach.\n
Program jest czêœci¹ programu MadziCAD, wiêcej na www.madzicad.com\n
"
	 )
  )

  (setq	dcl_id (load_dialog
		 (strcat path "\\DCL\\przekroj_zespolony.dcl")
	       )
  )
  (new_dialog "przekroj_zespolony_info" dcl_id)
  (start_dialog)			; Display the dialog 
  (unload_dialog dcl_id)		; Unload the DCL file.
  (princ)
)




(defun obliczanie_momentow ()

  (if (/= jy_zespolonego 0)
    (progn

      (if (/= pole_a 0)
	(progn
	  (setq	moment_zginajacy_a
		 (* (/ Jy_a na) (/ moment_zginajacy jy_zespolonego))
	  )
	  (setq	sila_osiowa_a
		 (*
		   (/ pole_a na)	;Aa/na
		   (+
		     (/ sila_osiowa pole_zespolonego) ;nz/az
		     (/	(* moment_zginajacy
			   100		;razy 100 bo M w kNm a tutaj musi byc w kNcm
			   (/ (- (cadr (trans centroid_a 1 0))
				 (caddr
				   (assoc 10 (entget os_zespolona))
				 )
			      )
			      10
			   )
			)
			jy_zespolonego
		     )
		   )
		 )
	  )
	)
      )


      (if (/= pole_b 0)
	(progn
	  (setq	moment_zginajacy_b
		 (* (/ Jy_b nb) (/ moment_zginajacy jy_zespolonego))
	  )
	  (setq	sila_osiowa_b
		 (*
		   (/ pole_b nb)	;Aa/na
		   (+
		     (/ sila_osiowa pole_zespolonego) ;nz/az
		     (/	(* moment_zginajacy
			   100
			   (/ (- (cadr (trans centroid_b 1 0))
				 (caddr
				   (assoc 10 (entget os_zespolona))
				 )
			      )
			      10
			   )
			)
			jy_zespolonego
		     )
		   )
		 )
	  )
	)
      )


      (if (/= pole_c 0)
	(progn
	  (setq	moment_zginajacy_c
		 (* (/ Jy_c nc) (/ moment_zginajacy jy_zespolonego))
	  )
	  (setq	sila_osiowa_c
		 (*
		   (/ pole_c nc)	;Aa/na
		   (+
		     (/ sila_osiowa pole_zespolonego) ;nz/az
		     (/	(* moment_zginajacy
			   100
			   (/ (- (cadr (trans centroid_c 1 0))
				 (caddr
				   (assoc 10 (entget os_zespolona))
				 )
			      )
			      10
			   )
			)
			jy_zespolonego
		     )
		   )
		 )
	  )
	)
      )

      (if (/= pole_d 0)
	(progn
	  (setq	moment_zginajacy_d
		 (* (/ Jy_d nd) (/ moment_zginajacy jy_zespolonego))
	  )
	  (setq	sila_osiowa_d
		 (*
		   (/ pole_d nd)	;Aa/na
		   (+
		     (/ sila_osiowa pole_zespolonego) ;nz/az
		     (/	(* moment_zginajacy
			   100
			   (/ (- (cadr (trans centroid_d 1 0))
				 (caddr
				   (assoc 10 (entget os_zespolona))
				 )
			      )
			      10
			   )
			)
			jy_zespolonego
		     )
		   )
		 )
	  )
	)
      )
    )
  )
  (princ)
)


;;; czy pole w N/A ma byc zespolone czy nie na razie jest zespolone
;;; zrobic zeby nie wywalal erroa ja sie nic nie kliknie w obszar (nie che mi sie :]
;;;dorobic tabindex
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;;przygotowuje modul mosty zelbetowe do dzialania i ustawia potzrebne zmienne
(vl-load-reactors)
(regapp "MADZICAD_XDATA")		; rejestracaja madzicad do XDATA
(setvar "fielddisplay" 0)		; to to wywala "regenaracja modelu"

;;;towrzenie slownika do listy ellementow i pretow ale to juz w lementach
(if (= (dictsearch (namedobjdict) "madzicad_dictionary") nil)
  (dictadd (namedobjdict)
	   "madzicad_dictionary"
	   (entmakex
	     (list '(0 . "DICTIONARY") '(100 . "AcDbDictionary"))
	   )
  )
)
					;nazwa entycji slwonika madzicada
(setq madzicad_dict
       (cdar (dictsearch (namedobjdict) "madzicad_dictionary"))
)

;;;twortzenie pierwszego elementu "bez nazwy"
(dictadd madzicad_dict
	 "BEZ NAZWY"
	 (entmakex
	   (list '(0 . "DICTIONARY") '(100 . "AcDbDictionary"))
	 )
)


;;;twortzenie w pierwszym elemencie xrecordu "wlasciwosci" oraz slownika "prety"
(dictadd (cdar (dictsearch madzicad_dict "BEZ NAZWY"))
	 "wlasciwosci"
	 (entmakex
	   (append (list '(0 . "XRECORD") '(100 . "AcDbXrecord"))
		   (list (cons 1 "Bez nazwy")
			 (cons 1 "B-30")
			 (cons 1 "0.0")
			 (cons 1 "1")
		   )
	   )
	 )
)
(dictadd (cdar (dictsearch madzicad_dict "BEZ NAZWY"))
	 "PRETY"
	 (entmakex
	   (list '(0 . "DICTIONARY") '(100 . "AcDbDictionary"))
	 )
)

;;;towrzenei zmiennej z lista nazw elementow zeby szybciej sobei je znajdowac w prysszlosci od razu po nazwie
(setq madzicad_LISTA_ELEMENTOW '())
(foreach item (entget madzicad_dict)
  (if (eq 3 (car item))
    (setq madzicad_LISTA_ELEMENTOW
	   (cons (cdr item)
		 madzicad_LISTA_ELEMENTOW
	   )
    )
  )
)

(setq madzicad_LISTA_ELEMENTOW (reverse madzicad_LISTA_ELEMENTOW))

;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:tworz_opis_preta_w_widoku (/
				    layerprev
				    filletradprev
				    osmodeprev
				    numer_preta
				    pkt1
				    ksztalt_preta
				    dlugosc_preta_string
				    srednica_preta_string
				    pkt2
				    skala
				    punkt_wstawienia
				   )	;tworzenie preta
  (defun *error* (errorlevel)
    (setvar "osmode" osmodeprev)
    (setvar "orthomode" orthomodeprev)
    (setvar "clayer" layerprev)
    (princ "\n MadziCAD error: Funkcja przerwana ")
  )

  (setq layerprev (getvar "clayer"))
  (setq osmodeprev (getvar "osmode"))
  (setq orthomodeprev (getvar "orthomode"))
  (setvar "clayer" warwym)
  (setvar "osmode" 0)
  (setvar "orthomode" 0)
  (setq temp_selection (ssadd))
					;dane preta
  (princ "\n Wska¿ prêt w widoku: ")
  (setq ksztalt_preta (nentsel))	;nazwa entycji preta + srodek ciezkosci
  (setq punkt_wstawienia (cadr ksztalt_preta)) ;nazwa entycji preta
  (setq ksztalt_preta (car ksztalt_preta)) ;nazwa entycji preta
  (setq	numer_preta
	 (cdr
	   (nth	1
		(cdadr
		  (assoc -3 (entget ksztalt_preta '("madzicad")))
		)
	   )
	 )
  )
  (setq	klasa_stali
	 (cdr
	   (nth	2
		(cdadr
		  (assoc -3 (entget ksztalt_preta '("madzicad")))
		)
	   )
	 )
  )
  (princ klasa_stali)

					;tworzenie opisu				
					;(rtos (cdr (assoc 43 (entget (ssname ksztalt_preta 0)))))
  (setq	srednica_preta_string
	 (strcat
	   "%<\\AcObjProp Object(%<\\_ObjId "
	   (itoa (vla-get-ObjectId
		   (vlax-ename->vla-object
		     ksztalt_preta
		   )
		 )
	   )
	   ">%).ConstantWidth \\f \"%lu2%pr0%ps[%%c,]\">%"
	 )
  )


;;; WERSJA POD ACAD 2005 OBADAC TO JESZCZE
;;;
;;;  (setq	srednica_preta_string
;;;	 (strcat "%%c"
;;;		 "%<\\AcObjProp Object(%<\\_ObjId "
;;;		 (itoa (vla-get-ObjectId
;;;			 (vlax-ename->vla-object
;;;			   ksztalt_preta
;;;			 )
;;;		       )
;;;		 )
;;;		 ">%).ConstantWidth \f \"%.30q0\">%"  
;;;	 )
;;;  )


  (princ "\n Wska¿ punkt wstawienia opisu: ")

  (setq skala (* (getvar "dimscale") 1)); to w koncu 1000 czy jedne bo juz sam nie wiem:]
					;(setq punkt_wstawienia (trans (cdr (assoc 10 (entget ksztalt_preta))) 0 1))
					;(command "_insert" "MadziCAD_opis_preta_w_widoku" (cdr (assoc 10 (entget ksztalt_preta))) skala skala 0 srednica_preta_string numer_preta)
  (command "_insert"		  "MadziCAD_opis_preta_w_widoku"
	   punkt_wstawienia	  skala
	   skala		  0
	   srednica_preta_string  numer_preta
	  )
  (ssadd (entlast) temp_selection)
  (command "_move" (entlast) "" punkt_wstawienia pause)


  (setq pkt2 (getvar "lastpoint"))
  (setvar "osmode" osmodeprev)
  (setq pkt1 (getpoint pkt2))
  (setvar "osmode" 0)
  (command "_leader" pkt1 pkt2 "" "" "b")
  (ssadd (entlast) temp_selection)

  (generuj_losowa_nazwe "opis_preta_w_widoku")
  (command "_group" "_create" losowa_nazwa "" temp_selection "")


					;  (setq block_name (strcat "pret nr " (rtos numer_preta)))
					;  (command "_block" block_name pkt1 (ssadd ksztalt_preta) (ssadd (entlast)) "")
					;  (command "_insert" block_name pkt1 1 1 0)
  (setvar "osmode" osmodeprev)
  (setvar "orthomode" orthomodeprev)
  (setvar "clayer" layerprev)

					;(command "_regen")
					;(alert (strcat "\n Prêt numer " (rtos numer_preta) " utworzono. "))
  (princ)
)



;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:definiuj_nowy_pret (/		      temp_selection
			     dcl_id	      lista_elementow
			     lista_srednic    lista_klas_stali
			     vlaobj	      nazwa_elementu
			     numer_preta      klasa_stali
			     opis_stali	      xdata_list
			     ent
			    )		;tworzenie preta
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana ")
  )

  (princ "\n Wska¿ poliliniê z której utworzyæ nowy prêt: ")
  (setq temp_selection (ssget "_:S"))
  (setq ent (entget (ssname temp_selection 0) '("*")))

					;wczytanie okienka
  (setq
    dcl_id (load_dialog (strcat path "\\DCL\\definiuj_nowy_pret.dcl"))
  )					; Load the DCL file.
  (if (not (new_dialog "definiuj_nowy_pret" dcl_id))
					; Initialize the dialog.
    (exit)				; Exit if this doesn't work.
  )

					;definioawnie popup list

					;caly slwonik razem ze smieciami pozniej robienie listy tylko z assoc 3 cyzli nazwy elementow



  (start_list "lista_elementow")
  (mapcar 'add_list madzicad_lista_elementow)
					;Specify the AutoLISP list.
  (end_list)


  (setq	lista_srednic
	 '("4"	  "6"	 "8"	"10"   "12"   "14"   "16"   "18"
	   "20"	  "22"	 "24"	"26"   "28"   "30"   "32"   "34"
	   "36"	  "38"	 "40"
	  )
  )
  (start_list "lista_srednic")
  (mapcar 'add_list lista_srednic)	;Specify the AutoLISP list.
  (end_list)


  (setq lista_klas_stali '("A-I" "A-II" "A-III" "A-IIIN"))
  (start_list "lista_klas_stali")
  (mapcar 'add_list lista_klas_stali)	;Specify the AutoLISP list.
  (end_list)

					;========================
					;tutaj moze dorobic zeby sie srednica sama ustawiala na szerokosc polilinii lub najblizsza jej typu 12 14 16 itp a jesli grub 0 to to na 12mm
					;========================



					;nizej zebranie danych z okienka
					;zmiana grubosci polilnii na srednice

  (action_tile
    "dodaj"


    "(setq	nazwa_elementu
	 (nth (atoi (get_tile \"lista_elementow\"))
	      lista_elementow
	 )
  )
  (setq numer_preta (get_tile \"numer_preta\"))
  (setq	srednica_preta
	 (nth (atoi (get_tile \"lista_srednic\"))
	      lista_srednic
	 )
  )
  (setq	klasa_stali
	 (nth (atoi (get_tile \"lista_klas_stali\"))
	      lista_klas_stali
	 )
  )
  (setq opis_stali (get_tile \"opis_stali\"))

  (setq vlaobj (vlax-ename->vla-object (cdr (assoc -1 ent))))
  (vlax-put-property
    vlaobj
    'constantwidth
    (atof srednica_preta)
  )

  (setq	xdata_list
	 (list (list -3
		     (list \"MADZICAD_XDATA\"
			   (cons 1000 nazwa_elementu)
			   (cons 1000 numer_preta)
			   (cons 1000 klasa_stali)
			   (cons 1000 opis_stali)
		     )
	       )
	 )
  )

  (setq ent (append ent xdata_list))
  (entmod ent)
  (princ
    (strcat \"\n Utworzono prêt numer: \" numer_preta \" . \")
  )
  (alert
    (strcat \"\n Utworzono prêt numer: \" numer_preta \" . \")
  )
    (done_dialog)"
  )

  (action_tile "cancel" "(princ \"\n Anulowano.\")")

  (start_dialog)			; Display the dialog  box.
  (unload_dialog dcl_id)		; Unload the DCL file.

;;;odczyt XDATA
;;;(entget (car (entsel)) '("ACAD"))

  (princ)
)


;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
					;=====================================================
(defun c:rozstaw_prety ()		;(/ temp_selection)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana ")
  )
  (setq layerprev (getvar "clayer"))
  (setq osmodeprev (getvar "osmode"))
  (setq orthomodeprev (getvar "orthomode"))
  (setq temp_selection (ssadd))

  (setq ent (nentsel "\n Wska¿ prêt do rozmieszczenia: "))
  (setq ent (entget (car ent)))		;cala entycja
  (setq pick_pt (cdr (assoc 10 ent)))
  (setq pret_zrodlowy_ename (cdr (car ent)))
					;dodawany do temp_selection na koncu jka polecenie wykona sie bez problmeow

  (setq pt1 (getpoint "\n Wska¿ pierwszy punkt kierunkowy: "))
  (setq pt2 (getpoint "\n Wska¿ drugi punkt kierunkowy: " pt1))
  (initget 3)
  (setq rozstaw (getreal "\n Podaj rozstaw prêtów: "))
					; zrobic w okienku

  (setvar "clayer" warwym)
  (setvar "osmode" 0)
  (setvar "orthomode" 0)

  (setq dist_between_rods (abs (- (car pt2) (car (trans pick_pt 0 1)))))
					;odleglosc miedzy pretem a ostatnim punktem po osi X
  (setq liczba_elementów (1+ (fix (/ dist_between_rods rozstaw))))
					;calkowita liczba pretow

  (command "_ucs" "_new" "3" pt1 pt2 "")

  (setq pick_pt (trans pick_pt 0 1))	;punkt bazowy
  (setq	target_pt (list	(+ (car pick_pt) rozstaw)
			(cadr pick_pt)
			(caddr pick_pt)
		  )
  )					;punkt gdzi ema skopiowac 

  (repeat liczba_elementów
    (command "_copy" (nentselp pick_pt) "" pick_pt target_pt)
					;kopiowanie
    (ssadd (entlast) temp_selection)
    (setq target_pt (list (+ (car target_pt) rozstaw)
			  (cadr target_pt)
			  (caddr target_pt)
		    )
    )					;dodaj rozstaw
  )

  (defun *error* (errorlevel)
    (setvar "osmode" osmodeprev)
    (setvar "orthomode" orthomodeprev)
    (setvar "clayer" layerprev)
    (command "_ucs" "_previous")
    (command "_erase" temp_selection "")
    (princ "\n MadziCAD error: Funkcja przerwana ")
  )


  (setq last_pick_pt (cdr (assoc 10 (entget (entlast)))))
  (command "_dimaligned"
	   pick_pt
	   (trans last_pick_pt 0 1)
	   pause
  )					;wymiar rozstawu
  (ssadd (entlast) temp_selection)
  (setq ent (entget (entlast)))
  (setq	ent
	 (subst
	   (cons 1
		 (strcat (rtos liczba_elementów)
			 "x"
			 (rtos (/ rozstaw 10))
			 "=<>"
		 )
	   )				;zmienoiny tekst typu 2x20=40
	   (assoc 1 ent)
	   ent
	 )
  )
  (entmod ent)

  (ssadd pret_zrodlowy_ename temp_selection) ;dodanie pierwzego preta

  (generuj_losowa_nazwe "rozstaw_pretow")
  (command "_group" "_create" losowa_nazwa "" temp_selection "")
					;tworzeni grupy

  (command "_ucs" "_previous")
  (setvar "osmode" osmodeprev)
  (setvar "orthomode" orthomodeprev)
  (setvar "clayer" layerprev)


  (princ "\n Utworzono rozstaw prêtów. ")
  (princ)
)






;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:definiuj_edytuj_nowy_element ()

  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana ")
  )

;;;  (princ "\n Wska¿ poliliniê z której utworzyæ nowy prêt: ")
;;;  (setq temp_selection (ssget "_:S"))
;;;  (setq ent (entget (ssname temp_selection 0) '("*")))

					;wczytanie okienka
  (setq
    dcl_id (load_dialog
	     (strcat path "\\DCL\\definiuj_edytuj_nowy_element.dcl")
	   )
  )					; Load the DCL file.
  (if (not (new_dialog "definiuj_edytuj_nowy_element" dcl_id))
					; Initialize the dialog.
    (exit)				; Exit if this doesn't work.
  )

;;;;definioawnie popup list
  (setq klasa_betonu '("B-20" "B-30" "B-35" "B-40"))
  (start_list "klasa_betonu")
  (mapcar 'add_list klasa_betonu)
  (end_list)


;;;  zapelnianie listboxow
;;;ladowanie listy elementow
  (start_list "lista_elementow")
  (mapcar 'add_list madzicad_lista_elementow)
  (end_list)

  ;;tworzenie listy z klasami betonow
  (setq temp_list '())
  (foreach item	madzicad_lista_elementow
    (setq
      temp_list
       (cons (cdr (nth 10
		       (dictsearch
			 (cdar (dictsearch madzicad_dict item))
			 "wlasciwosci"
		       )
		  )
	     )
	     temp_list
       )
    )
  )
  (start_list "lista_klasa_betonu")
  (mapcar 'add_list temp_list)
  (end_list)



  ;;tworzenie listy z V betonow  
  (setq temp_list '())
  (foreach item	madzicad_lista_elementow
    (setq
      temp_list
       (cons (cdr (nth 11
		       (dictsearch
			 (cdar (dictsearch madzicad_dict item))
			 "wlasciwosci"
		       )
		  )
	     )
	     temp_list
       )
    )
  )
  (start_list "lista_V_betonu")
  (mapcar 'add_list temp_list)
  (end_list)


  ;;tworzenie listy z liczbami elementow  
  (setq temp_list '())
  (foreach item	madzicad_lista_elementow
    (setq
      temp_list
       (cons (cdr (nth 12
		       (dictsearch
			 (cdar (dictsearch madzicad_dict item))
			 "wlasciwosci"
		       )
		  )
	     )
	     temp_list
       )
    )
  )
  (start_list "lista_liczba_elementow")
  (mapcar 'add_list temp_list)
  (end_list)


;;;nizej zebranie danych z okienka
  (action_tile
    "dodaj"
    "(dictadd madzicad_dict (get_tile \"nazwa_elementu\")
	 (entmakex
	   (list '(0 . \"DICTIONARY\") '(100 . \"AcDbDictionary\"))
	 )
)

    (dictadd (cdar(dictsearch madzicad_dict (get_tile \"nazwa_elementu\")))
    	 \"wlasciwosci\"
	 (entmakex
	   (append (list '(0 . \"XRECORD\") '(100 . \"AcDbXrecord\"))
		   (list (cons 1 (get_tile \"nazwa_elementu\"))
			 (cons 1 (nth (atoi (get_tile \"klasa_betonu\")) klasa_betonu))
			 (cons 1 (get_tile \"V_betonu\"))
			 (cons 1 (get_tile \"liczba_elementow\"))
		   )
	   )
	 )
)

(dictadd (cdar(dictsearch madzicad_dict (get_tile \"nazwa_elementu\")))
	 \"PRETY\"
	 (entmakex
	   (list '(0 . \"DICTIONARY\") '(100 . \"AcDbDictionary\"))
	 )
)



  (princ
    (strcat \"\n Utworzono nowy element : \" (get_tile \"nazwa_elementu\") \" . \")
  )
  (alert
    (strcat \"\n Utworzono nowy element : \" (get_tile \"nazwa_elementu\") \" . \")
  )
    (done_dialog)"
  )

  (action_tile "anuluj" "(princ \"\n Anulowano.\")")


  (start_dialog)			; Display the dialog  box.
  (unload_dialog dcl_id)		; Unload the DCL file.

;;;towrzenei zmiennej z lista nazw elementow zeby szybciej sobei je znajdowac w prysszlosci od razu po nazwie
  (setq madzicad_LISTA_ELEMENTOW '())
  (foreach item	(entget madzicad_dict)
    (if	(eq 3 (car item))
      (setq madzicad_LISTA_ELEMENTOW
	     (cons (cdr item)
		   madzicad_LISTA_ELEMENTOW
	     )
      )
    )
  )
  (setq madzicad_LISTA_ELEMENTOW (reverse madzicad_LISTA_ELEMENTOW))

;;;odczyt XDATA
;;;(entget (car (entsel)) '("ACAD"))

  (princ)
)

;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun oblicz_promien_giecia (srednica)
 (setq promien_giecia (* 0.5 (* 5 srednica)))
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;funkcja zamienia zaznaczenie na liste

(defun Selection_To_List (ss / sscnt)
  (setq sscnt 0)
  (setq sslist nil)
  (repeat (sslength ss)
    (setq sslist (cons (ssname ss sscnt) sslist))
    (setq sscnt (1+ sscnt))
  )
  (princ)
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;waga bitu w DEC z helpa, np dla wartosci 16 -> 16=2^4 czyli 4+1=5 -> 5 bit
(defun check_bit_value(liczba waga_bitu / numer_bitu temp_liczba)
;;ustalanie numeru bitu na podst wagi
  (setq numer_bitu 0)
  (setq bit_value 0)
  (setq temp_liczba liczba)

  (while (= bit_value 0)
    (setq bit_value (rem waga_bitu 2))
    (setq waga_bitu (/ waga_bitu 2))
    (setq numer_bitu (+ numer_bitu 1))
  )

;;ustalanie wartosci szukanego bitu
  (repeat numer_bitu
    (setq bit_value (rem liczba 2))
    (setq liczba (/ liczba 2))
  )
  (princ)
)  
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;funkcja genruje losowa nazwe z prefiksem i zapisuje do zmiennej: losowa_nazwa
;skladnia:  (generuj_losowa_nazwe "<prefix>")

(defun generuj_losowa_nazwe (prefix)  
  (setq luprecprev (getvar "luprec"))
  (setvar "luprec" 8)
  (setq losowa_nazwa
    (strcat prefix "_" (substr (rtos (getvar "date")) 12))
  )
  (setvar "luprec" luprecprev)
  (princ)
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun wartosc_wlasciwosci(zaznaczenie numer_wlasciwosci)
  (setq wlasciwosc 
    (cdr (assoc numer_wlasciwosci (entget (ssname zaznaczenie 0))))
  )
  (princ)
)

;(cdr (assoc 62 (entget (ssname (ssget "_:S") 0))))

;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun zmiana_wlasciwosci (zaznaczenie numer_wlasciwosci nowa_wartosc / entlist)
  (if (= (listp zaznaczenie) nil)
    (setq entlist (entget (ssname zaznaczenie 0)))
    (setq entlist zaznaczenie)
  )
  (setq entlist
    (subst 
      (cons numer_wlasciwosci nowa_wartosc) 
      (assoc numer_wlasciwosci entlist) 
      entlist
    )
  )
 (entmod entlist)
 (princ)
)

;(setq ent (subst (cons 10 3000) (assoc 10 ent) ent))


; to cos nei zawsze dziala nie wiem czemu://
;zmiana wlasciwosci VLA
(defun put_property (zaznaczenie nazwa_wlasciwosci nowa_wartosc / entlist)
  (if (= (listp zaznaczenie) nil)
    (setq entlist (entget (ssname zaznaczenie 0)))
    (setq entlist zaznaczenie)
  )
  
  (setq vlaobj (vlax-ename->vla-object (cdr(assoc -1 ent))))
  (princ vlaobj)
  (vlax-put-property vlaobj nazwa_wlasciwosci nowa_wartosc)
  (princ)

)

;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:wersja()
    (alert "\n Zainstalowana wersja:\n     MadziCAD v0.022")
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                  ;;
;;      kuba miszcz 2007 :]         ;;
;;  kontakt: zielonyeufor@o2.pl     ;;
;;                                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun c:kompilator()  ;kompilator
  ;; program laczy uzywane LISPy
  (defun *error* (errorlevel)
    (alert (strcat
    "\n  MadziCAD error:\n"
    "\n  B³¹d podczas kompilacji: " script "\n"
    "\n  dolaczanie do <madzicad source> przerwane. "
    ))
    (princ)
  )
 
  (setq path (vl-registry-read "HKEY_local_machine\\software\\madzicad\\" "path"))       ;domyslna sciezka
  (setq filedest (open (strcat path "\\madzicad sources\\madzicad_source.lsp") "w"))
  (write-line "" filedest)
  (close filedest)
  (setq filedest (open (strcat path "\\madzicad sources\\madzicad_source.lsp") "a"))
   
  (setq list_license_apps 
    (list                                       ;poczatek listy
    "random_number"                             ;1
    "check_license_full"                        ;2
    "madzicad_begin"                            ;3
    )                                           ;koniec listy
  )

  ;ladowanie funkcji
  (foreach script list_license_apps
    (progn
      (setq filesource (open (strcat path "\\madzicad sources\\MadziCAD Engine\\MadziCAD Main\\Funkcje Pomocnicze" "\\" script ".lsp") "r"))
      (write-line ";;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV" filedest)
      (write-line ";;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV" filedest)
      (write-line ";;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV" filedest)
      (setq line (read-line filesource))
      (while (/= line nil)
        (write-line line filedest)
        (setq line (read-line filesource))
      )
      (write-line ";;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^" filedest)
      (write-line ";;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^" filedest)
      (write-line ";;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^" filedest)
      (write-line ";;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^" filedest)
      (close filesource)
    )
  ) 
  (princ "\n  <sprawdzanie licencji> dolaczono pomyœlnie. ")
  ;*                                                                *
  ;;*****************************************************************
  
  
  
  
  ;;***************************************************
  ;;            LISTA FUNKCJI GLOWNYCH                *
  ;;***************************************************
  ;;                                                  *
  (setq list_Madzicad_main_apps 
    (list                                       ;poczatek listy
    "init_and_settings_madzicad_main"           ;1   
    "przerwij_w_punkcie"                        ;2
    "warstwy"                                   ;3
    "wymiar_liniowy"                            ;4
    "wymiar_normalny"                           ;5
    "wymiar_wspolrzednych"                      ;6
    "madzicad_reload"                           ;7
    "przesun_poprzednie"                        ;8
    "kopiuj_poprzednie"                         ;9
    "skaluj_poprzednie"                         ;10
    "obrot_poprzednie"                          ;11
    "typowy_tekst"                              ;12
    "szybki_luw_zmiana"                         ;60
    "szybki_luw"                                ;13
    "szybki_luw_globalny"                       ;14
    "skala_rysowania"                           ;15
    "obszar_papieru"                            ;16
    "spadek"                                    ;17
    "szybki_wybor"                              ;18
    "papier_model"                              ;19
    "rzutnie_zablokuj_odblokuj"                 ;20
    "skaluj_xy"                                 ;21
    "ukryj_warstwe_obiektu"                     ;22
    "ukryj_warstwy_oprocz_warstwy_obiektu"      ;23
    "odkryj_wszystkie_warstwy"                  ;24
    "txt_na_mtxt"                               ;25
    "ustal_warstwe_obiektu_aktualna"            ;26
    "przenies_na_aktualna_warstwe"              ;27
    "szybki_szyk"                               ;28
    "zamknij_otworz_warstwe_obiektu"            ;39
    "zamknij_otworz_warstwy"                    ;30
    "otworz_wszystkie_warstwy"                  ;31
    ;"szybka_grupa"                              ;32
    ;"rozbij_grupe"                              ;33
    "linia_uciecia"                             ;34
    "ukryj_odkryj_obiekty"                      ;35
    "zmiana_tekstu_wymiarowego"                 ;36
    "wymiar_wspolrzednych_kilometraz"           ;37
    "nachylenie"                                ;38
    "utnij_linia"                               ;39
    "wydluz_linia"                              ;40
    "wymiar_szeregowy"                          ;41***
    "linia_odniesienia"                         ;42
    "zoom_wszystko"                             ;43
    "zoom_poprzedni"                            ;44
    "zoom_okno"                                 ;45
    "convert_to_uppercase"                      ;46
    "szybki_blok"                               ;47
    "szybki_obrot"                              ;48
    "typowe_kreskowania"                        ;49***
    "pole_powierzchni"                          ;50
    "madzicad_przesun"                          ;51
    "linie_niewidoczne"                         ;52
    "linie_osie"                                ;53
    "dopasuj_baze_wspolrzednych"                ;54
    "szybkie_lustro"                            ;56
    "wybierz_obiekty_na_warstwie"               ;57
    "szybka_skala"                              ;58
    "polacz_polilinie"                          ;59
    "style_wymiarowania"                        ;61 a 60jest wyzej
    "wymiar_katowy"                             ;62
    "regen_wszystko"                            ;63
    "polprosta"                                 ;64
    "madzicad_distance"                         ;65
    "dwusieczna"                                ;66
    "zapamietaj_baze_wspolrzednych"             ;67
    "zamknij_otworz_wlasciwosci"                ;68
    "za"                                        ;69
    "madzicad_massprop"                         ;70
    "szybki_obrot_z_kopiowaniem"                ;71
    "policz_obiekty"                            ;72
    "przekroj_zespolony"                        ;73
    )                                           ;koniec listy
  )                                      

  ;ladowanie funkcji podstawowych:
  (foreach script list_madzicad_main_apps 
    (progn
      (setq filesource (open (strcat path "\\madzicad sources\\MadziCAD Engine\\MadziCAD Main" "\\" script ".lsp") "r"))
      (write-line ";;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV" filedest)
      (write-line ";;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV" filedest)
      (write-line ";;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV" filedest)
      (setq line (read-line filesource))
      (while (/= line nil)
        (write-line line filedest)
        (setq line (read-line filesource))
      )
      (write-line ";;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^" filedest)
      (write-line ";;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^" filedest)
      (write-line ";;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^" filedest)
      (write-line ";;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^" filedest)
      (close filesource)
    )
  )
  (princ "\n  <MadziCAD Main> do³¹czono pomyœlnie. ") 
  ;;*                                                               *
  ;;*****************************************************************


  ;;*************************************************
  ;;        LISTA FUNKCJI "MOSTY Zelbet"            *
  ;;*************************************************
  ;;                                                *
  ;ladowanie funkcji mosty:
  (setq list_madzicad_mosty_zelbet_apps
    (list                                           ;poczatek listy
    "init_and_settings_madzicad_mosty_zelbet"       ;1
    "tworz_opis_preta_w_widoku"                     ;2
    "definiuj_nowy_pret"                            ;3
    "rozstaw_prety"                                  ;4
    "definiuj_edytuj_nowy_element"                  ;5
    
    
    
    "funkcje pomocnicze\\oblicz_promien_giecia"     ;101
    
  ;  "temp\\att"                                    ;**
  ;  "temp\\att2"                                   ;**
    
    )                                               ;koniec listy
  )

  ;ladowanie funkcji mosty:
  (foreach script list_madzicad_mosty_zelbet_apps
    (progn
      (setq filesource (open (strcat path "\\madzicad sources\\MadziCAD Engine\\MadziCAD Mosty Zelbet" "\\" script ".lsp") "r"))
      (write-line ";;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV" filedest)
      (write-line ";;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV" filedest)
      (write-line ";;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV" filedest)
      (setq line (read-line filesource))
      (while (/= line nil)
        (write-line line filedest)
        (setq line (read-line filesource))
      )
      (write-line ";;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^" filedest)
      (write-line ";;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^" filedest)
      (write-line ";;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^" filedest)
      (write-line ";;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^" filedest)
      (close filesource)
    )
  )
  (princ "\n  <MadziCAD Mosty Zelbet> dolaczono pomyœlnie. ")
  ;;*                                                               *
  ;;*****************************************************************

  ;;*************************************************
  ;;*              FUNKCJE POMOCNICZE               *
  ;;*************************************************
  ;;*                                               *
  (setq list_madzicad_internal_apps 
    (list                                       ;poczatek listy
    "selection_to_list"                         ;1
    "check_bit_value"                           ;2
    "generuj_losowa_nazwe"                      ;3
    "wartosc_wlasciwosci"                       ;4
    "zmiana_wlasciwosci"                        ;5
    ;"random_number"                             ;6
    "wersja"                                    ;7
    "kompilator"                                ;8
    "madzicad_end"                              ;9
    "madzicad_repair"                           ;10
    "external_apps"                             ;11
    "ent_to_vlobj"                              ;12
    )                                           ;koniec listy
  )

  ;ladowanie funkcji
  (foreach script list_madzicad_internal_apps
    (progn
      (setq filesource (open (strcat path "\\madzicad sources\\MadziCAD Engine\\MadziCAD Main\\Funkcje Pomocnicze" "\\" script ".lsp") "r"))
      (write-line ";;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV" filedest)
      (write-line ";;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV" filedest)
      (write-line ";;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV" filedest)
      (setq line (read-line filesource))
      (while (/= line nil)
        (write-line line filedest)
        (setq line (read-line filesource))
      )
      (write-line ";;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^" filedest)
      (write-line ";;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^" filedest)
      (write-line ";;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^" filedest)
      (write-line ";;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^" filedest)
      (close filesource)
    )
  ) 
  (close filedest)
  ;*                                                                *
  ;;*****************************************************************

  ;;*************************************************
  ;;*                    All OK                     *
  ;;*************************************************
  (princ "\n\n dolaczanie... All OK. ")
  (vlisp-compile 'st "c:\\program files\\madzicad\\madzicad sources\\madzicad_source.lsp" "c:\\program files\\madzicad\\madzicad_bin.fas")
  (princ "\n\n kompilowanie... All OK. ")
  ;;*                                               *
  ;;*************************************************
  (princ)
  (c:madzicad_reload)
)

;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(princ "\n  Funkcjê: <MadziCAD Main> za³adowano pomyœlnie. ") 
(princ "\n  Funkcjê: <MadziCAD Mosty Zelbet> za³adowano pomyœlnie. ")
(princ "\n  Funkcjê: <Funkcje Pomocnicze> za³adowano pomyœlnie. ")
(if (= (open (strcat path "\\support\\MadziCAD_splash_screen.exe") "r") nil)
  (alert "\n Brak pliku MadziCADa.\t")
)
(startapp (strcat path "\\support\\MadziCAD_splash_screen.exe"))
(princ "\n\n © MadziCAD... All OK. ")
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
(defun c:maski_off (/ temp_selection n n2 sslist entlist dim_last dim_style_name)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  ;wylaczanie masek w tekstach
  (setq temp_selection (ssget "_X" '((0 . "MTEXT"))))
  (selection_to_list temp_selection)
  (setq n 0)
  (foreach item sslist 
    (progn 
      (setq entlist (entget item))
      (setq entlist
        (subst 
          (cons 90 2) 
          (assoc 90 entlist) 
          entlist
        )
      )
      (entmod entlist)
      (setq n (1+ n))
    )
  )
; wylaczanie masek w stylach wymiarowania
  (setq dim_last (getvar "dimstyle"))
  (setq dim_style_name (cdr (assoc 2 (tblnext "dimstyle" t))))
  (command "_dimstyle" "_restore" dim_style_name)
  (setvar "dimtfill" 0)
  (command "_dimstyle" "_save" dim_style_name "_yes")
  (setq n2 1)
  (while (/= dim_style_name nil)
    (setq dim_style_name (cdr (assoc 2 (tblnext "dimstyle"))))
    (command "_dimstyle" "_restore" dim_style_name)
    (setvar "dimtfill" 0)
    (command "_dimstyle" "_save" dim_style_name "_yes")
    (setq n2 (1+ n2))
  )
  (command "_dimstyle" "_restore" dim_last)
  (alert (strcat " MadziCAD: Maski w tekstach i stylach wymiarowania usuniete. "))
    
  (princ)
)
;============================
;============================
;============================
;============================
(defun c:madzicad_repair (/ temp_selection n n2 sslist entlist dim_last dim_style_name layercolor)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (message_text "\n Madzicad Repair: \n" "w")
  
  ;(setq message "\n Madzicad Repair: \n")
  
  ;wszystkie obekty jak wartswa
  (if (= wszystkie_obiekty_jak_warstwa 1)
    (progn
      (setq temp_selection (ssget "_X"))
      (if (/= temp_selection nil)
        (progn
          (command "_chprop" temp_selection "" "_color" "bylayer" "_ltype" "bylayer" "_lweight" "bylayer" "")
          (message_text "  Zmieniono w³aœciwoœci wszystkich obiektów na => JakWarstwa      " "a")
          ;(setq message (strcat message "\n Zmieniono w³aœciwoœci wszystkich obiektów na => JakWarstwa"))
        )
      )
    )
  )
  

  ;ustawianie danych do repair
  (setvar "cecolor" "256")                    ;kolor 256=jak warstwa 
  (setvar "celtscale" 1)                   ;skala rodzaju linii obiektu 1=1
  (setvar "celtype" "bylayer")              ;rodzaj linii
  (setvar "celweight" -1)                   ;szerokosc linii "-1" -> jak warstwa

  ;naprawianie warstw
  (if (= stworz_lub_popraw_brakujace_warstwy 1)
    (progn
      (setq layer_prev (getvar "clayer"))
      
      (setq file (open (strcat path "\\support\\settings.dat") "r"))
      (repeat 14 (read-line file))  
      (setq n 0)
      (repeat 10
        (setq layername (read-line file))
        (setq layercolor (read-line file))
        (if (> (strlen layercolor) 3)
          (setq layercolor (atoi(substr layercolor 1 1)))
          (setq layercolor (atoi layercolor))
        )    
        (setq layertype (read-line file))
        (setq layerthickness (read-line file))   
        (read-line file)
        (if (tblsearch "layer" layername)
          (progn
            (command "_layer" "_set" layername "_color" layercolor "" "_ltype" layertype "" "_lweight" layerthickness "" "")
          )
          (progn
            (command "_layer" "_make" layername "_color" layercolor "" "_ltype" layertype "" "_lweight" layerthickness "" "")
          )
        )
        (setq warstwanr_x (strcat "warstwanr" (itoa n)))
        (set (read warstwanr_x) layername)
        (setq n (+ n 1))
      )
      (setvar "clayer" layer_prev)
      ;(setq message (strcat message "\n Warstwy: kolory, rodzaje i szerokoœci linii ustawione lub poprawione"))  
      (message_text "  Warstwy: kolory, rodzaje i szerokoœci linii ustawione lub poprawione      " "a")  
    )
  )
  

;tworzenie brakujacych blokow
;(command "_ucs" "_world")
  (if (= stworz_brakujace_bloki 1)
    (progn
      (setq internal_blocks_list
        (list 
          (list "MadziCAD_kota" (list '(0 . "LWPOLYLINE") '(5 . "1528") '(100 . "AcDbEntity") '(67 . 0) '(410 . "Model") '(8 . "0") '(100 . "AcDbPolyline") '(90 . 4) '(70 . 0) '(43 . 0.0) '(38 . 0.0) '(39 . 0.0) '(10 0.0 0.0) '(40 . 0.0) '(41 . 0.0) '(42 . 0.0) '(10 100.0 173.0) '(40 . 0.0) '(41 . 0.0) '(42 . 0.0) '(10 -100.0 173.0) '(40 . 0.0) '(41 . 0.0) '(42 . 0.0) '(10 0.0 0.0) '(40 . 0.0) '(41 . 0.0) '(42 . 0.0) '(210 0.0 0.0 1.0)))
          (list "MadziCAD_spadek_w_prawo" (list '(0 . "LWPOLYLINE") '(5 . "153E") '(100 . "AcDbEntity") '(67 . 0) '(410 . "Model") '(8 . "0") '(100 . "AcDbPolyline") '(90 . 4) '(70 . 0) '(43 . 0.0) '(38 . 0.0) '(39 . 0.0) '(10 -400.0 -140.0) '(40 . 0.0) '(41 . 0.0) '(42 . 0.0) '(10 900.0 -140.0) '(40 . 0.0) '(41 . 0.0) '(42 . 0.0) '(10 400.0 0.0) '(40 . 0.0) '(41 . 0.0) '(42 . 0.0) '(10 400.0 -140.0) '(40 . 0.0) '(41 . 0.0) '(42 . 0.0) '(210 0.0 0.0 1.0)))
          (list "MadziCAD_spadek_w_lewo" (list '(0 . "LWPOLYLINE") '(5 . "1541") '(100 . "AcDbEntity") '(67 . 0) '(410 . "Model") '(8 . "0") '(100 . "AcDbPolyline") '(90 . 4) '(70 . 0) '(43 . 0.0) '(38 . 0.0) '(39 . 0.0) '(10 400.0 -140.0) '(40 . 0.0) '(41 . 0.0) '(42 . 0.0) '(10 -900.0 -140.0) '(40 . 0.0) '(41 . 0.0) '(42 . 0.0) '(10 -400.0 0.0) '(40 . 0.0) '(41 . 0.0) '(42 . 0.0) '(10 -400.0 -140.0) '(40 . 0.0) '(41 . 0.0) '(42 . 0.0) '(210 0.0 0.0 1.0)))
        )
      )

      (foreach item internal_blocks_list 
        (progn
          (if 
            (= (tblsearch "block" (car item)) nil)
            (progn
              (setq n (1- (length item)))
              (setq temp_selection (ssadd)) 
              (repeat n
                (entmake (nth n item))
                (ssadd (entlast) temp_selection)
                (setq n (1- n))
              )
              (command "_block" (car item) '(0 0) temp_selection "")
              (setq message nil) 
              (setq message (strcat "  Dodano brakuj¹cy blok: \"" (car item) "\". "))
              (message_text message "a")
            )
          )
        )
      )
    )
  )

;style wymairowania madicada
  (if (= dodaj_brakujace_style_wymiarowania 1)
    (progn
      ;styl tekstu do wymairow 
      (if (= (tblsearch "style" "0.7") nil)
        (progn
          (command "_style" "0.7" "simplex.shx" 0.00 0.7 0 "_no" "_no" "_no")
          (setq message nil) 
          (setq message (strcat message "\n Styl tekstu \"0.7\" ustawiono. "))
          (message_text message "a")
        )
      )
      
    
      ;bloki do wymiarowania
      (setq internal_blocks_list
        (list 
          (list "MadziCAD_strzalka_linii_odniesienia" (list '(0 . "SOLID") '(5 . "C28D") '(100 . "AcDbEntity") '(67 . 0) '(410 . "Model") '(8 . "0") '(100 . "AcDbTrace") '(10 -2.0 0.333333 0.0) '(11 0.0 0.0 0.0) '(12 -2.0 -0.333333 0.0) '(13 -2.0 -0.333333 0.0) '(39 . 0.0) '(210 0.0 0.0 1.0)))
          (list "MadziCAD_znacznik" (list '(0 . "LINE") '(5 . "1520") '(100 . "AcDbEntity") '(67 . 0) '(410 . "Model") '(8 . "0") '(100 . "AcDbLine") '(10 -1.0 0.0 0.0) '(11 1.0 0.0 0.0) '(210 0.0 0.0 1.0))
                           (list '(0 . "LINE") '(5 . "151E") '(100 . "AcDbEntity") '(67 . 0) '(410 . "Model") '(8 . "0") '(100 . "AcDbLine") '(10 0.0 1.0 0.0) '(11 0.0 -1.0 0.0) '(210 0.0 0.0 1.0))
                           (list '(0 . "LWPOLYLINE") '(5 . "151F") '(100 . "AcDbEntity") '(67 . 0) '(410 . "Model") '(8 . "0") '(100 . "AcDbPolyline") '(90 . 2) '(70 . 0) '(43 . 0.1) '(38 . 0.0) '(39 . 0.0) '(10 0.5 0.5) '(40 . 0.1) '(41 . 0.1) '(42 . 0.0) '(10 -0.5 -0.5) '(40 . 0.1) '(41 . 0.1) '(42 . 0.0) '(210 0.0 0.0 1.0))
          )
        )
      )

      (foreach item internal_blocks_list 
        (progn
          (if 
            (= (tblsearch "block" (car item)) nil)
            (progn
              (setq n (1- (length item)))
              (setq temp_selection (ssadd)) 
              (repeat n
                (entmake (nth n item))
                (ssadd (entlast) temp_selection)
                (setq n (1- n))
              )
              (command "_block" (car item) '(0 0) temp_selection "")
              ; (setq message nil) 
              ; (setq message (strcat "  Dodano brakuj¹cy blok: \"" (car item) "\". "))
              ; (message_text message "a")
            )
          )
        )
      )

      (setq dimstyle_prev (getvar "dimstyle"))
      (if (tblsearch "dimstyle" "1do10_MadziCAD")
        (command "_dimstyle" "_save" "1do10_MadziCAD" "_yes")
        (command "_dimstyle" "_save" "1do10_MadziCAD")
      )

      (setvar "DIMADEC"     1)         ;Angular decimal places
      (setvar "DIMALT"      0)                  ;Alternate units selected
      (setvar "DIMALTD"     2     )               ;Alternate unit decimal places
      (setvar "DIMALTF"     0.04  )               ;Alternate unit scale factor
      (setvar "DIMALTRND"   0.00  )               ;Alternate units rounding value
      (setvar "DIMALTTD"    2     )               ;Alternate tolerance decimal places
      (setvar "DIMALTTZ"    0     )               ;Alternate tolerance zero suppression
      (setvar "DIMALTU"     2     )               ;Alternate units
      (setvar "DIMALTZ"     0     )               ;Alternate unit zero suppression
      (setvar "DIMAPOST"    "."      )               ;Prefix and suffix for alternate text
      (setvar "DIMASSOC"    2     )
      (setvar "DIMASZ"      1.50  )               ;Arrow size
      (setvar "DIMATFIT"    3     )               ;Arrow and text fit
      (setvar "DIMAUNIT"    0     )               ;Angular unit format
      (setvar "DIMAZIN"     2     )               ;Angular zero supression
      (setvar "DIMBLK"      "MadziCAD_znacznik")  ;Arrow block name
      (setvar "DIMBLK1"     ".")      ;First arrow block name
      (setvar "DIMBLK2"     ".")      ;Second arrow block name
      (setvar "DIMCEN"      2.00  )               ;Center mark size
      (setvar "DIMCLRD"     256   )           ;Dimension line and leader color
      (setvar "DIMCLRE"     256   )               ;Extension line color
      (setvar "DIMCLRT"     2     )               ;Dimension text color
      (setvar "DIMDEC"      1     )               ;Decimal places
      (setvar "DIMDLE"      1.50  )               ;Dimension line extension
      (setvar "DIMDLI"      0.00  )               ;Dimension line spacing
      (setvar "DIMDSEP"     ","   )               ;Decimal separator
      (setvar "DIMEXE"      1.50  )               ;Extension above dimension line
      (setvar "DIMEXO"      1.00  )               ;Extension line origin offset
      (setvar "DIMFRAC"     0     )               ;Fraction format
      (setvar "DIMGAP"      0.50  )               ;Gap from dimension line to text
      (setvar "DIMJUST"     0     )               ;Justification of text on dimension line
      (setvar "DIMLDRBLK"   "MadziCAD_strzalka_linii_odniesienia") ;Leader block name
      (setvar "DIMLFAC"     0.10  )               ;Linear unit scale factor
      (setvar "DIMLIM"      0)               ;Generate dimension limits
      (setvar "DIMLUNIT"    2     )               ;Linear unit format
      (setvar "DIMLWD"      -1    )               ;Dimension line and leader lineweight
      (setvar "DIMLWE"      25    )               ;Extension line lineweight
      (setvar "DIMPOST"     "."    )               ;Prefix and suffix for dimension text
      (setvar "DIMRND"      0.50  )               ;Rounding value
      (setvar "DIMSAH"      0)               ;Separate arrow blocks
      (setvar "DIMSCALE"    10.00 )              ;Overall scale factor
      (setvar "DIMSD1"      0)               ;Suppress the first dimension line
      (setvar "DIMSD2"      0)               ;Suppress the second dimension line
      (setvar "DIMSE1"      1 )               ;Suppress the first extension line
      (setvar "DIMSE2"      1 )               ;Suppress the second extension line
      (setvar "DIMSOXD"     0)               ;Suppress outside dimension lines
      (setvar "DIMTAD"      1     )               ;Place text above the dimension line
      (setvar "DIMTDEC"     1     )               ;Tolerance decimal places
      (setvar "DIMTFAC"     1.00  )               ;Tolerance text height scaling factor
      (setvar "DIMTIH"      0)                  ;Text inside extensions is horizontal
      (setvar "DIMTIX"      1 )                  ;Place text inside extensions
      (setvar "DIMTM"       0.00  )               ;Minus tolerance
      (setvar "DIMTMOVE"    2     )               ;Text movement
      (setvar "DIMTOFL"     1 )                 ;Force line inside extension lines
      (setvar "DIMTOH"      0)                  ;Text outside horizontal
      (setvar "DIMTOL"      0)                  ;Tolerance dimensioning
      (setvar "DIMTOLJ"     1     )               ;Tolerance vertical justification
      (setvar "DIMTP"       0.00  )               ;Plus tolerance
      (setvar "DIMTSZ"      0.00  )               ;Tick size
      (setvar "DIMTVP"      1.00  )               ;Text vertical position
      (setvar "DIMTXSTY"    "0.7"   )               ;Text style
      (setvar "DIMTXT"      2.00  )               ;Text height
      (setvar "DIMTZIN"     0     )               ;Tolerance zero suppression
      (setvar "DIMUPT"      0     )                  ;User positioned text
      (setvar "DIMZIN"      1     )               ;Zero suppression
      (command "_dimstyle" "_save" "1do10_MadziCAD" "_yes")
     
      (setvar "DIMSCALE"    20.00 )              ;Overall scale factor  
      (if (tblsearch "dimstyle" "1do20_MadziCAD")
        (command "_dimstyle" "_save" "1do20_MadziCAD" "_yes")
        (command "_dimstyle" "_save" "1do20_MadziCAD")
      )

      
      (setvar "DIMSCALE"    25.00 )              ;Overall scale factor  
      (if (tblsearch "dimstyle" "1do25_MadziCAD")
        (command "_dimstyle" "_save" "1do25_MadziCAD" "_yes")
        (command "_dimstyle" "_save" "1do25_MadziCAD")
      )

      
      (setvar "DIMSCALE"    50.00 )              ;Overall scale factor  
      (setvar "DIMRND"      1.00  )               ;Rounding value
      (if (tblsearch "dimstyle" "1do50_MadziCAD")
        (command "_dimstyle" "_save" "1do50_MadziCAD" "_yes")
        (command "_dimstyle" "_save" "1do50_MadziCAD")
      )

      
;1do100 na koncu zeby sie domyslnie usatwial na aktualny jesli zadnego wczesniej nie bylo  
      
      (setvar "DIMSCALE"    200.00 )              ;Overall scale factor  
      (setvar "DIMRND"      1.00  )               ;Rounding value
      (if (tblsearch "dimstyle" "1do200_MadziCAD")
        (command "_dimstyle" "_save" "1do200_MadziCAD" "_yes")
        (command "_dimstyle" "_save" "1do200_MadziCAD")
      )

      
      (setvar "DIMSCALE"    500.00 )              ;Overall scale factor  
      (setvar "DIMRND"      1.00  )               ;Rounding value
      (if (tblsearch "dimstyle" "1do500_MadziCAD")
        (command "_dimstyle" "_save" "1do500_MadziCAD" "_yes")
        (command "_dimstyle" "_save" "1do500_MadziCAD")
      )

      
      (setvar "DIMSCALE"    100.00 )              ;Overall scale factor  
      (setvar "DIMRND"      1.00  )               ;Rounding value
      (if (tblsearch "dimstyle" "1do100_MadziCAD")
        (command "_dimstyle" "_save" "1do100_MadziCAD" "_yes")
        (command "_dimstyle" "_save" "1do100_MadziCAD")
      )

      
;poprawki do stylow wymairowania wspolrzednych
      (command "_dimstyle" "_restore" "1do10_MadziCAD")  
      (setvar "DIMLFAC"     0.001 )               ;Linear unit scale factor
      (setvar "DIMDEC"      2     )               ;Decimal places
      (setvar "DIMRND"      0.00  )               ;Rounding value
      (setvar "DIMGAP"      2.00  )               ;Gap from dimension line to text
      (setvar "DIMTDEC"     2     )               ;Tolerance decimal places
      (setvar "DIMZIN"      1     )               ;Zero suppression
      (if (tblsearch "dimstyle" "1do10_MadziCAD$6")
        (command "_dimstyle" "_save" "1do10_MadziCAD$6" "_yes")
        (command "_dimstyle" "_save" "1do10_MadziCAD$6")
      )

      (command "_dimstyle" "_restore" "1do20_MadziCAD")  
      (setvar "DIMLFAC"     0.001 )               ;Linear unit scale factor
      (setvar "DIMDEC"      2     )               ;Decimal places
      (setvar "DIMRND"      0.00  )               ;Rounding value
      (setvar "DIMGAP"      2.00  )               ;Gap from dimension line to text
      (setvar "DIMTDEC"     2     )               ;Tolerance decimal places
      (setvar "DIMZIN"      1     )               ;Zero suppression
      (if (tblsearch "dimstyle" "1do20_MadziCAD$6")
        (command "_dimstyle" "_save" "1do20_MadziCAD$6" "_yes")
        (command "_dimstyle" "_save" "1do20_MadziCAD$6")
      )

      (command "_dimstyle" "_restore" "1do25_MadziCAD")  
      (setvar "DIMLFAC"     0.001 )               ;Linear unit scale factor
      (setvar "DIMDEC"      2     )               ;Decimal places
      (setvar "DIMRND"      0.00  )               ;Rounding value
      (setvar "DIMGAP"      2.00  )               ;Gap from dimension line to text
      (setvar "DIMTDEC"     2     )               ;Tolerance decimal places
      (setvar "DIMZIN"      1     )               ;Zero suppression
      (if (tblsearch "dimstyle" "1do25_MadziCAD$6")
        (command "_dimstyle" "_save" "1do25_MadziCAD$6" "_yes")
        (command "_dimstyle" "_save" "1do25_MadziCAD$6")
      )

      (command "_dimstyle" "_restore" "1do50_MadziCAD")  
      (setvar "DIMLFAC"     0.001 )               ;Linear unit scale factor
      (setvar "DIMDEC"      2     )               ;Decimal places
      (setvar "DIMRND"      0.00  )               ;Rounding value
      (setvar "DIMGAP"      2.00  )               ;Gap from dimension line to text
      (setvar "DIMTDEC"     2     )               ;Tolerance decimal places
      (setvar "DIMZIN"      1     )               ;Zero suppression
      (if (tblsearch "dimstyle" "1do50_MadziCAD$6")
        (command "_dimstyle" "_save" "1do50_MadziCAD$6" "_yes")
        (command "_dimstyle" "_save" "1do50_MadziCAD$6")
      )

      (command "_dimstyle" "_restore" "1do100_MadziCAD")  
      (setvar "DIMLFAC"     0.001 )               ;Linear unit scale factor
      (setvar "DIMDEC"      2     )               ;Decimal places
      (setvar "DIMRND"      0.00  )               ;Rounding value
      (setvar "DIMGAP"      2.00  )               ;Gap from dimension line to text
      (setvar "DIMTDEC"     2     )               ;Tolerance decimal places
      (setvar "DIMZIN"      1     )               ;Zero suppression
      (if (tblsearch "dimstyle" "1do100_MadziCAD$6")
        (command "_dimstyle" "_save" "1do100_MadziCAD$6" "_yes")
        (command "_dimstyle" "_save" "1do100_MadziCAD$6")
      )

      (command "_dimstyle" "_restore" "1do200_MadziCAD")  
      (setvar "DIMLFAC"     0.001 )               ;Linear unit scale factor
      (setvar "DIMDEC"      2     )               ;Decimal places
      (setvar "DIMRND"      0.00  )               ;Rounding value
      (setvar "DIMGAP"      2.00  )               ;Gap from dimension line to text
      (setvar "DIMTDEC"     2     )               ;Tolerance decimal places
      (setvar "DIMZIN"      1     )               ;Zero suppression
      (if (tblsearch "dimstyle" "1do200_MadziCAD$6")
        (command "_dimstyle" "_save" "1do200_MadziCAD$6" "_yes")
        (command "_dimstyle" "_save" "1do200_MadziCAD$6")
      )

      (command "_dimstyle" "_restore" "1do500_MadziCAD")  
      (setvar "DIMLFAC"     0.001 )               ;Linear unit scale factor
      (setvar "DIMDEC"      2     )               ;Decimal places
      (setvar "DIMRND"      0.00  )               ;Rounding value
      (setvar "DIMGAP"      2.00  )               ;Gap from dimension line to text
      (setvar "DIMTDEC"     2     )               ;Tolerance decimal places
      (setvar "DIMZIN"      1     )               ;Zero suppression
      (if (tblsearch "dimstyle" "1do500_MadziCAD$6")
        (command "_dimstyle" "_save" "1do500_MadziCAD$6" "_yes")
        (command "_dimstyle" "_save" "1do500_MadziCAD$6")
      )
      (command "_dimstyle" "_restore" dimstyle_prev) 
      (message_text "  Style wymiarowania MadziCADa dodane lub uaktualnione. " "a")
    )
  )

  ;WLACZANIE masek w stylach wymiarowania znalezc zmienna w ACAD2005
  ;(if (= maski_tla_w_stylach_wymiarowania 1)
  ; (setq dim_last (getvar "dimstyle"))
  ; (setq dim_style_name (cdr (assoc 2 (tblnext "dimstyle" t))))
  ; (setq n2 1)
  ; (while (/= dim_style_name nil)
    ; (command "_dimstyle" "_restore" dim_style_name)
    ; (setvar "dimtfill" 1)
    ; (princ (strcat "\n Ustawiono maske w stylu wymiarowania: " dim_style_name))
    ; (command "_dimstyle" "_save" dim_style_name "_yes")
    ; (setq dim_style_name (cdr (assoc 2 (tblnext "dimstyle"))))
    ; (setq n2 (1+ n2))
  ; )
    (setq temp_selection (ssget "_X" '((0 . "dimension"))))
  (if (/= temp_selection nil)
    (command "_draworder" temp_selection "" "_front")
  )
  ;   (princ "\n Maski w stylach wymiarowania ustawione. ")
  ; (command "_dimstyle" "_restore" dim_last)
  ;)
  

  
  
  
    ;;;;WLACZANIE masek w tekstach
  (if (= maski_tla_w_tekstach 1)
    (progn
      (setq temp_selection (ssget "_X" '((0 . "MTEXT"))))
      (if (/= temp_selection nil)
        (progn
          (selection_to_list temp_selection)
          (foreach item sslist 
            (progn 
              (setq entlist (entget item))
              (setq entlist
                 (append
                   entlist
                   (list (cons 90 3))       ;dodanie maski 
                   (list (cons 63 256))     ;ustawienie maski jak tlo rysuku
                   (list (cons 45 rozmiar_maski_w_tekstach))     ;ustawienie rozmiaru maski 1.1        
                 )
              )
              (entmod entlist)
              ;(command "_draworder" item "" "_front")
            )
          )
          ;teksty i wymiary na wierzch
          (setq temp_selection (ssget "_X" '((0 . "MTEXT"))))
          (if (/= temp_selection nil)
           (command "_draworder" temp_selection "" "_front")
          )
           (message_text "  Maski t³a w tekstach ustawione. " "a")
          
        )
      )
    )
  )
  
  ;przenoszenie_blokow_z_defpoints
  (if (= przenoszenie_blokow_z_defpoints 1)
    (progn
      (setq temp_selection (ssget "_X" '((0 . "INSERT") (8 . "Defpoints"))))
      (if (/= temp_selection nil)
        (progn
          (command "_chprop" temp_selection "" "_layer" "0" "")
          (message_text "  Przeniesiono wszystkie bloki z warstwy 'defpoints' na warstwê '0'. " "a")
        )
      )
    )
  )

  ;(setq file (open (strcat path "\\support\\message.dat") "w"))
  ;(write-line message file)
  ;(close file)
  ;(startapp (strcat path "\\support\\madzicad_komunikat.exe"))
  
  (startapp (strcat path "\\support\\madzicad_warning_box.exe"))
  ;(alert message)
  (princ)
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;==============================================================narzedzia
(defun c:interpolator()
  (startapp (strcat path "\\support\\interpolator.exe"))
  (princ)
)

(defun c:kalkulator()
  (startapp "calc.exe")
  (princ)
)

;==============================================================main
(defun c:madzicad_ustawienia()
  (startapp (strcat path "\\support\\madzicad_ustawienia.exe"))
  (princ)
)

(defun c:madzicad_rejestracja()
  (startapp (strcat path "\\support\\trial_expired.exe"))
  (princ)
)


(defun c:shortcut_maker()
  (startapp (strcat path "\\support\\shortcut_maker.exe"))
  (princ)
)

(defun c:szybki_entlist()   ;szybki entlist
  (setq ent (entget (car (entsel)) '("*")))
  (mapcar 'print ent)
;;(textscr)
(princ)
)

(defun c:properties_and_methods()   ;wlasciwosci i metody w VLISP
  (setq vlaobj (vlax-ename->vla-object (car(entsel))))
  (vlax-dump-object vlaobj t) 
)



;ZROB OSOBNE FUNKCJE
(defun c:midpt ( / pt1 pt2)
(setq pt1 (getpoint "\nSelect first point: "))
(setq pt2 (getpoint "\nSelect second point: "))
(command "_circle" (polar pt1 (angle pt1 pt2) (/ (distance pt1 pt2) 2.0)) 50) ;w polowie
(command "_circle" (polar pt1 (angle pt1 pt2) (/ (distance pt1 pt2) 4.0)) 50) ;1/4 do piwerwszego punktu
)







(defun c:sssssssss (/ ss vevo)
  (if
    (setq ss (car (entsel "\nPick an object dimension")))
    (progn
      (setq vevo (vlax-ename->vla-object ss))
      (vlax-dump-object vevo) select a option as what are you need

      (setq tc (vlax-get vevo 'TextColor))
      (vlax-put vevo 'TextColor 1)
      ) ; progn
    (alert "\nInvalid selected object,try again")
    )   ; if
  (princ)
  )
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  


















;(c) Kuba Miszcz 
(defun C:asdfg (/ name ss sslen cnt blck ent entinfo blk-ref adoc blk)


;; ZMIANA KOLOROW ATRYBOTOW NA "JAK WARSTWA"
  ;(initget 7)
  ;(setq AttribColor (getint "\n Podaj numer koloru atrybutów: "))
  (setq AttribColor 256) ;kolor jak warstwa
  ;(cond ((not AttribColor) (setq AttribColor 11)))
  (setq ss (ssget "x" '((0 . "INSERT"))))
  (setq cnt 0)
  (setq sslen (sslength ss))
  (while (< cnt sslen)
    (setq blck (ssname ss cnt))
    (setq ent (entnext blck))
    (setq entinfo (entget ent))
    (while
      (and ent (= (cdr (assoc 0 entinfo)) "ATTRIB"))
      (if (assoc 62 entinfo)
      (entmod (subst (cons 62 AttribColor) (assoc 62 entinfo) entinfo))
      (setq entinfo (entmod (append entinfo (list (cons 62 AttribColor)))))
      )
      (entupd ent)
      (setq ent (entnext ent))
      (setq entinfo (entget ent))
    )
    (setq cnt (1+ cnt))
  )
  (princ)


;;;zmiana koloru obiektow w blokach na  "JAK WARSTWA"
  (setq AttribColor 256) ;kolor jak warstwa
  (setq ss (ssget "x" '((0 . "INSERT"))))
  (setq cnt 0)
  (setq sslen (sslength ss))
  (while (< cnt sslen)
    (setq blck (ssname ss cnt))
    (setq cnt (1+ cnt))
    (setq blk-ref (Vlax-ename->vla-object blck))
    (setq adoc (vla-get-ActiveDocument (vlax-get-acad-object)))
    (setq blk (vla-item (vla-get-blocks adoc) (vla-get-name blk-ref)))
    (vlax-for ent blk 
      (if (vlax-property-available-p ent 'Color) 
        (vla-put-Color ent AttribColor)
      )
    )
    (princ (strcat "\n" (itoa cnt)))
  )
  (princ (strcat "\nZmieniono " (itoa cnt) " bloków."))
  (vlax-invoke adoc 'regen 'ActiveViewport)
  (princ)
)



;punkt n aobikecie prostopadly do wskazanego
(defun c:SnapToObj ( / en obj pts_ss ss_len c pten ptobj pted pt pt2)
(setq en (car (entsel "\nSelect Object: ")))
(setq obj (vlax-ename->vla-object en))
(princ "\nSelect points: ")
(setq pts_ss (ssget (list (cons 0 "POINT"))))
(setq ss_len (sslength pts_ss))
(setq c 0)
(while (< c ss_len)
(setq pten (ssname pts_ss c))
(setq ptobj (vlax-ename->vla-object pten))
(setq pted (entget pten))
(setq pt (cdr (assoc 10 pted)))
(setq pt2 (vlax-curve-getClosestPointTo obj pt))
(vla-move ptobj (vlax-3d-point pt) (vlax-3d-point pt2))
(setq c (+ c 1))
)
(princ)
)



;===dla drohgowcow
(defun c:ssload()
  (load (strcat "c:\\madzicad sources\\madzicad_source.lsp"))
  (princ "\n Plik za³adowany.")
  (princ)
)

(defun c:ssssssss(/ warstwa offset1 dlugosc_kreski_dolnej dlugosc_kreski_gornej text_height osmodeprev layerprev poziom_porownawczy pt1 pt2 pt3 pt4 pt5 txt_content base_txt)
  ;VVVVVVVVVVVVVVV   ZMIENNE DO DEFIONIOWANIA   VVVVVVVVVVV
  (setq warstwa "widok")
  (setq offset1 0.1)      ;odleglosc poziomu porowanczego do gornej kreski tabelki
  (setq dlugosc_kreski_gornej 0.8)
  (setq dlugosc_kreski_dolnej 0.8)
  (setq text_height 0.18)
  ;^^^^^^^^^^^^^^^^^^   KONIEC ZMIENNYCH    ^^^^^^^^^^^^^^^^^^^^
  
  (defun *error* (errorlevel)
    (setvar "osmode" osmodeprev)
    (setvar "clayer" layerprev)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  
  (if (= (tblsearch "layer" "widok") nil)
    (setq warstwa (getvar "clayer"))
  )
  (setq layerprev (getvar "clayer"))
  (setq osmodeprev (getvar "osmode"))

  (setvar "clayer" warstwa)
  
  (setq poziom_porownawczy (getreal "\n Podaj wysokoœæ poziomu porównawczego: "))
  (setq pt1 (getpoint "\n Wska¿ przeciêcie poziomu porównawczego z osi¹ drogi"))
  (command "_ucs" pt1 "")
  
  (setq pt1 (getpoint "\n Wska¿ punkt: "))
  
  (setvar "osmode" 0)
  
  (while (/= pt1 nil)
    (progn 

      (setq pt2 (list (car pt1) 0.0 (caddr pt1)))
      (setq pt3 (list (car pt2) (- (cadr pt2) offset1) (caddr pt2)))
      (setq pt4 (list (car pt3) (- (cadr pt3) dlugosc_kreski_gornej) (caddr pt3)))
      (setq pt5 (list (car pt4) (- (cadr pt4) dlugosc_kreski_dolnej) (caddr pt4)))
      
      (command "_line" pt1 pt2 "")
      (command "_line" pt3 pt4 pt5 "")

      ;gorna linijka - wysokosc
      (setq txt_content (rtos (+ poziom_porownawczy (cadr pt1)) 2 2))
      (setq base_txt 
        (list 
          (- (car pt3) (* text_height 0.75)) 
          (- (cadr pt3) (/ dlugosc_kreski_gornej 2)) 
          (caddr pt3)
        )
      )
      (command "_text" "_justify" "_mcenter" base_txt text_height 90 txt_content)  (setq txt_content (rtos (cadr pt1) 2 2))
      
      ;dolna linijka - odleglosc od osi
      (setq txt_content (rtos (abs (car pt1)) 2 2))
      (setq base_txt 
        (list 
          (- (car pt4) (* text_height 0.75)) 
          (- (cadr pt4) (/ dlugosc_kreski_dolnej 2)) 
          (caddr pt4)
        )
      )
      (command "_text" "_justify" "_mcenter" base_txt text_height 90 txt_content)
      
      (setq pt1 (getpoint "\n Wska¿ punkt: "))
    )
  )
  
  (setvar "osmode" osmodeprev)
  (setvar "clayer" layerprev)
  (princ)
)

(defun c:zz(/ warstwa offset1 dlugosc_kreski_dolnej dlugosc_kreski_gornej text_height osmodeprev layerprev poziom_porownawczy pt1 pt2 pt3 pt4 pt5 txt_content base_txt)
  ;VVVVVVVVVVVVVVV   ZMIENNE DO DEFIONIOWANIA   VVVVVVVVVVV
  (setq warstwa "widok")
  (setq offset1 0.1)      ;odleglosc poziomu porowanczego do gornej kreski tabelki
  (setq dlugosc_kreski_gornej 0.8)
  (setq dlugosc_kreski_dolnej 0.8)
  (setq text_height 0.18)
  ;^^^^^^^^^^^^^^^^^^   KONIEC ZMIENNYCH    ^^^^^^^^^^^^^^^^^^^^
  
  (defun *error* (errorlevel)
    (setvar "osmode" osmodeprev)
    (setvar "clayer" layerprev)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  
  (if (= (tblsearch "layer" "widok") nil)
    (setq warstwa (getvar "clayer"))
  )
  (setq layerprev (getvar "clayer"))
  (setq osmodeprev (getvar "osmode"))

  (setvar "clayer" warstwa)
  
  (setq poziom_porownawczy (getreal "\n Podaj wysokoœæ poziomu porównawczego: "))
  (setq pt1 (getpoint "\n Wska¿ przeciêcie poziomu porównawczego z osi¹ drogi"))
  (command "_ucs" pt1 "")
  
  (setq pt1 (getpoint "\n Wska¿ punkt: "))
  
  (setvar "osmode" 0)
  
  (while (/= pt1 nil)
    (progn 

      (setq pt2 (list (car pt1) 0.0 (caddr pt1)))
      (setq pt3 (list (car pt2) (- (cadr pt2) offset1) (caddr pt2)))
      (setq pt4 (list (car pt3) (- (cadr pt3) dlugosc_kreski_gornej) (caddr pt3)))
      (setq pt5 (list (car pt4) (- (cadr pt4) dlugosc_kreski_dolnej) (caddr pt4)))
      
      (command "_line" pt1 pt2 "")
      (command "_line" pt3 pt4 pt5 "")

      ;gorna linijka - wysokosc
      (setq txt_content (rtos (+ poziom_porownawczy (cadr pt1)) 2 2))
      (setq base_txt 
        (list 
          (- (car pt3) (* text_height 0.75)) 
          (- (cadr pt3) (/ dlugosc_kreski_gornej 2)) 
          (caddr pt3)
        )
      )
      (command "_text" "_justify" "_mcenter" base_txt text_height 90 txt_content)  (setq txt_content (rtos (cadr pt1) 2 2))
      
      ;dolna linijka - odleglosc od osi
      (setq txt_content (rtos (abs (car pt1)) 2 2))
      (setq base_txt 
        (list 
          (- (car pt4) (* text_height 0.75)) 
          (- (cadr pt4) (/ dlugosc_kreski_dolnej 2)) 
          (caddr pt4)
        )
      )
      (command "_text" "_justify" "_mcenter" base_txt text_height 90 txt_content)
      
      (setq pt1 (getpoint "\n Wska¿ punkt: "))
    )
  )
  
  (setvar "osmode" osmodeprev)
  (setvar "clayer" layerprev)
  (princ)
)




;==============DCL===========
(defun c:cd()
  (load "c:\\test.lsp")
)


;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;szybka zmiana z entycji lub zaznaczenia na VLOBJ
(defun en->vl (zaznaczenie / entlist)
  (if (= (listp zaznaczenie) nil)
    (setq entlist (entget (ssname zaznaczenie 0)))
    (setq entlist zaznaczenie)
  )
  (setq vlobj (vlax-ename->vla-object (cdr(assoc -1 entlist))))
)
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
