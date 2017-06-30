(defun c:zmiana_tekstu_wymiarowego(/ temp_selection nowy_tekst)
  (princ "\n Wybierz wymiar z tekstem do zamiany: ")
  (setq temp_selection (ssget "_:S"))
  (setq nowy_tekst (getstring "\n Podaj nowy tekst wymiarowy: "))
  (zmiana_wlasciwosci temp_selection 1 nowy_tekst)
  (princ "\n Tekst wymiarowy zmieniono. ")
  (princ)
)


