;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                  ;;
;;      kuba miszcz 2007 :]         ;;
;;  kontakt: zielonyeufor@o2.pl     ;;
;;                                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; program laduje uzywane LISPy
(defun *error* (errorlevel)
  (alert (strcat
  "\n  MadziCAD error:\n"
  "\n  B³¹d w Funkcji: " script "\n"
  "\n  Wczytywanie przerwane. "
  ))
)
;;PROGRAM=======   
(defun c:wersja()
    (alert "\n Zainstalowana wersja:\n     MadziCAD v0.021")
)
(graphscr)
(setenv "ACAD" (strcat (getenv "ACAD") "c:\\Program Files\\Madzicad\\;"))
(setq path "c:\\program files\\madzicad\\")         ;domyslna sciezka

(if (= (open (strcat path "ustawienia.txt") "r") nil)
  (progn
    (alert (strcat "\n        B£¥D: Z³a œcie¿ka do plików MadziCADa!"
                 "\n\n     Wgraj MadziCADa do domyœlnego katalogu:      "
                   "\n              C:\\Program Files\\MadziCAD\\"
                 "\n\n            i uruchom AutoCADa ponownie.")
    )
    (exit)
  )
)    

;(load (strcat path "MadziCAD Engine\\MadziCAD Main\\check_license.lsp"))
;(c:license_test)





;;***************************************************
;;            LISTA FUNKCJI GLOWNYCH                *
;;***************************************************
;;                                                  *
(setq list_Madzicad_main_apps 
  (list                                       ;poczatek listy
  ;"funkcje pomocnicze\\check_license"         ;00
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
  "szybka_grupa"                              ;32
  "rozbij_grupe"                              ;33
  "linia_uciecia"                             ;34
  "ukryj_odkryj_obiekty"                      ;35
  "zmiana_tekstu_wymiarowego"                 ;36
  "wymiar_wspolrzednych_kilometraz"           ;37
  "nachylenie"                                ;38
  "utnij_linia"                               ;39
  "wydluz_linia"                              ;40
  "wymiar_szeregowy"                          ;41
  "linia_odniesienia"                         ;42
  "zoom_wszystko"                             ;43
  "convert_to_uppercase"                      ;44
  "szybki_blok"                               ;45
  "szybki_obrot"                              ;46
  "zoom_okno"                                 ;47
  "typowe_kreskowania"                        ;48
  "pole_powierzchni"                          ;49
  "przesun_enhanced"                          ;50
  "zoom_poprzedni"                            ;51
  "linie_niewidoczne"                         ;52
  "linie_osie"                                ;53
  )                                           ;koniec listy
)                                      

;ladowanie funkcji podstawowych:
(foreach script list_madzicad_main_apps 
  (load (strcat path "MadziCAD Engine\\MadziCAD Main\\" script ".lsp"))
)
(princ "\n  Funkcjê: <MadziCAD Main> za³adowano pomyœlnie. ") 
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
  "tworz_pret_w_widoku"                           ;2
   
  "funkcje pomocnicze\\czy_pret_istnieje"         ;101
  "funkcje pomocnicze\\oblicz_promien_giecia"     ;102
  
;  "temp\\att"                                    ;**
;  "temp\\att2"                                   ;**
  
  )                                               ;koniec listy
)

;ladowanie funkcji mosty:
(foreach script list_madzicad_mosty_zelbet_apps 
  (load (strcat path "MadziCAD Engine\\MadziCAD Mosty Zelbet\\" script ".lsp"))
)
(princ "\n  Funkcjê: <MadziCAD Mosty Zelbet> za³adowano pomyœlnie. ")
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
  "random_number"                             ;6
  )                                           ;koniec listy
)

;ladowanie funkcji
(foreach script list_madzicad_internal_apps
  (load (strcat path "MadziCAD Engine\\MadziCAD Main\\Funkcje Pomocnicze\\" script ".lsp"))
) 
(princ "\n  Funkcjê: <Funkcje Pomocnicze> za³adowano pomyœlnie. ")
;*                                                                *
;;*****************************************************************

;;*************************************************
;;*                    All OK                     *
;;*************************************************
;;*                                               *
(startapp (strcat path "MadziCAD Engine\\madzicad main\\MadziCAD_all_ok.exe"))
(princ "\n\n MadziCAD... All OK. ")
;;*                                               *
;;*************************************************
(princ)
