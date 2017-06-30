(defun c:papier_model()
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (if
    (= (getvar "tilemode") 1)   ;tilemode=1 -> obszar mdoelu
    (progn
      (setvar "tilemode" 0)
      (if (= szacher_macher 1)
        (setvar "ltscale" skalalinii)
      )
      ;(setq prev_dim_scale (getvar "dimscale"))
      ;(setvar "dimscale" 10)
      ;(command "_regenall")
    )
    (progn
      (setvar "tilemode" 1)
      (if (= szacher_macher 1)
        (setvar "ltscale" (* skalalinii 100))
      )
      ;(setvar "dimscale" prev_dim_scale)
      ;(command "_regen")
    )
  )
  (command "_regenall")
  (princ)
)

