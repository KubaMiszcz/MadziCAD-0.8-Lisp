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
(setq command_ZOW_status 0) 
(setq command_UWOWO_status 0)
(setq layerproplistUWOWO nil)
(setq layerproplistZOW nil)












;;**************************************************************************
(princ "\n  Plik konfiguracyjny: <Init_and_settings_MadziCAD_Main> za³adowano pomyœlnie. ")
;;**************************************************************************
(princ)

