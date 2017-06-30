;;p to jest stary oryguinalny liosp stara wersja bez XDATA
(defun c:tworz_pret_w_widoku(/ layerprev filletradprev osmodeprev numer_preta srednica_preta otulina_preta pkt1 ent_temp strona ksztalt_preta dlugosc_preta_string srednica_preta_string pkt2 skala )   ;tworzenie preta
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana ")
  )

  (setq layerprev (getvar "clayer"))
  (setvar "clayer" warwym)
  (setq osmodeprev (getvar "osmode"))
  ;dane preta
  (initget 15)
  (setq numer_preta (getint "\n Podaj numer prêta: "))
  (czy_pret_istnieje numer_preta)
  (if (= exist_flag 1)
      (progn
        (while (= exist_flag 1)
          (initget 15)
          (alert "\n Prêt o podanym numerze ju¿ istnieje na rysunku
                  \n Podaj inny numer prêta. ")
          (setq numer_preta (getint "\n Podaj inny numer prêta: "))
          (czy_pret_istnieje numer_preta)
        )
      )
  )  
  (initget 15)  
  (setq srednica_preta (getint "\n Podaj œrednicê prêta: "))
  (initget 13)
  (setq otulina_preta (getint "\n Podaj otulinê prêta: "))
  ;(setq rodzaj_stali (getint "\n Podaj rodzaj stali: "))
  
  ;tworzenie ksztaltu preta
  (setq pkt1 (getpoint "\n Narysuj kszta³t prêta (obrysuj przekrój): "))
  (command "_pline" pkt1)
  (while (= (logand (getvar "cmdactive") 1) 1)
    (command pause)
  )
  (setq ent_temp (entlast))
  
  (setvar "osmode" 0)
  (setq strona (getpoint "\n Wska¿ od ktorej strony narysowaæ prêt: "))  
  (command "_offset" (+ otulina_preta (/ srednica_preta 2)) (entlast) strona "")
  (setq ksztalt_preta (entlast))  

  ;dorobic automatycnze obliczanie promienia giecia
  (oblicz_promien_giecia srednica_preta)
  (setq filletradprev (getvar "filletrad"))
  (setvar "FILLETRAD"  promien_giecia) 
  (command "_fillet" "p" ksztalt_preta)
  (setvar "filletrad" filletradprev)  
  
  (zmiana_wlasciwosci (ssadd ksztalt_preta) 43 srednica_preta)
  (entdel ent_temp)
  
  ;tworzenie opisu
  (setq dlugosc_preta_string 
    (strcat 
      "%<\\AcObjProp Object(%<\\_ObjId "
      (itoa(vla-get-ObjectId (vlax-ename->vla-object 
        ksztalt_preta
      )))
      ">%).Length \\f \"%lu2%pr0%ps[L=,cm]%ct8[0.1]\">%"
    ) 
  )
  (setq srednica_preta_string 
    (strcat 
      "%<\\AcObjProp Object(%<\\_ObjId "
      (itoa(vla-get-ObjectId (vlax-ename->vla-object 
        ksztalt_preta
      )))
      ">%).ConstantWidth \\f \"%lu2%pr0%ps[%%c,]\">%"
    ) 
  )
  (princ "\n Wska¿ punkt na prêcie, a nastêpnie punkt wstawienia opisu: ")
  (setvar "osmode" osmodeprev)
  (setq pkt1 (getpoint))
  (setvar "osmode" 0)
  (setq pkt2 (getpoint))
  (command "_leader" pkt1 pkt2 "" "" "b")
  (setq skala (* (getvar "dimscale") 1000))
  (command "_insert" "opis preta w widoku" pkt2 skala skala 0 numer_preta srednica_preta_string dlugosc_preta_string)
;  (setq block_name (strcat "pret nr " (rtos numer_preta)))
;  (command "_block" block_name pkt1 (ssadd ksztalt_preta) (ssadd (entlast)) "")
;  (command "_insert" block_name pkt1 1 1 0)
  (setvar "osmode" osmodeprev)
  (setvar "clayer" layerprev)

  (command "_regen")
  (alert (strcat "\n Prêt numer " (rtos numer_preta) " utworzono. "))
  (princ)  
)

