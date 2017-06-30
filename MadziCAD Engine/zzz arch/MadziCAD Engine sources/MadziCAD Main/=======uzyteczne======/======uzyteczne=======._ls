======================================jakies cuda przenisc ot gdzies

;kasowanie XDATA
(defun c:dxd (/ ss e)
  (setq ss (ssget (LIST (LIST -3 (list "madzicad")))))
  (while (setq e (ssname ss 0 ))
    (ssdel e ss)
    (entmod 
      (list 
        (cons -1 e) 
        (list -3 (list "madzicad"))
      )
    )
  )
)

(
(vlax-dump-object (vlax-ename->vla-object (car(entsel))))  ; spis wlasciwosci i metod
(vla-getboundingbox (vlax-ename->vla-object (car(entsel))) 'bbox1 'bbox2)  ;
)




(vl-registry-read
(strcat "HKEY_LOCAL_MACHINE\\" (vlax-product-key))
"ProductName"
)

(vl-registry-read "HKEY_local_machine\\software\\madzicad\\" "kuba")
(vl-registry-write "HKEY_local_machine\\software\\madzicad\\" "kuba" "miszcz")

XDATA
 (REGAPP "madzicad")
 (setq ent (entget (entsel)))
 (setq ll (list (list -3 (list "MMM" (cons 1000 "asd0")) (list "madzicad" (cons 1000 "asdasd")))))
 (setq ent (append ent ll))
 (entmod ent)
 
 odczyt XDATA
 (entget (car (entsel)) '("ACAD"))



  ;tworzenie opisu
  (setq dlugosc_preta_string 
    (strcat 
      "%<\\AcObjProp Object(%<\\_ObjId "
      (itoa(vla-get-ObjectId (vlax-ename->vla-object 
        ksztalt_preta
      )))
      ">%).Length \\f \"%lu2%pr0%ps[L=,cm]%ct8[0.1]\">%"
    ) 
  )
  (setq srednica_preta_string 
    (strcat 
      "%<\\AcObjProp Object(%<\\_ObjId "
      (itoa(vla-get-ObjectId (vlax-ename->vla-object 
        ksztalt_preta
      )))
      ">%).ConstantWidth \\f \"%lu2%pr0%ps[%%c,]\">%"
    ) 
  )

 
 ========================================================================
 czekanie az uzytkonik skonczy cos robic np rysowac polilnie
 ========================================================================
  (if (= (cdr (assoc 0 (entget (ssname temp_selection 0)))) "LWPOLYLINE")
    (progn
      (command "_pedit" temp_selection "_join"
        (progn
          (while (= (logand (getvar "cmdactive") 1) 1)
            (command pause)
          )
        )
      )
    )    
  )
 
 
 

(defun c:sssssssss (/ ss vevo)
  (if
    (setq ss (car (entsel "\nPick an object dimension")))
    (progn
      (setq vevo (vlax-ename->vla-object ss))
      (vlax-dump-object vevo) select a option as what are you need

      (setq tc (vlax-get vevo 'TextColor))
      (vlax-put vevo 'TextColor 1)
      ) ; progn
    (alert "\nInvalid selected object,try again")
    )   ; if
  (princ)
  )
  
  
  
========================================================================  
Retrieve XData and convert to a list
Arguments - ActiveX object and appID of registered xdata app
Retval - eed list
========================================================================
(defun vla:GetXData (vlaObj AppID / xType XData)
(vla-getxdata vlaObj AppID 'xType 'xData)
(mapcar '(lambda (key val)
(cons key
(if (/= key 1010 key 1011 key 1012 key 1013)
(vlax-variant-value val)
(vlax-safearray->list (vlax-variant-value val))
)
)
)
(vlax-safearray->list xType)
(vlax-safearray->list xData)
)
)















Re:
The previous versions weren't working with empty
safearrays. This version seems to be better:

(defun lisp-value (v) ; the Holy Graal of vla->lisp conversion? ;-)
;; Copyright 2002 Vladimir Nesterovsky.
;; Free for use by any commercial entity with
;; less then $100 million annual revenue.
(cond
((= (type v) 'variant)
(lisp-value (variant-value v)))
((= (type v) 'safearray)
(mapcar 'lisp-value (safearray-value v)))
(T v)))

I couldn't find any documentation on variant-value or
safearray-value functions but it seems they are preferred
to their vlax- counterparts.


(defun c:midpttttttttt ( / pt1 pt2)
(setq pt1 (getpoint "\nSelect first point: "))
(setq pt2 (getpoint "\nSelect second point: "))
(command "_circle" (polar pt1 (angle pt1 pt2) (/ (distance pt1 pt2) 2.0)) 50) ;w polowie
(command "_circle" (polar pt1 (angle pt1 pt2) (/ (distance pt1 pt2) 4.0)) 50) ;1/4 do piwerwszego punktu
)


;ZROB OSOBNE FUNKCJE
(defun c:sssssssss (/ ss vevo)
  (if
    (setq ss (car (entsel "\nPick an object dimension")))
    (progn
      (setq vevo (vlax-ename->vla-object ss))
      (vlax-dump-object vevo) select a option as what are you need

      (setq tc (vlax-get vevo 'TextColor))
      (vlax-put vevo 'TextColor 1)
      ) ; progn
    (alert "\nInvalid selected object,try again")
    )   ; if
  (princ)
  )
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  


















;(c) Kuba Miszcz 
(defun C:asdfg (/ name ss sslen cnt blck ent entinfo blk-ref adoc blk)


;; ZMIANA KOLOROW ATRYBOTOW NA "JAK WARSTWA"
  ;(initget 7)
  ;(setq AttribColor (getint "\n Podaj numer koloru atrybutów: "))
  (setq AttribColor 256) ;kolor jak warstwa
  ;(cond ((not AttribColor) (setq AttribColor 11)))
  (setq ss (ssget "x" '((0 . "INSERT"))))
  (setq cnt 0)
  (setq sslen (sslength ss))
  (while (< cnt sslen)
    (setq blck (ssname ss cnt))
    (setq ent (entnext blck))
    (setq entinfo (entget ent))
    (while
      (and ent (= (cdr (assoc 0 entinfo)) "ATTRIB"))
      (if (assoc 62 entinfo)
      (entmod (subst (cons 62 AttribColor) (assoc 62 entinfo) entinfo))
      (setq entinfo (entmod (append entinfo (list (cons 62 AttribColor)))))
      )
      (entupd ent)
      (setq ent (entnext ent))
      (setq entinfo (entget ent))
    )
    (setq cnt (1+ cnt))
  )
  (princ)


;;;zmiana koloru obiektow w blokach na  "JAK WARSTWA"
  (setq AttribColor 256) ;kolor jak warstwa
  (setq ss (ssget "x" '((0 . "INSERT"))))
  (setq cnt 0)
  (setq sslen (sslength ss))
  (while (< cnt sslen)
    (setq blck (ssname ss cnt))
    (setq cnt (1+ cnt))
    (setq blk-ref (Vlax-ename->vla-object blck))
    (setq adoc (vla-get-ActiveDocument (vlax-get-acad-object)))
    (setq blk (vla-item (vla-get-blocks adoc) (vla-get-name blk-ref)))
    (vlax-for ent blk 
      (if (vlax-property-available-p ent 'Color) 
        (vla-put-Color ent AttribColor)
      )
    )
    (princ (strcat "\n" (itoa cnt)))
  )
  (princ (strcat "\nZmieniono " (itoa cnt) " bloków."))
  (vlax-invoke adoc 'regen 'ActiveViewport)
  (princ)
)



;punkt n aobikecie prostopadly do wskazanego
(defun c:SnapToObj ( / en obj pts_ss ss_len c pten ptobj pted pt pt2)
(setq en (car (entsel "\nSelect Object: ")))
(setq obj (vlax-ename->vla-object en))
(princ "\nSelect points: ")
(setq pts_ss (ssget (list (cons 0 "POINT"))))
(setq ss_len (sslength pts_ss))
(setq c 0)
(while (< c ss_len)
(setq pten (ssname pts_ss c))
(setq ptobj (vlax-ename->vla-object pten))
(setq pted (entget pten))
(setq pt (cdr (assoc 10 pted)))
(setq pt2 (vlax-curve-getClosestPointTo obj pt))
(vla-move ptobj (vlax-3d-point pt) (vlax-3d-point pt2))
(setq c (+ c 1))
)
(princ)
)



;===dla drohgowcow
(defun c:ssload()
  (load (strcat "c:\\madzicad sources\\madzicad_source.lsp"))
  (princ "\n Plik za³adowany.")
  (princ)
)

(defun c:ssssssss(/ warstwa offset1 dlugosc_kreski_dolnej dlugosc_kreski_gornej text_height osmodeprev layerprev poziom_porownawczy pt1 pt2 pt3 pt4 pt5 txt_content base_txt)
  ;VVVVVVVVVVVVVVV   ZMIENNE DO DEFIONIOWANIA   VVVVVVVVVVV
  (setq warstwa "widok")
  (setq offset1 0.1)      ;odleglosc poziomu porowanczego do gornej kreski tabelki
  (setq dlugosc_kreski_gornej 0.8)
  (setq dlugosc_kreski_dolnej 0.8)
  (setq text_height 0.18)
  ;^^^^^^^^^^^^^^^^^^   KONIEC ZMIENNYCH    ^^^^^^^^^^^^^^^^^^^^
  
  (defun *error* (errorlevel)
    (setvar "osmode" osmodeprev)
    (setvar "clayer" layerprev)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  
  (if (= (tblsearch "layer" "widok") nil)
    (setq warstwa (getvar "clayer"))
  )
  (setq layerprev (getvar "clayer"))
  (setq osmodeprev (getvar "osmode"))

  (setvar "clayer" warstwa)
  
  (setq poziom_porownawczy (getreal "\n Podaj wysokoœæ poziomu porównawczego: "))
  (setq pt1 (getpoint "\n Wska¿ przeciêcie poziomu porównawczego z osi¹ drogi"))
  (command "_ucs" pt1 "")
  
  (setq pt1 (getpoint "\n Wska¿ punkt: "))
  
  (setvar "osmode" 0)
  
  (while (/= pt1 nil)
    (progn 

      (setq pt2 (list (car pt1) 0.0 (caddr pt1)))
      (setq pt3 (list (car pt2) (- (cadr pt2) offset1) (caddr pt2)))
      (setq pt4 (list (car pt3) (- (cadr pt3) dlugosc_kreski_gornej) (caddr pt3)))
      (setq pt5 (list (car pt4) (- (cadr pt4) dlugosc_kreski_dolnej) (caddr pt4)))
      
      (command "_line" pt1 pt2 "")
      (command "_line" pt3 pt4 pt5 "")

      ;gorna linijka - wysokosc
      (setq txt_content (rtos (+ poziom_porownawczy (cadr pt1)) 2 2))
      (setq base_txt 
        (list 
          (- (car pt3) (* text_height 0.75)) 
          (- (cadr pt3) (/ dlugosc_kreski_gornej 2)) 
          (caddr pt3)
        )
      )
      (command "_text" "_justify" "_mcenter" base_txt text_height 90 txt_content)  (setq txt_content (rtos (cadr pt1) 2 2))
      
      ;dolna linijka - odleglosc od osi
      (setq txt_content (rtos (abs (car pt1)) 2 2))
      (setq base_txt 
        (list 
          (- (car pt4) (* text_height 0.75)) 
          (- (cadr pt4) (/ dlugosc_kreski_dolnej 2)) 
          (caddr pt4)
        )
      )
      (command "_text" "_justify" "_mcenter" base_txt text_height 90 txt_content)
      
      (setq pt1 (getpoint "\n Wska¿ punkt: "))
    )
  )
  
  (setvar "osmode" osmodeprev)
  (setvar "clayer" layerprev)
  (princ)
)

(defun c:zz(/ warstwa offset1 dlugosc_kreski_dolnej dlugosc_kreski_gornej text_height osmodeprev layerprev poziom_porownawczy pt1 pt2 pt3 pt4 pt5 txt_content base_txt)
  ;VVVVVVVVVVVVVVV   ZMIENNE DO DEFIONIOWANIA   VVVVVVVVVVV
  (setq warstwa "widok")
  (setq offset1 0.1)      ;odleglosc poziomu porowanczego do gornej kreski tabelki
  (setq dlugosc_kreski_gornej 0.8)
  (setq dlugosc_kreski_dolnej 0.8)
  (setq text_height 0.18)
  ;^^^^^^^^^^^^^^^^^^   KONIEC ZMIENNYCH    ^^^^^^^^^^^^^^^^^^^^
  
  (defun *error* (errorlevel)
    (setvar "osmode" osmodeprev)
    (setvar "clayer" layerprev)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  
  (if (= (tblsearch "layer" "widok") nil)
    (setq warstwa (getvar "clayer"))
  )
  (setq layerprev (getvar "clayer"))
  (setq osmodeprev (getvar "osmode"))

  (setvar "clayer" warstwa)
  
  (setq poziom_porownawczy (getreal "\n Podaj wysokoœæ poziomu porównawczego: "))
  (setq pt1 (getpoint "\n Wska¿ przeciêcie poziomu porównawczego z osi¹ drogi"))
  (command "_ucs" pt1 "")
  
  (setq pt1 (getpoint "\n Wska¿ punkt: "))
  
  (setvar "osmode" 0)
  
  (while (/= pt1 nil)
    (progn 

      (setq pt2 (list (car pt1) 0.0 (caddr pt1)))
      (setq pt3 (list (car pt2) (- (cadr pt2) offset1) (caddr pt2)))
      (setq pt4 (list (car pt3) (- (cadr pt3) dlugosc_kreski_gornej) (caddr pt3)))
      (setq pt5 (list (car pt4) (- (cadr pt4) dlugosc_kreski_dolnej) (caddr pt4)))
      
      (command "_line" pt1 pt2 "")
      (command "_line" pt3 pt4 pt5 "")

      ;gorna linijka - wysokosc
      (setq txt_content (rtos (+ poziom_porownawczy (cadr pt1)) 2 2))
      (setq base_txt 
        (list 
          (- (car pt3) (* text_height 0.75)) 
          (- (cadr pt3) (/ dlugosc_kreski_gornej 2)) 
          (caddr pt3)
        )
      )
      (command "_text" "_justify" "_mcenter" base_txt text_height 90 txt_content)  (setq txt_content (rtos (cadr pt1) 2 2))
      
      ;dolna linijka - odleglosc od osi
      (setq txt_content (rtos (abs (car pt1)) 2 2))
      (setq base_txt 
        (list 
          (- (car pt4) (* text_height 0.75)) 
          (- (cadr pt4) (/ dlugosc_kreski_dolnej 2)) 
          (caddr pt4)
        )
      )
      (command "_text" "_justify" "_mcenter" base_txt text_height 90 txt_content)
      
      (setq pt1 (getpoint "\n Wska¿ punkt: "))
    )
  )
  
  (setvar "osmode" osmodeprev)
  (setvar "clayer" layerprev)
  (princ)
)




;==============DCL===========
(defun c:cd()
  (load "c:\\test.lsp")
)














