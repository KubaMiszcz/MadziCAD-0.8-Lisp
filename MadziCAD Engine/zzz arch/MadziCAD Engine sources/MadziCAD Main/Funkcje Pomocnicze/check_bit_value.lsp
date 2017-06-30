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