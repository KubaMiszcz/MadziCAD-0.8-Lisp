(defun midpt (pt1 pt2 /)
  (setq midpt (polar pt1 (angle pt1 pt2) (/ (distance pt1 pt2) 2.0))) ;2.0 -> punkt w polowie
)