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

