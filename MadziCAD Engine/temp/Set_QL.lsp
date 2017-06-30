;; ***********************************************************************
;; * Set_QL.lsp written by Chip Harper 11-23-03                          *
;; *                                                                     *
;; * Email: hot4cad@hotmail.com                                          *
;; * Homepage:                                                           *
;; *                                                                     *
;; * Original code by Frank Whaley, Autodesk                             *
;; * Resets leader settings to company standards                         *
;; *                                                                     *
;; * This application was written for and tested on AutoCAD 2004         *
;; *                                                                     *
;; * This lisp is FREEWARE, you may distribute, copy, edit and/or modify *
;; * this program as you desire.                                         *
;; *                                                                     *
;; * This application is provided "AS IS". No warranties, implied or     *
;; * otherwise.                                                          *
;; *                                                                     *
;; ***********************************************************************
;;
;;
;; ****************************************
;; *    ==  Error Handler  ==             *
;; *                                      *
;; ****************************************
;;
;;
  (defun ETRAP (msg)
     (if (or								
            (= msg "Function cancelled")				; If user cancelled
            (= msg "quit / exit abort")					; If user aborted
         )								; End or sequence
      (princ)	  			  				; Exit quietly
      (princ (strcat "\nError: " msg))					; Otherwise report error message
     )	                                                                ; End if sequence
;;
;; **** Variable Resets ****
;;
    (setvar "cmddia" CCDI)                                              ; Reset cmddia variable
    (setvar "cmdecho" CCME)						; Reset cmdecho variable
    (setvar "cecolor" CCOL)                                             ; Reset color variable
    (setvar "dimscale" CDMS)                                            ; Reset dimscale variable
    (setvar "filedia" CFDI)                                             ; Reset fiedia variable
    (setvar "celtype" CLTY)                                             ; Reset linetype variable
    (setvar "clayer" CLAY)                                              ; Reset layer variable
    (setvar "orthomode" CORM)                                           ; Reset ortho variable
    (setvar "osmode" COSM)                                              ; Reset osnaps variable
    (setvar "snapang" CSAN)                                             ; Reset snapang variable
;;                                            
;; **** Screen Prompts ****
;;
    (prompt "\n")							; Clear text line
    (princ (strcat CLFN " Terminated"))	                  		; Notify Operator
    (setq *error* PERROR)						; Reset Previous Error Function
    (princ)								; Nil supression
  )                                                                     ; End ETRAP
;;
;;
;; ****************************************
;; *    ==  End Error Handler  ==         *
;; *                                      *
;; ****************************************
;;
;;
;;
;; ****************************************
;; *    ==  Main Function  ==             *
;; *                                      *
;; ****************************************
;;
  (defun c:QLSET ()
;;
;; **** Sets general conditions ****
;;
    (setq PERROR *error*)						 ; Get previous error
    (setq *error* ETRAP)						 ; Set error trap
    (setq CLFN "QLSET")	   					         ; Set current lisp function name
;;
    (setq CCDI (getvar "cmddia"))                                        ; Get cmddia setting
    (setq CCME (getvar "cmdecho"))                                       ; Get cmdecho setting
    (setq CCOL (getvar "cecolor"))                                       ; Get current color
    (setq CDMS (getvar "dimscale"))                                      ; Get dimscale setting
    (setq CFDI (getvar "filedia"))                                       ; Get filedia setting
    (setq CLTY (getvar "celtype"))                                       ; Get current linetype
    (setq CLAY (getvar "clayer"))                                        ; Get current layer
    (setq CORM (getvar "orthomode"))                                     ; Get ortho setting
    (setq COSM (getvar "osmode"))                                        ; Get osnap settings
    (setq CSAN (getvar "snapang"))                                       ; Get snapang setting
;;
    (setvar "cmdecho" 0)
;;
;; **** Start Of Original Code ****
;;
  ;|
  qlset.lsp - example initialization of QLEADER settings
  Frank Whaley, Autodesk

  Two functions are included in this file:

  (acet-ql-get)
  Returns an association list containing the current QLEADER settings from the Named Object Dictionary.

  (acet-ql-get <alist>)
  Sets the specified values for QLEADER settings from the given association list.
  Returns an association list containing the new values.

  These functions can be used to examine the current QLEADER settings, or to initialize the setting before using the QLEADER   command.
  For example, to use splined leaders and framed text:

  (acet-ql-set '((65 . 1)(72 . 1)))

  Both functions use the following group codes to identify QLEADER settings:

    3: user arrowhead block name (default="")
   40: default text width (default=0.0)
   60: annotation type (default=0)
       0=MText
       1=copy object
       2=Tolerance
       3=block
       4=none
   61: annotation reuse (default=0)
       0=none
       1=reuse next
   62: left attachment point (default=1)
   63: right attachment point (default=3)
       0=Top of top line
       1=Middle of top line
       2=Middle of multiline text
       3=Middle of bottom line
       4=Bottom of bottom line
   64: underline bottom line (default=0)
   65: use splined leader line (default=0)
   66: no limit on points (default=0)
   67: maximum number of points (default=3)
   68: prompt for MText width (word wrap) (default=1)
   69: always left justify (default=0)
   70: allowed angle, first segment (default=0)
   71: allowed angle, second segment (default=0)
       0=Any angle
       1=Horizontal
       2=90deg
       3=45deg
       4=30deg
       5=15deg
   72: frame text (default=0)
  170: active tab (default=0)
       0=Annotation
       1=Leader Line & Arrow
       2=Attachment
  340: object ID for annotation reuse

  |;

  (defun acet-ql-get (/ xr cod itm reply)
    (if (setq xr (dictsearch (namedobjdict) "AcadDim"))
      (progn
        (foreach cod '(3 40 60 61 62 63 64 65 66 67 68 69 70 71 72 170 340)
          (if (setq itm (assoc cod xr))
            (setq reply (append reply (list itm)))))
        reply)
      '((3 . "")
        (40 . 0.0)
        (60 . 0)
        (61 . 1)
        (62 . 1)
        (63 . 3)
        (64 . 0)
        (65 . 0)
        (66 . 0)
        (67 . 3)
        (68 . 0)
        (69 . 0)
        (70 . 0)
        (71 . 0)
        (72 . 0)
        (170 . 0))))

  (defun acet-ql-set (arg / cur prm) ;;  fetch current
    (setq cur (acet-ql-get))

    ;;  override per argument
    (while arg
      (setq prm (car arg)
            arg (cdr arg)
            cur (subst prm (assoc (car prm) cur) cur) )
      ;;  handle DIMLDRBLK
      (if (= 3 (car prm))
        (setvar "DIMLDRBLK" (cdr prm))))

    ;;  put back
    (dictremove (namedobjdict) "AcadDim")
    (setq cur (append '((0 . "XRECORD")(100 . "AcDbXrecord")(90 . 990106)) cur))
    (dictadd (namedobjdict) "AcadDim" (entmakex cur))

    (acet-ql-get))

  ;;  load quietly
;;
;; **** End Of Original Code ****
;;
;;
;; ****************************************
;; *  ==  Company Standards Set Here  ==  *
;; *                                      *
;; ****************************************
;;
  (acet-ql-set 
  '(
   (3 . "")
   (40 . 0.0)
   (60 . 0)
   (61 . 0)
   (62 . 2)
   (63 . 2)
   (64 . 0)
   (65 . 0)
   (66 . 0)
   (67 . 2)
   (68 . 0)
   (69 . 0)
   (70 . 0)
   (71 . 0)
   (72 . 0)
   (170 . 1)
  ))
;;
;; **** Reset conditons *****
;;
    (setvar "cmdecho" CCME)						 ; Reset used variables
    (setq *error* PERROR)                                            	 ; Reset previous error
    (prompt "\nLeader Settings Complete!")                               ; Notify Operator
    (prompt "\n.    ")                                                   ; Clear the command Line
    (princ)                                                              ; Nil supression
  )                                                                      ; End defun c:scut   
;;
;; ****************************************
;; *    ==  End Main Function  ==         *
;; *                                      *
;; ****************************************
;;
;;
;; ****************************************
;; *    ==    Load Message     ==         *
;; *                                      *
;; ****************************************
;;
    (prompt "\n  QLSET.lsp Loaded") 
    (prompt "\n  Written by Chip Harper")    
    (prompt "\n    ")       
;;
;; ****************************************
;; *    ==       AutoRun       ==         *
;; *                                      *
;; ****************************************
;;
  (c:qlset)
;;
;; ****************************************
;; *    ==     End of File     ==         *
;; *                                      *
;; ****************************************
;;