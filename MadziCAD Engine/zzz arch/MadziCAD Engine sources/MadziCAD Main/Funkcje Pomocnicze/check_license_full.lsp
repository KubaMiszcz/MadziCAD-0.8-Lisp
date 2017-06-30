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
  (setq start_number 50)        ;od ktorego kodu ascci zaczynac 70=D + przedial 10 to bedzie 80
  (setq interval 60)            ;przedzial cyfr =10
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

