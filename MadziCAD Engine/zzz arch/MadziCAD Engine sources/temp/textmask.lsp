;;;
;;;  ***** Custom version updated to handle leader associations *****
;;;
;;;  ----------------------------------------------------------------
;;;
;;;    By Dominic Panholzer
;;;
;;;    TEXTMASK.LSP
;;;    Copyright © 1999 by Autodesk, Inc.
;;;
;;;    Your use of this software is governed by the terms and conditions of the
;;;    License Agreement you accepted prior to installation of this software.
;;;    Please note that pursuant to the License Agreement for this software,
;;;    "[c]opying of this computer program or its documentation except as
;;;    permitted by this License is copyright infringement under the laws of
;;;    your country.  If you copy this computer program without permission of
;;;    Autodesk, you are violating the law."
;;;
;;;    AUTODESK PROVIDES THIS PROGRAM "AS IS" AND WITH ALL FAULTS.
;;;    AUTODESK SPECIFICALLY DISCLAIMS ANY IMPLIED WARRANTY OF
;;;    MERCHANTABILITY OR FITNESS FOR A PARTICULAR USE.  AUTODESK, INC.
;;;    DOES NOT WARRANT THAT THE OPERATION OF THE PROGRAM WILL BE
;;;    UNINTERRUPTED OR ERROR FREE.
;;;
;;;    Use, duplication, or disclosure by the U.S. Government is subject to
;;;    restrictions set forth in FAR 52.227-19 (Commercial Computer
;;;    Software - Restricted Rights) and DFAR 252.227-7013(c)(1)(ii)
;;;    (Rights in Technical Data and Computer Software), as applicable.
;;;
;;;  ----------------------------------------------------------------
;;;
;;;     TEXTMASK uses a masking object (WIPEOUT, SOLID, or 3DFACE) to hide
;;;     all entities behind the selected text or mtext. The text object
;;;     is then grouped together with the masking object such that
;;;     they move, copy, erase, etc. together. To update after editing
;;;     text, run TEXTMASK again and select the text item to be updated.
;;;     The the previous masking object will be erased and a new one
;;;     will be created.
;;;
;;;
;;;
;;;  External Functions:
;;;
;;;     ACET-ERROR-INIT         --> ACETUTIL.FAS   Intializes bonus error routine
;;;     ACET-ERROR-RESTORE      --> ACETUTIL.FAS   Restores old error routine
;;;     ACET-GEOM-TEXTBOX       --> ACETUTIL.FAS   Returns textbox points for text or Mtext
;;;     ACET-GETVAR             --> ACETUTIL.FAS   Retrieves custom variables
;;;     ACET-GROUP-MAKE-ANON    --> ACETUTIL.FAS   Creates anonymous group
;;;     ACET-LAYER-LOCKED       --> ACETUTIL.FAS   Checks to see if layer is locked
;;;     ACET-LIST-M-ASSOC       --> ACETUTIL.FAS   Retrieves multiple assoc's from list
;;;     ACET-SPINNER            --> ACETUTIL.FAS   Creates spinning bar
;;;     ACET-SETVAR             --> ACETUTIL.FAS   Stores custom variables
;;;     ACET-SS-INTERSECTION    --> ACETUTIL.FAS   Returns ss with common entities
;;;     ACET-SS-NEW             --> ACETUTIL.FAS   Creates selection set from starting ent
;;;     ACET-SS-REDRAW          --> ACETUTIL.FAS   Redraws all entities in selection set
;;;     ACET-SS-REMOVE          --> ACETUTIL.FAS   Removes entities from selection set
;;;     ACET-SS-UNION           --> ACETUTIL.FAS   Combines two selection sets
;;;     ACET-STR-FORMAT         --> ACETUTIL.ARX   Alternate to strcat
;;;     ACET-SYSVAR-RESTORE     --> ACETUTIL.FAS   Restores sysvars from global list
;;;     ACET-SYSVAR-SET         --> ACETUTIL.FAS   Saves sysvars to global list
;;;     ACET-UCS-TO-OBJECT      --> ACETUTIL.FAS   Sets ucs to object
;;;     ACET-UI-POLYGON-SELECT  --> ACETUTIL.FAS   Simulates CP or WP and returns points
;;;     ACET-UI-FENCE-SELECT    --> ACETUTIL.FAS   Simulates fence selction and returns points
;;;     ACET-XDATA-SET          --> ACETUTIL.FAS   Attaches data to entity using xdata
;;;     ACET-XDATA-GET          --> ACETUTIL.FAS   Reads data from entity set with acet-xdata-set
;;;     BNS_SS_MOD              --> ACETUTIL.FAS   Filters selctions for locked layers etc.
;;;
 
 
; --------------------- GROUP LIST FUNCTION ----------------------
;   This function will return a list of all the group names in the
;   drawing and their entity names in the form:
;   (<ename of "ACAD_GROUP"> (<ename1> . <name1>) (<ename2> . <name2>))
; ----------------------------------------------------------------
 
(defun acet-textmask-group-list (/ GRP GDICT ITM NAM ENT GLST)
 
  (setq GRP   (dictsearch (namedobjdict) "ACAD_GROUP")
        GDICT (cdr (assoc -1 GRP))
  )
  (while (setq ITM (car GRP))       ; While edata item is available
    (if (= (car ITM) 3)             ; if the item is a group name
      (setq NAM (cdr ITM)           ; get the name
            GRP (cdr GRP)           ; shorten the edata
            ITM (car GRP)           ; get the next item
            ENT (cdr ITM)           ; which is the ename
            GRP (cdr GRP)           ; shorten the edata
            GLST (cons (cons ENT NAM) GLST)
      )
      (setq GRP (cdr GRP))          ; else shorten the edata
    )
  )
  (if GLST (setq GLST (cons GDICT GLST)))
  GLST                              ; return the list
)
 
 
; ----------------- MASK USING WIPEOUT FUNCTION ------------------
;   This function draws a wipeout under text TXT using the
;   offset value OSET
; ----------------------------------------------------------------
 
(defun acet-textmask-make-wipeout (ENT OSET / TXT TXTLAY TBX WIPOUT TXTYP TXTSTR)
 
  (setq TXT    (entget ENT (list "*"))               ; Get the text's edata
        TXTLAY (cdr (assoc 8 TXT))                   ; Get the layer of the text
        TXTYP  (cdr (assoc 0 TXT))                   ; Text or Mtext
        TXTSTR (cdr (assoc 1 TXT))
  )
 
  (if (/= TXTSTR "")
    (progn
 
      (if (= TXTYP "TEXT")
        (acet-ucs-cmd (list "_object" ENT))              ; set UCS to object
        (acet-ucs-to-object ENT)
      )
 
      (setq TBX (acet-geom-textbox TXT OSET))              ; Get the points around the text
 
      (if TBX
        (progn
          (command "_.pline")                        ; Create bounding pline box
           (while TBX
            (command (car TBX))
            (setq TBX (cdr TBX))
          )
          (command "_c")
 
          (command "_.wipeout" "_Polyline" (entlast) "_yes")  ; create wipeout entity          
 
          (setq WIPOUT (entlast))
 
          (command "_.change" WIPOUT "" "_Prop" "_Layer" TXTLAY "") ; and set its layer
 
          (acet-ucs-cmd (list "_previous"))              ; reset the ucs
 
          (entmake TXT)                              ; recreate text
          (setq TXT (entlast))                       ; such that it's on top
 
          (acet-xdata-set (list WIPOUT "ACET-TEXTMASK"
                          (list
                            (list "TextObject" (cdr (assoc 5 (entget TXT))) 1005)
                            (list "Offset" OSET 1040)
                          )
                        )
          )
 
          (acet-xdata-set (list TXT "ACET-TEXTMASK"
                          (list
                            (list "MaskObject" (cdr (assoc 5 (entget WIPOUT))) 1005)
                            (list "MaskType" "WIPEOUT" 1000)
                            (list "Offset" OSET 1040)
                          )
                        )
          )
 
          (command "_.move" TXT "" "0,0" "0,0")
 
          (acet-group-make-anon (list WIPOUT TXT) "In use by TEXTMASK") ; make the text and wipeout a group

;-----------------------------------------------------------------------------
          (if (= TXTYP "MTEXT")
            (acet-textmask-FixLeaderAssoc ENT TXT) ;CUSTOM: Added
          )
;-----------------------------------------------------------------------------
 
          (entdel ENT)                               ; delete original text
 
        )
      ); if TBX
    ); progn then
  ); if not ""
)
 
; ------------------ MASK USING 3DFACE FUNCTION ------------------
;   This function draws a 3DFace ontop of text TXT using the
;   offset value OSET. The FACE and the TXT are then each raised
;   in the z direction.
; ----------------------------------------------------------------
 
(defun acet-textmask-make-3dface (ENT OSET / TXT TXTLAY TBX FACE MOVDIST)
 
  (setq TXT    (entget ENT (list "*"))               ; Get the text's edata
        TXTLAY (cdr (assoc 8 TXT))                   ; Get the layer of the text
  )
 
  (setq TBX (acet-geom-textbox TXT OSET))                  ; Get the points around the text
 
  (if TBX
    (progn
      (command "_.3dface")                           ; Create a 3DFace with invisible edges
      (while TBX
        (command "_i" (car TBX))
        (setq TBX (cdr TBX))
      )
      (command "")
 
      (setq FACE (entlast))
      (command "_.change" FACE "" "_Prop" "_Layer" TXTLAY "") ; and set its layer
 
      (setq MOVDIST (* 0.01 (cdr (assoc 40 TXT))))
 
      (acet-xdata-set (list FACE "ACET-TEXTMASK"
                      (list
                        (list "TextObject" (cdr (assoc 5 TXT)) 1005)
                        (list "Offset" OSET 1040)
                        (list "ZOffset" MOVDIST 1040)
                      )
                    )
      )
 
      (acet-xdata-set (list ENT "ACET-TEXTMASK"
                      (list
                        (list "MaskObject" (cdr (assoc 5 (entget FACE))) 1005)
                        (list "MaskType" "3DFACE" 1000)
                        (list "Offset" OSET 1040)
                        (list "ZOffset" MOVDIST 1040)
                      )
                    )
      )
 
      (command "_.move" ENT FACE "" "0,0" (strcat "0,0," (rtos MOVDIST 2 8)))
      (command "_.move" ENT "" "0,0" (strcat "0,0," (rtos MOVDIST 2 8)))
 
      (acet-group-make-anon (list FACE ENT) "In use by TEXTMASK") ; make the text and 3DFace a group
 
    );progn then
  )
)
 
; ------------------- MASK USING SOLID FUNCTION ------------------
;   This function draws a solid ontop of text TXT using the
;   offset value OSET. The solid and the TXT are then each raised
;   in the z direction.
; ----------------------------------------------------------------
 
(defun acet-textmask-make-solid (ENT OSET / TXT TXTLAY TBX SOL MCOLOR TXTYP TXTSTR)
 
  (setq TXT    (entget ENT (list "*"))               ; Get the text's edata
        TXTLAY (cdr (assoc 8 TXT))                   ; Get the layer of the text
        TXTYP  (cdr (assoc 0 TXT))                   ; Text or Mtext
        TXTSTR (cdr (assoc 1 TXT))
  )
 
  (if (/= TXTSTR "")
    (progn
 
      (if (= TXTYP "TEXT")
        (acet-ucs-cmd (list "_object" ENT))              ; set UCS to object
        (acet-ucs-to-object ENT)
      )
 
      (setq TBX (acet-geom-textbox TXT OSET))              ; Get the points around the text
 
      (if TBX
        (progn
 
          (setq MCOLOR (acet-getvar (list "acet_textmask_maskcolor")))
 
          (if (= MCOLOR 0) (setq MCOLOR "BYBLOCK"))
          (if (= MCOLOR 256) (setq MCOLOR "BYLAYER"))
 
          (command "_.solid")                        ; Create a solid
          (command (car TBX))
          (command (cadr TBX))
          (command (cadddr TBX))
          (command (caddr TBX))
          (command "")
          (setq SOL (entlast))
          (command "_.change" SOL "" "_Prop" "_Layer" TXTLAY ) ; Set its layer
          (command "_color" (if MCOLOR MCOLOR 8) "")           ; and its color
 
          (acet-ucs-cmd (list "_previous"))              ; reset the ucs
 
          (entmake TXT)                              ; recreate text
          (setq TXT (entlast))                       ; such that it's on top
 
          (acet-xdata-set (list SOL "ACET-TEXTMASK"
                          (list
                            (list "TextObject" (cdr (assoc 5 (entget TXT))) 1005)
                            (list "Offset" OSET 1040)
                          )
                        )
          )
 
          (acet-xdata-set (list TXT "ACET-TEXTMASK"
                          (list
                            (list "MaskObject" (cdr (assoc 5 (entget SOL))) 1005)
                            (list "MaskType" "SOLID" 1000)
                            (list "MaskColor" "SOLID" 1000)
                            (list "Offset" OSET 1040)
                          )
                        )
          )
 
          (command "_.move" TXT "" "0,0" "0,0")
 
          (acet-group-make-anon (list SOL TXT) "In use by TEXTMASK") ; make the text and solid a group

;-----------------------------------------------------------------------------
          (if (= TXTYP "MTEXT")
            (acet-textmask-FixLeaderAssoc ENT TXT) ;CUSTOM: added
          )
;-----------------------------------------------------------------------------
 
          (entdel ENT)                               ; delete original text
        )
      ); if TBX
    )
  )
)
 
; -------------------- OPTION GETTING FUNCTION -------------------
;   This function returns a list of currently set textmask options
; ----------------------------------------------------------------
 
(defun acet-textmask-get-options (/ OSET MTYPE MCOLOR)
  (setq OSET   (acet-getvar '("acet_textmask_offset"))
        MTYPE  (acet-getvar '("acet_textmask_masktype"))
        MCOLOR (acet-getvar '("acet_textmask_maskcolor"))
  )
  (if (or (not OSET) (not (= (type OSET) 'REAL)))    ; If no prior valid setting
    (setq OSET 0.35)                                 ; use 0.35 as default.
  )
  (if (or (not MTYPE) (not (member MTYPE '("Wipeout" "3dface" "Solid")))) ; If no prior valid setting
    (setq MTYPE "Wipeout")                                        ; use Wipeout as default.
  )
  (if (or (not MCOLOR) (not (= (type MCOLOR) 'INT))) ; If no prior valid setting
    (setq MCOLOR 8)                                  ; use color 8 as default
  )
  (list OSET MTYPE MCOLOR)
)
 
; --------------------- TEXT UNMASK FUNCTION ---------------------
;   This function takes an entity name and removes any existing
;   masking from it. GLST is the global group list as returned
;   by the acet-textmask-group-list function
; ----------------------------------------------------------------
 
(defun acet-textmask-unmask (ENT GLST / DOIT RLST GDAT GNAM ELST ENT2 ETYP RETURN GDICT ZDIST)
 
  (setq GDICT (car GLST)
        GLST  (cdr GLST)
        DOIT  T
  )                                                    ; Initialize the continue flag
 
  (if (setq RLST (mapcar 'cdr (acet-list-m-assoc 330 (entget ENT)))) ; Get all 330 codes in text
    (foreach GRP RLST                                  ; step through each
      (and
        DOIT
        (setq GDAT (entget GRP))                       ; get its etype
        (= "GROUP" (cdr (assoc 0 GDAT)))               ; if it is a group
        (setq ELST (mapcar 'cdr (acet-list-m-assoc 340 GDAT))) ; get its members
        (= (length ELST) 2)                            ; if there are two
        (member ENT ELST)                              ; And the text is in the list
        (if (eq (car ELST) ENT)                        ; get the member which is not
          (setq ENT2 (cadr ELST))                      ; the text.
          (setq ENT2 (car ELST))
        )
        (setq ETYP (cdr (assoc 0 (entget ENT2))))      ; get the entity type
        (or
          (= ETYP "WIPEOUT")                           ; make sure it is a wipeout
          (= ETYP "3DFACE")                            ; or a 3dface
          (= ETYP "SOLID")                             ; or a Solid
        )
        (setq GNAM (cdr (assoc GRP GLST)))
        (dictremove GDICT GNAM)                        ; explode the group
        (entdel ENT2)                                  ; delete the mask
        (setq DOIT   nil
              RETURN ETYP
        )
        (progn
          (if (setq ZDIST (acet-xdata-get (list ENT "ACET-TEXTMASK" "ZOffset")))
            (command "_.move" ENT "" "0,0" ".xy" "0,0" (- 0 (* 2 ZDIST)))
          )
          (acet-xdata-set (list ENT "ACET-TEXTMASK"
                          (list
                            (list "MaskObject" nil)
                            (list "MaskType" nil)
                            (list "Offset" nil)
                            (list "ZOffset" nil)
                            (list "MaskColor" nil)
                          )
                        )
          )
        )
      )
    )
  )
  RETURN
)
 
; ----------------------------------------------------------------
; ---------------------- TEXT UNMASK PROGRAM ---------------------
; ----------------------------------------------------------------
 
(defun c:textunmask (/ FLTR CNT NUM GLST SS ENT)
  (acet-error-init
    (list
      (list "cmdecho"   0
            "limcheck"  0
            "pickstyle" 0
      )
      T     ;flag. True means use undo for error clean up.
    );list
  );acet-error-init
 
 
  (setq FLTR      '( (-4 . "<OR")                     ; Filter for ssget.
                         (0 . "MTEXT")
                         (0 . "TEXT")
                     (-4 . "OR>")
                   )
        CNT        0
        NUM        0
        GLST       (acet-textmask-group-list)         ; Get all the groups in drawing
 
  )
  (princ "\nSelect text or MText object from which mask is to be removed.")
  (setq SS (ssget FLTR))
  (if SS
    (setq SS (car (bns_ss_mod SS 3 T)))      ; Remove all that are not in current space or on locked layer
  )
  (if SS
    (progn
      (princ "\nUnmasking text  ")
      (While (setq ENT (ssname SS CNT))      ; step through each object in set
        (if (acet-textmask-unmask ENT GLST)
          (setq NUM (1+ NUM))
        )
        (acet-spinner)
        (setq CNT (1+ CNT))
      )
      (cond
        ((= NUM 0)
          (princ "\rNo masked text objects selected.")
        )
        ((= NUM 1)
          (princ "\rRemoved mask from one text object.")
        )
        (T
          (princ (acet-str-format "\rRemoved mask from %1 text objects."  (itoa NUM)))
        )
      )
    )
    (prompt "\nNothing selected.")
  )
  (acet-error-restore)                                  ; Restore values
)
 
 
; ----------------------------------------------------------------
; ----------------------- TEXTMASK PROGRAM -----------------------
; ----------------------------------------------------------------
 
(defun c:textmask (/ acet-textmask-get-text CNT GLST OSET ENT LOCKED SSMASTER 
                     TMOPTIONS MTYPE ELAST)
 
; --------------------- Error initialization ---------------------
 
  (acet-error-init
    (list
      (list "cmdecho"   0
            "plinewid"  0
            "highlight" 0
            "osmode"    0
            "dimzin"    0
            "cecolor"   "bylayer"
            "limcheck"  0
            "pickstyle" 0
            "ucsicon"   (getvar "ucsicon")
      )
      T     ;flag. True means use undo for error clean up.
      '(progn
         (if SSMASTER (acet-ss-redraw SSMASTER 4))
         (acet-sysvar-set (list "cmdecho" 0));turn cmdecho off
         (command "_.redraw");do redraw
         (acet-sysvar-restore);re-set cmdecho back
         (princ)
         ;(command "_.redraw")
       )
    );list
  );acet-error-init
  (sssetfirst nil nil)
 
 
; ------------------ GET TEXT FROM USER FUNCTION -----------------
;   This function queries the user for the text to process
;   and returns a selection set
; ----------------------------------------------------------------
 
  (defun acet-textmask-get-text (/ TMOPTIONS OSET OSETSTR MTYPE MCOLOR SELMODE EN SS
                            SSLIST SSMASTER SSPREV MSKLOOP FLTR LOOP UNDOFLAG
                            UNDOMODE PT1 ANS WIPOUT MCOLOR_NEW UNDOLOOP PTLST
                         )
 
 
  (if (member "wipeout.arx" (arx))
    (setq WIPOUT 1)
  )
 
    (setq FLTR      '( (-4 . "<OR")                    ; Filter for ssget.
                           (0 . "MTEXT")
                           (0 . "TEXT")
                       (-4 . "OR>")
                     )
          LOOP      T
          UNDOFLAG  0
          SSPREV    (ssget "_p" FLTR)                  ; get the previous selection set for use w/ P option
          SELMODE   "Add"                              ; Set initial selection add/remove mode
          UNDOMODE  "Add"                              ; Set initial undo add/remove mode
    )
 
    (while LOOP
      (setvar "errno" 0)
      (setq TMOPTIONS (acet-textmask-get-options)      ; Get the currently set options
            OSET      (nth 0 TMOPTIONS)                ; Get the offset factor
            OSETSTR   (rtos OSET 2)                    ; Get the offset factor in string form
            MTYPE     (nth 1 TMOPTIONS)                ; Get the mask type (wipeout, 3dface, or Solid)
            MCOLOR    (nth 2 TMOPTIONS)                ; Get the mask color (used for solid option)
      )
 
      (initget "Masktype Offset Undo Window Crossing BOX ALL Previous Add Remove WPolygon CPolygon Fence _Masktype Offset Undo Window Crossing BOX ALL Previous Add Remove WPolygon CPolygon Fence")
      (princ (acet-str-format "\nCurrent settings: Offset factor = %1, Mask type = %2" OSETSTR MTYPE))
      (if (= MTYPE "Solid")
        (princ (acet-str-format ", Mask color = %1" (itoa MCOLOR)))
      )
 
      (if (= SELMODE "Add")
        (setq EN (entsel "\nSelect text objects to mask or [Masktype/Offset]: "))
        (setq EN (entsel "\nSelect text objects to remove or [Masktype/Offset]: "))
      )
 
      (cond
 
;-- object selected --
 
        ((and (= (type EN) 'LIST)                                     ; If an object was selected
              (= (type (setq EN (car EN))) 'ENAME)
              (member (cdr (assoc 0 (entget EN))) '("MTEXT" "TEXT"))  ; and it is TEXT or MTEXT
         )
          (if (not (acet-layer-locked (cdr (assoc 8 (entget EN)))))
            (if (= SELMODE "Add")
              (progn
                (princ "\n1 found")                    ; report it
                (redraw EN 3)                          ; Highlight the object
                (setq SS       (ssadd EN)
                      SSLIST   (cons SS SSLIST)        ; Add it to the list of selection sets
                      SSMASTER (if SSMASTER            ; and add it to the master selection set
                                 (ssadd EN SSMASTER)
                                 (ssadd EN)
                               )
                )
              )
              (progn
                (if (and SSMASTER (ssmemb EN SSMASTER)) ; If the object has been selected
                  (progn
                    (princ "\n1 removed")              ; report it
                    (redraw EN 4)                      ; Unhighlight the object
                    (setq SS       (ssadd EN))         ; make a selset out of it
                    (setq SSLIST   (cons SS SSLIST)    ; Add it to the list of selection sets
                          SSMASTER (ssdel EN SSMASTER) ; and remove it from the master selection set
                    )
                  )
                )
              )
            )
            (princ "\nObject is on a locked layer.")
          )
        )
 
;-- nothing selected --
 
        ((= (getvar "errno") 7)                        ; If thin air was selected
          (setq PT1 (cadr (grread t)))                 ; grab the last point
          (prompt "\nOther corner: ")
          (command "_.move" "_box" PT1)                ; use the move command to get box selection
          (setvar "cmdecho" 1)
          (command pause)
          (setvar "cmdecho" 0)
          (command "")
          (if (wcmatch (getvar "cmdnames") "*MOVE*")   ; If something was selected
            (progn
              (command "0,0" "0,0")                    ; move it nowhere
              (setq SS (ssget "_p" FLTR))              ; and filter the selection for text objects
              (if SS                                   ; If text was selected
                (if (= SELMODE "Add")                  ; If in add selection mode
                  (progn
                    (princ (acet-str-format "\n%1 found" (itoa (sslength SS))))  ; report it
                    (setq SSLIST   (cons SS SSLIST)                     ; Add it to the list of selection sets
                          SSMASTER (acet-ss-union (list SSMASTER SS)); and add it to the master selection set
                    )
                    (acet-ss-redraw SSMASTER 3)
                  )
                  (progn                                 ; if in remove selection mode
                    (if (and SSMASTER (setq SS (acet-ss-intersection SS SSMASTER))) ; If selected items to be removed
                      (progn                                                     ; are in the master ss
                        (princ (acet-str-format "\n%1 removed" (itoa (sslength SS))))     ; report it
                        (setq SSLIST   (cons SS SSLIST)                     ; Add it to the list of selection sets
                              SSMASTER (acet-ss-remove SS SSMASTER)      ; and remove it from the master selection set
                        )
                        (acet-ss-redraw SSMASTER 3)
                      )
                    )
                  )
                )
              )
            )
          )
        )
 
;-- get offset value --
 
        ((= EN "Offset")
          (princ (acet-str-format "\nMask offset currently set to %1" OSETSTR))
          (initget 4)                                                           ; No negative values allowed
          (setq ANS (getreal (acet-str-format "\nEnter offset factor relative to text height <%1>: " OSETSTR)))
          (if ANS
            (acet-setvar (list "acet_textmask_offset" ANS 3)) ; If setvar function exists use it
          )
        )
 
;-- get mask type --
 
        ((= EN "Masktype")
          (setq MSKLOOP T)
          (while MSKLOOP
            (princ (acet-str-format "\nMask type currently set to %1" MTYPE))
            (if (= WIPOUT 0)
              (progn
                (initget "3dface Solid _3dface Solid")
                (setq ANS (getkword (acet-str-format "\nSpecify entity type to use for mask [3dface/Solid] <%1>: "  MTYPE )))
              )
              (progn
                (initget "Wipeout 3dface Solid _Wipeout 3dface Solid")
                (setq ANS (getkword (acet-str-format "\nSpecify entity type to use for mask [Wipeout/3dface/Solid] <%1>: "  MTYPE )))
              )
            )
            (cond
              ((and (= ANS "Wipeout") (not WIPOUT))
                (princ "\nLoading WIPEOUT for use with TEXTMASK...")
                (setq WIPOUT 1)
                (setq MSKLOOP nil)
                (acet-setvar (list "acet_textmask_masktype" ANS 3))  ; Save the mask type
              )
              ((or (= ANS "Solid") (and (not ANS) (= MTYPE "Solid")))
                (setq MCOLOR_NEW (acad_colordlg MCOLOR))
                (if (and MCOLOR_NEW)                            ; If OK was selected
                  (progn
                    (acet-setvar (list "acet_textmask_masktype" ANS 3))  ; Save the mask type
                    (acet-setvar (list "acet_textmask_maskcolor" MCOLOR_NEW 3)) ; and the color
                  )
                )
                (setq MSKLOOP nil)
              )
              ((not ANS)
                (setq MSKLOOP nil)
              )
              (T
                (acet-setvar (list "acet_textmask_masktype" ANS 3)) ; If setvar function exists use it
                (setq MSKLOOP nil)
              )
            )
          )
        )
 
;-- switch Add/Remove mode --
 
        ((or (= EN "Add") (= EN "Remove"))
          (if (/= SELMODE  EN)                         ; If the selected mode is not already current
            (setq SSLIST   (cons SELMODE SSLIST)       ; uappend the undo list with the current mode
                  SELMODE  EN                          ; set the new selection mode current, and
                  UNDOMODE EN                          ; set the undo mode to the same
            )
          )
        )
 
;-- do an undo --
 
        ((= EN "Undo")
          (setq UNDOLOOP T)
          (while UNDOLOOP                              ; start to loop
            (cond
              ((not SSLIST)                                  ; If there is no undo list
                (princ "\nAll selections have been undone.") ; report it
                (setq UNDOLOOP nil)                          ; and break the loop
              )
              ((equal (type (car SSLIST)) 'STR)        ; If the current list item is a mode
                (setq UNDOMODE (car SSLIST)            ; switch the undo mode
                      SSLIST  (cdr SSLIST)             ; and remove the item
                )
              )
              ((equal (type (car SSLIST)) 'PICKSET)    ; If the current list item is a selset
                (if (= UNDOMODE "Add")                 ; and the undo mode is add
                  (progn
                    (acet-ss-redraw (car SSLIST) 4)                       ; Unhighlight the selection
 
                    (setq SSMASTER (acet-ss-remove (car SSLIST) SSMASTER) ; Remove the set from the master list
                          SSLIST   (cdr SSLIST)                          ; and shorten the list
                    )
                    (acet-ss-redraw SSMASTER 3)         ; rehighlight the master selection
                  )
                  (progn                                                       ; if the undo mode is remove
                    (setq SSMASTER (acet-ss-union (list (car SSLIST) SSMASTER)) ; add the selset to the master list
                          SSLIST   (cdr SSLIST)                                ; and shorten the list
                    )
                    (acet-ss-redraw SSMASTER 3)         ; rehighlight the master selection
                  )
                )
                (setq SELMODE  "Add"                   ; Set the selection mode to add
                      UNDOLOOP nil                     ; and exit the undo loop
                )
              )
            )
          )
        )
 
;-- get all --
 
        ((= EN "ALL")
          (setq SS (ssget "_x" FLTR))
          (if SS
            (setq SS (car (bns_ss_mod SS 3 T)))        ; Remove all that are not in current space or on locked layer
            (princ "\nNothing found")
          )
          (if SS                                       ; If text was selected
            (if (= SELMODE "Add")                      ; If in add selection mode
              (progn
                (princ (acet-str-format "\n%1 found" (itoa (sslength SS)) ))  ; report it
                (setq SSLIST   (cons SS SSLIST)                     ; Add it to the list of selection sets
                      SSMASTER (acet-ss-union (list SSMASTER SS)); and add it to the master selection set
                )
                (acet-ss-redraw SSMASTER 3)
              )
              (progn                                   ; if in remove selection mode
                (if (and SSMASTER (setq SS (acet-ss-intersection SS SSMASTER))) ; If selected items to be removed
                  (progn                                                     ; are in the master ss
                    (princ (acet-str-format "\n%1 removed" (itoa (sslength SS)) ))     ; report it
                    (setq SSLIST   (cons SS SSLIST)                     ; Add it to the list of selection sets
                          SSMASTER (acet-ss-remove SS SSMASTER)      ; and remove it from the master selection set
                    )
                    (acet-ss-redraw SS 4)
                  )
                )
              )
            )
          )
        )
 
;-- do a window, box, or crossing --
 
        ((or (= EN "Window") (= EN "Crossing")(= EN "BOX"))
          (command "_.move" (strcat "_" EN))
          (princ "\nFirst corner: ")
          (command pause)
          (princ "Other corner: ")
          (command pause "")                           ; use the move command to get box selection
          (if (wcmatch (getvar "cmdnames") "*MOVE*")   ; If something was selected
            (progn
              (command "0,0" "0,0")                    ; move it nowhere
              (setq SS (ssget "_p" FLTR))              ; and filter the selection for text objects
              (if SS                                   ; If text was selected
                (if (= SELMODE "Add")                  ; If in add selection mode
                  (progn
                    (princ (acet-str-format "\n%1 found" (itoa (sslength SS)) ))  ; report it
                    (setq SSLIST   (cons SS SSLIST)                     ; Add it to the list of selection sets
                          SSMASTER (acet-ss-union (list SSMASTER SS)); and add it to the master selection set
                    )
                    (acet-ss-redraw SSMASTER 3)
                  )
                  (progn                               ; if in remove selection mode
                    (if (and SSMASTER (setq SS (acet-ss-intersection SS SSMASTER))) ; If selected items to be removed
                      (progn                                                     ; are in the master ss
                        (princ (acet-str-format "\n%1 removed" (itoa (sslength SS)) ))     ; report it
                        (setq SSLIST   (cons SS SSLIST)                     ; Add it to the list of selection sets
                              SSMASTER (acet-ss-remove SS SSMASTER)      ; and remove it from the master selection set
                        )
                        (acet-ss-redraw SSMASTER 3)
                      )
                    )
                  )
                )
                (princ "\nNothing found")
              )
            )
            (princ "\nNothing found")
          )
        )
 
;-- do fence or window/crossing poly --
 
        ((or (= EN "WPolygon") (= EN "CPolygon") (= EN "Fence"))
          (if (= EN "Fence")
            (setq EN    (substr EN 1 1)
                  PTLST (acet-ui-fence-select)
            )
            (setq EN    (substr EN 1 2)
                  PTLST (acet-ui-polygon-select (if (= EN "WP") 0 1))
            )
          )
          (if (and PTLST (setq SS (ssget (strcat "_" EN) PTLST FLTR)))
            (setq SS (car (bns_ss_mod SS 3 T)))        ; Remove all that are not in current space or on locked layer
            (princ "\nNothing found")
          )
          (if SS
            (if (= SELMODE "Add")                      ; If in add selection mode
              (progn
                (princ (acet-str-format "\n%1 found" (itoa (sslength SS)) ))  ; report it
                (setq SSLIST   (cons SS SSLIST)                     ; Add it to the list of selection sets
                      SSMASTER (acet-ss-union (list SSMASTER SS)); and add it to the master selection set
                )
                (acet-ss-redraw SSMASTER 3)
              )
              (progn                                   ; if in remove selection mode
                (if (and SSMASTER (setq SS (acet-ss-intersection SS SSMASTER))) ; If selected items to be removed
                  (progn                                                     ; are in the master ss
                    (princ (acet-str-format "\n%1 removed" (itoa (sslength SS)) ))     ; report it
                    (setq SSLIST   (cons SS SSLIST)                     ; Add it to the list of selection sets
                          SSMASTER (acet-ss-remove SS SSMASTER)      ; and remove it from the master selection set
                    )
                    (acet-ss-redraw SS 4)
                  )
                )
              )
            )
          )
        )
 
;-- get previous --
 
        ((= EN "Previous")
          (if (setq SS SSPREV)                         ; If text was in the previous Selection set
            (setq SS (car (bns_ss_mod SS 3 T)))        ; Remove all that are not in current space or on locked layer
            (princ "\nNo text or Mtext in previous selection set.")
          )
          (if SS
            (if (= SELMODE "Add")                      ; If in add selection mode
              (progn
                (princ (acet-str-format "\n%1 found" (itoa (sslength SS)) ))  ; report it
                (setq SSLIST   (cons SS SSLIST)                     ; Add it to the list of selection sets
                      SSMASTER (acet-ss-union (list SSMASTER SS))    ; and add it to the master selection set
                )
                (acet-ss-redraw SSMASTER 3)
              )
              (progn                                   ; if in remove selection mode
                (if (and SSMASTER (setq SS (acet-ss-intersection SS SSMASTER))) ; If selected items to be removed
                  (progn                                                     ; are in the master ss
                    (princ (acet-str-format "\n%1 removed" (itoa (sslength SS)) ))     ; report it
                    (setq SSLIST   (cons SS SSLIST)                     ; Add it to the list of selection sets
                          SSMASTER (acet-ss-remove SS SSMASTER)      ; and remove it from the master selection set
                    )
                    (acet-ss-redraw SS 4)
                  )
                )
              )
            )
          )
        )
 
;-- exit --
 
        ((not EN)
          (setq LOOP nil)
        )
      )
    )
    SSMASTER
  )
 
; ----------------------------------------------------------------
;                          MAIN PROGRAM
; ----------------------------------------------------------------
 
 
; ------------------------ Get User input ------------------------
 
  (setq SSMASTER (acet-textmask-get-text))
 
  (setq CNT       0                                    ; Initilize the counter.
        TMOPTIONS (acet-textmask-get-options)          ; Get the currently set options
        OSET      (nth 0 TMOPTIONS)                    ; Get the offset factor
        MTYPE     (nth 1 TMOPTIONS)                    ; Get the mask type (wipeout or 3dface)
        GLST      (acet-textmask-group-list)           ; Get all the groups in drawing
  )
 
; ---------------------- get text to mask ------------------------
 
 
  (if SSMASTER
    (progn
      (acet-ss-redraw SSMASTER 4)                       ; Unhighlight everything
 
      (if (= MTYPE "Wipeout")
        (command "_.wipeout" "_frame" "_off")          ; Turn off wipeout frames
      )
 
      (if (acet-layer-locked (getvar "clayer"))         ; if current layer is locked
        (progn
          (command "_.layer" "_unl" (getvar "clayer") "")  ; unlock it
          (setq LOCKED T)
        )
      )
 
      (setvar "ucsicon" 0)
 
; ----------------- Step through each and mask -------------------
 
      (princ (acet-str-format "\nMasking text with a %1  "  MTYPE ))
 
      (setq ELAST (entlast))
 
      (While (setq ENT (ssname SSMASTER CNT))          ; step through each object in set
 
        (acet-textmask-unmask ENT GLST)                ; remove any existing masks
 
 
          (cond
            ((= MTYPE "Wipeout")
              (acet-textmask-make-wipeout ENT OSET)
            )
            ((= MTYPE "3dface")
              (acet-textmask-make-3dface ENT OSET)
            )
            ((= MTYPE "Solid")
              (acet-textmask-make-solid ENT OSET)
            )
          )
 
          (if (not (= MTYPE "Wipeout"))                ; Since wipeout is noisey exclude
            (acet-spinner)                              ; from spinner activity
          )
 
        (setq CNT (1+ CNT))                            ; get the next text item
      ); while
 
      (if LOCKED (command "_.layer" "_lock" (getvar "clayer") "")) : relock if needed
      (princ (acet-str-format "\r%1 text items have been masked with a %2." (itoa CNT) MTYPE))
 
      (setq SSMASTER (acet-ss-new ELAST))               ; Gather up all new entities
      (if SSMASTER (command "_.select" SSMASTER ""))   ; and make them the current ss
 
    );progn
    (prompt "\nNothing selected.")
  );if SSMASTER
 
  (acet-error-restore)                              ; Restore values
 
)


;;; --------------------------------------------------------------------------
;;; Custom additions to handle leader associations
;;; --------------------------------------------------------------------------

;Searches old mtext object for leader associations and attaches them to the
;new mtext object
(defun acet-textmask-FixLeaderAssoc ( OLDTXT NEWTXT / REACTORLIST ENAME EDATA )
  (setq REACTORLIST (acet-textmask-GetSubList "ACAD_REACTORS" (entget OLDTXT)) )
  (foreach ENAME REACTORLIST
    (setq ENAME (cdr ENAME)
          EDATA (entget ENAME)
    )
    (if (= (cdr (assoc 0 EDATA)) "LEADER")
      (command "_.qldetachset" ENAME ""
               "_.qlattach" ENAME NEWTXT
      )
    )
  )
)

;Returns specified sub-list (102 . "{name") ... (102 . "}") or nil
(defun acet-textmask-GetSubList ( SLNAME LST / INDX RESULT )
  (if (setq INDX (vl-position (cons 102 (strcat "{" SLNAME)) LST) )
    (repeat (1- (- (vl-position '(102 . "}") LST) INDX))
      (setq INDX   (1+ INDX)
            RESULT (append RESULT (list (nth INDX LST)))
      )
    )
  )
  RESULT
)

;;; --------------------------------------------------------------------------

(princ)