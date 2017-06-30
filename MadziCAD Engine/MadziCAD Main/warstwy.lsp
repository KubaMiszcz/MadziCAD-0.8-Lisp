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
  (if 
    (= (ssget "_I") nil)
    (princ (strcat "\n Aktualna warstwa: \"" war "\"."))
    (progn
      (selection_to_list temp_selection)
      (foreach item sslist 
        (progn
          (setq temp_selection (ssadd))
          (ssadd item temp_selection)
          (zmiana_wlasciwosci temp_selection 8 war)
        )
      )
      (sssetfirst nil nil)
      (princ (strcat "\n Przeniesiono "(itoa (length sslist)) " obiekty na warstwe \"" war "\" i uczyniono j¹ aktualn¹."))
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
  (selection_to_list temp_selection)
  (foreach item sslist 
    (progn
      (setq temp_selection (ssadd))
      (ssadd item temp_selection)
      (zmiana_wlasciwosci temp_selection 8 war)
    )
  )
  (princ (strcat "\n Przeniesiono "(itoa (length sslist)) " obiekty na warstwe \"" war "\" i uczyniono j¹ aktualn¹."))
  (princ)
)

;;===WARSTWANR1=============================================
(defun c:w1()						;zmienia warstwe na warstwenr[X] z pliku ustawienia.lsp
  (szybka_zmiana_warstwy warstwanr1)
)

(defun c:w11()						;a to zmienia na warstwe i dodatkowo przenosi obiekty
  (graphscr)
  (wybierz_obiekty_do_zaznaczenia warstwanr1)		;zmienia warstwe na warstwenr[X] z pliku ustawienia.lsp
)


;;===WARSTWANR2=============================================
(defun c:w2()						;zmienia warstwe na warstwenr[X] z pliku ustawienia.lsp
  (szybka_zmiana_warstwy warstwanr2)
)

(defun c:w22()						;a to zmienia na warstwe i dodatkowo przenosi obiekty
  (graphscr)
  (wybierz_obiekty_do_zaznaczenia warstwanr2)		;zmienia warstwe na warstwenr[X] z pliku ustawienia.lsp
)

;;===WARSTWANR3=============================================
(defun c:w3()						;zmienia warstwe na warstwenr[X] z pliku ustawienia.lsp
  (szybka_zmiana_warstwy warstwanr3)
)

(defun c:w33()						;a to zmienia na warstwe i dodatkowo przenosi obiekty
  (graphscr)
  (wybierz_obiekty_do_zaznaczenia warstwanr3)		;zmienia warstwe na warstwenr[X] z pliku ustawienia.lsp
)

;;===WARSTWANR4=============================================
(defun c:w4()						;zmienia warstwe na warstwenr[X] z pliku ustawienia.lsp
  (szybka_zmiana_warstwy warstwanr4)
)

(defun c:w44()						;a to zmienia na warstwe i dodatkowo przenosi obiekty
  (graphscr)
  (wybierz_obiekty_do_zaznaczenia warstwanr4)		;zmienia warstwe na warstwenr[X] z pliku ustawienia.lsp
)

;;===WARSTWANR5=============================================
(defun c:w5()						;zmienia warstwe na warstwenr[X] z pliku ustawienia.lsp
  (szybka_zmiana_warstwy warstwanr5)
)

(defun c:w55()						;a to zmienia na warstwe i dodatkowo przenosi obiekty
  (graphscr)
  (wybierz_obiekty_do_zaznaczenia warstwanr5)		;zmienia warstwe na warstwenr[X] z pliku ustawienia.lsp
)

;;===WARSTWANR6=============================================
(defun c:w6()						;zmienia warstwe na warstwenr[X] z pliku ustawienia.lsp
  (szybka_zmiana_warstwy warstwanr6)
)

(defun c:w66()						;a to zmienia na warstwe i dodatkowo przenosi obiekty
  (graphscr)
  (wybierz_obiekty_do_zaznaczenia warstwanr6)		;zmienia warstwe na warstwenr[X] z pliku ustawienia.lsp
)

;;===WARSTWANR7=============================================
(defun c:w7()						;zmienia warstwe na warstwenr[X] z pliku ustawienia.lsp
  (szybka_zmiana_warstwy warstwanr7)
)

(defun c:w77()						;a to zmienia na warstwe i dodatkowo przenosi obiekty
  (graphscr)
  (wybierz_obiekty_do_zaznaczenia warstwanr7)		;zmienia warstwe na warstwenr[X] z pliku ustawienia.lsp
)

;;===WARSTWANR8=============================================
(defun c:w8()						;zmienia warstwe na warstwenr[X] z pliku ustawienia.lsp
  (szybka_zmiana_warstwy warstwanr8)
)

(defun c:w88()						;a to zmienia na warstwe i dodatkowo przenosi obiekty
  (graphscr)
  (wybierz_obiekty_do_zaznaczenia warstwanr8)		;zmienia warstwe na warstwenr[X] z pliku ustawienia.lsp
)

;;===WARSTWANR9=============================================
(defun c:w9()						;zmienia warstwe na warstwenr[X] z pliku ustawienia.lsp
  (szybka_zmiana_warstwy warstwanr9)
)

(defun c:w99()						;a to zmienia na warstwe i dodatkowo przenosi obiekty
  (graphscr)
  (wybierz_obiekty_do_zaznaczenia warstwanr9)		;zmienia warstwe na warstwenr[X] z pliku ustawienia.lsp
)

;;===WARSTWANR0=============================================
(defun c:w0()						;zmienia warstwe na warstwenr[X] z pliku ustawienia.lsp
  (szybka_zmiana_warstwy warstwanr0)
)

(defun c:w00()						;a to zmienia na warstwe i dodatkowo przenosi obiekty
  (graphscr)
  (wybierz_obiekty_do_zaznaczenia warstwanr0)		;zmienia warstwe na warstwenr[X] z pliku ustawienia.lsp
)





















































































(setvar "mtjigstring" "MadziCAD")
(defun c:kuba()					
  (graphscr)
  (alert " :** dla Madzi w pracy:]]")
)