(defun c:madzicad_distance (/ pk1 pk2 delta_x delta_y delta_z message angledeg)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq pk1 (getpoint "\n Wska¿ pierwszy punkt:"))
  (setq pk2 (getpoint "\n Wska¿ drugi punkt:" pk1))
  ;(setq dist (distance pk1 pk2))
  (setq distcoords (mapcar '- pk1 pk2))
  (setq dist (sqrt (+ (expt (car distcoords) 2) (expt (cadr distcoords) 2))))
  (setq angledeg (cvunit (angle pk1 pk2) "radians" "degrees")) 
  
  (setq delta_x (abs (- (car pk1) (car pk2))))
  (setq delta_y (abs (- (cadr pk1) (cadr pk2))))
  (setq delta_z (abs (- (caddr pk1) (caddr pk2))))
  
  (setq message (strcat 
                        "\n Odleg³oœæ: \t\t" (rtos dist) "\t jednostek,\t" (rtos (/ dist 1000)) "\t [m]."
                        "\n K¹t w p³aszczyŸnie XY: \t" (rtos angledeg) "\t stopni.\t(" (rtos (- angledeg 360)) " stopni).\n"
                        "\n Delta X: \t\t" (rtos delta_x) "\t jednostek,\t\t" (rtos (/ delta_x 1000)) "\t [m].\t"
                        "\n Delta Y: \t\t" (rtos delta_y) "\t jednostek,\t\t" (rtos (/ delta_y 1000)) "\t [m].\t"
                        "\n Delta Z: \t\t" (rtos delta_z) "\t jednostek,\t\t" (rtos (/ delta_z 1000)) "\t [m].\t"))
  ;(alert message)
  (princ message)
  (message_text message "w")
  (startapp (strcat path "\\support\\madzicad_message_box.exe"))
  (princ)
)