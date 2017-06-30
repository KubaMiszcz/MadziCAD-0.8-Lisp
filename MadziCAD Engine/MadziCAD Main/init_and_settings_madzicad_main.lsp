;;*************************************************
;;            LADOWANIE USTAWIEN                  *
;;*************************************************
;;                                                *
(setq file (open (strcat path "ustawienia.txt") "r"))

;;ustawienia nazw warstw do polecenia 1, 11
(repeat 30 (read-line file))
(setq n 0)
(repeat 10
  (setq temp_string (read-line file))
  (setq layername (substr temp_string 4 (- (strlen temp_string) 4)))
  (command "_layer" "t" (strcat layername) "")
  (setq warstwanr_x (strcat "warstwanr" (itoa n)))
  (set (read warstwanr_x) layername)
  (setq n (+ n 1))
)

;;warstwa z wymiarami (potrzebna w poleceniach do wymiarow
(repeat 4 (read-line file))
(setq temp_string (read-line file))
(setq warwym (substr temp_string 10 (- (strlen temp_string) 10)))
(setq temp_string (read-line file))
(setq warkresk (substr temp_string 14 (- (strlen temp_string) 14)))

;;wysokosci tekstu w mm obszarze papieru
(repeat 3 (read-line file))
(setq txta (atoi (substr (read-line file) 4)))
(setq txt2a (atoi (substr (read-line file) 4)))
(setq txt4a (atoi (substr (read-line file) 4)))

;;skala linii w obszarze papieru
(repeat 3 (read-line file))
(setq skalalinii (atoi (substr (read-line file) 13)))

;;wysokosc w metrach ponad LUW powyzej ktorej wspolrzedne traktowane sa jako bezwzgledne
(repeat 4 (read-line file))
(setq HH (atoi (substr (read-line file) 4)))

;ilosc miejsc po przecinku przy obliczaniu spadku i nachylenia:
(repeat 3 (read-line file))
(setq dokl_spadku (atoi (substr (read-line file) 19)))
(setq dokl_nachylenia (atoi (substr (read-line file) 23)))

;kolor tekstu w linii odniesienia
(repeat 4 (read-line file))
(setq kolor_tekstu_linii_odniesienia (atoi (substr (read-line file) 41)))

(close file)
;;rozne zmienne srodowiskowe
(setvar "pickfirst" 1)                   ;to jest dobre
(setvar "cmdecho" 0)                     ;nie wyswietla komunikatow lispa w linii polecen
;(setvar "hpgaptol" 5000)                ;tolerancja do kreskowania
(setvar "mirrtext" 0)                    ;nie odbija tekstu przy lustrze
(setvar "edgemode" 0)                    ;przy utnij/wydluz bierze tez przedluzenia krawedzi tnacych
(setvar "filletrad" 0)                   ;promien fazy = 0
(setvar "lunits" 2)                      ;jednostki -> dziesietne
(setvar "osmode" 15359)                  ;wlacza wszytskie stale tryby lokalizacji
(setvar "tilemode" 1)                    ;przelacza na model
(setvar "psltscale" 1)                   ;skaluj w jednostkach obszaru papieru
(setvar "ltscale" (* skalalinii 100))     ;ustawia skale linii na modelu
(setvar "gripblock" 1)                   ;pokazuj wszystkie uchwyty w blokach
(setvar "luprec" 0)                       ;dokladnosc jednostek - ilosc miejsc po przecinku

;tworzenie brakujacych blokow
(setq internal_blocks_list
  (list 
    (list "kota" (list '(0 . "LWPOLYLINE") '(5 . "1528") '(100 . "AcDbEntity") '(67 . 0) '(410 . "Model") '(8 . "0") '(100 . "AcDbPolyline") '(90 . 4) '(70 . 0) '(43 . 0.0) '(38 . 0.0) '(39 . 0.0) '(10 0.0 0.0) '(40 . 0.0) '(41 . 0.0) '(42 . 0.0) '(10 100.0 173.0) '(40 . 0.0) '(41 . 0.0) '(42 . 0.0) '(10 -100.0 173.0) '(40 . 0.0) '(41 . 0.0) '(42 . 0.0) '(10 0.0 0.0) '(40 . 0.0) '(41 . 0.0) '(42 . 0.0) '(210 0.0 0.0 1.0)))
    (list "spadek w prawo" (list '(0 . "LWPOLYLINE") '(5 . "153E") '(100 . "AcDbEntity") '(67 . 0) '(410 . "Model") '(8 . "0") '(100 . "AcDbPolyline") '(90 . 4) '(70 . 0) '(43 . 0.0) '(38 . 0.0) '(39 . 0.0) '(10 -400.0 -140.0) '(40 . 0.0) '(41 . 0.0) '(42 . 0.0) '(10 900.0 -140.0) '(40 . 0.0) '(41 . 0.0) '(42 . 0.0) '(10 400.0 0.0) '(40 . 0.0) '(41 . 0.0) '(42 . 0.0) '(10 400.0 -140.0) '(40 . 0.0) '(41 . 0.0) '(42 . 0.0) '(210 0.0 0.0 1.0)))
    (list "spadek w lewo" (list '(0 . "LWPOLYLINE") '(5 . "1541") '(100 . "AcDbEntity") '(67 . 0) '(410 . "Model") '(8 . "0") '(100 . "AcDbPolyline") '(90 . 4) '(70 . 0) '(43 . 0.0) '(38 . 0.0) '(39 . 0.0) '(10 400.0 -140.0) '(40 . 0.0) '(41 . 0.0) '(42 . 0.0) '(10 -900.0 -140.0) '(40 . 0.0) '(41 . 0.0) '(42 . 0.0) '(10 -400.0 0.0) '(40 . 0.0) '(41 . 0.0) '(42 . 0.0) '(10 -400.0 -140.0) '(40 . 0.0) '(41 . 0.0) '(42 . 0.0) '(210 0.0 0.0 1.0)))
    (list "strzalka linii odniesienia" (list '(0 . "SOLID") '(5 . "C28D") '(100 . "AcDbEntity") '(67 . 0) '(410 . "Model") '(8 . "0") '(100 . "AcDbTrace") '(10 -2.0 0.333333 0.0) '(11 0.0 0.0 0.0) '(12 -2.0 -0.333333 0.0) '(13 -2.0 -0.333333 0.0) '(39 . 0.0) '(210 0.0 0.0 1.0)))
    (list "znacznik" (list '(0 . "LINE") '(5 . "1520") '(100 . "AcDbEntity") '(67 . 0) '(410 . "Model") '(8 . "0") '(100 . "AcDbLine") '(10 -1.0 0.0 0.0) '(11 1.0 0.0 0.0) '(210 0.0 0.0 1.0))
                     (list '(0 . "LINE") '(5 . "151E") '(100 . "AcDbEntity") '(67 . 0) '(410 . "Model") '(8 . "0") '(100 . "AcDbLine") '(10 0.0 1.0 0.0) '(11 0.0 -1.0 0.0) '(210 0.0 0.0 1.0))
                     (list '(0 . "LWPOLYLINE") '(5 . "151F") '(100 . "AcDbEntity") '(67 . 0) '(410 . "Model") '(8 . "0") '(100 . "AcDbPolyline") '(90 . 2) '(70 . 0) '(43 . 0.1) '(38 . 0.0) '(39 . 0.0) '(10 0.5 0.5) '(40 . 0.1) '(41 . 0.1) '(42 . 0.0) '(10 -0.5 -0.5) '(40 . 0.1) '(41 . 0.1) '(42 . 0.0) '(210 0.0 0.0 1.0))
    )
  )
)

(foreach item internal_blocks_list 
  (progn
    (if 
      (tblsearch "block" (car item))
      () 
      (progn
        (setq n (1- (length item)))
        (setq temp_selection (ssadd)) 
        (repeat n
          (entmake (nth n item))
          (ssadd (entlast) temp_selection)
          (setq n (1- n))
        )
        (command "_block" (car item) '(0 0) temp_selection "")
      )
    )
  )
)
;;**************************************************************************
(princ "\n  Plik konfiguracyjny: <Init_and_settings_MadziCAD_Main> za³adowano pomyœlnie. ")
;;                                                                         *
;;**************************************************************************
(princ)
