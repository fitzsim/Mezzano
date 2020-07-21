;;;; Theme variables

(in-package :mezzano.gui.theme)

(defvar *foreground* (gui:make-colour-from-octets #xDC #xDC #xCC))
(defvar *background* (gui:make-colour-from-octets #x3E #x3E #x3E #xD8))
(defvar *active-frame* (gui:make-colour-from-octets #x80 #x80 #x80))
(defvar *active-frame-top* (gui:make-colour-from-octets #xFF #xFF #xFF))
(defvar *inactive-frame* (gui:make-colour-from-octets #x40 #x40 #x40))
(defvar *inactive-frame-top* (gui:make-colour-from-octets #x80 #x80 #x80))
(defvar *frame-title* (gui:make-colour-from-octets #x3F #x3F #x3F))
(defvar *filer-lisp-source-code* (gui:make-colour-from-octets #x94 #xBF #xF3))
(defvar *filer-compiled-lisp-code* (gui:make-colour-from-octets #xF0 #xAF #x8F))
(defvar *filer-text* (gui:make-colour-from-octets #xCC #x93 #x93))
(defvar *filer-font* (gui:make-colour-from-octets #x7F #x9F #x7F))
(defvar *filer-media* (gui:make-colour-from-octets #xDC #x8C #xC3))
(defvar *memory-monitor-not-present* (gui:make-colour 0 0 0))
(defvar *memory-monitor-free* (gui:make-colour-from-octets 53 148 254))
(defvar *memory-monitor-wired* (gui:make-colour-from-octets 248 8 23))
(defvar *memory-monitor-wired-backing* (gui:make-colour-from-octets 143 80 10))
(defvar *memory-monitor-active* (gui:make-colour-from-octets 147 253 21))
(defvar *memory-monitor-active-writeback* (gui:make-colour-from-octets 81 145 7))
(defvar *memory-monitor-inactive-writeback* (gui:make-colour-from-octets 82 9 146))
(defvar *memory-monitor-page-table* (gui:make-colour-from-octets 251 131 216))
(defvar *memory-monitor-other* (gui:make-colour-from-octets 121 121 121))
(defvar *memory-monitor-mixed* (gui:make-colour 1 1 1))
(defvar *memory-monitor-graph-background* *background*)
(defvar *memory-monitor-graph-tracker* (gui:make-colour-from-octets 255 0 0))
(defvar *memory-monitor-general-area-usage* (gui:make-colour 0 0 1))
(defvar *memory-monitor-general-area-alloc* (gui:make-colour 0.5 0.5 1))
(defvar *memory-monitor-general-area-commit* (gui:make-colour 0.5 0.2 1))
(defvar *memory-monitor-cons-area-usage* (gui:make-colour 0 1 0))
(defvar *memory-monitor-cons-area-alloc* (gui:make-colour 0.5 1 0.5))
(defvar *memory-monitor-cons-area-commit* (gui:make-colour 0.5 1 0.2))
(defvar *memory-monitor-pinned-area-usage* (gui:make-colour 1 0 0))
(defvar *memory-monitor-wired-area-usage* (gui:make-colour 1 0 1))
(defvar *memory-monitor-function-area-usage* (gui:make-colour 0.75 0.5 0))
(defvar *memory-monitor-wired-function-area-usage* (gui:make-colour 0.75 0.5 1))
(defvar *desktop-text* (gui:make-colour 1 1 1))
(defvar *xterm-background* (gui:make-colour 0 0 0 0.85))

(defun set-desktop-background-image (image)
  (mezzano.supervisor:fifo-push
   (make-instance 'mezzano.gui.desktop::set-background-image :image-pathname image)
   mezzano.internals::*desktop*))

(defun set-desktop-background-colour (colour)
  (mezzano.supervisor:fifo-push
   (make-instance 'mezzano.gui.desktop::set-background-colour :colour colour)
   mezzano.internals::*desktop*))

(defun set-desktop-text-colour (colour)
  (mezzano.supervisor:fifo-push
   (make-instance 'mezzano.gui.desktop::set-text-colour :colour colour)
   mezzano.internals::*desktop*))
