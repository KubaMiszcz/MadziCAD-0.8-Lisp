(defun c:base ()
  (setq val 6)
  (repeat 8
    (setq val (bit-tog val 7))
    (setq val (bit-tog val 7))
  )
)

(defun bit-tog (v b)
  (if (> (logand v b) 0)
      (- v b)
      (+ v b)
  )
)
  