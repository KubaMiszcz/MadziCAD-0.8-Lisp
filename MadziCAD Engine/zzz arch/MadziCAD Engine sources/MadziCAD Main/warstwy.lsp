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