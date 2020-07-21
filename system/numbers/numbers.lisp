;;;; Numbers

(in-package :mezzano.internals)

(defconstant most-negative-single-float (%integer-as-single-float #xFF7FFFFF))
(defconstant least-negative-single-float (%integer-as-single-float #x80000001))
(defconstant least-negative-normalized-single-float (%integer-as-single-float #x80800000))
(defconstant most-positive-single-float (%integer-as-single-float #x7F7FFFFF))
(defconstant least-positive-single-float (%integer-as-single-float #x00000001))
(defconstant least-positive-normalized-single-float (%integer-as-single-float #x00800000))
(defconstant single-float-epsilon (%integer-as-single-float #x33800001))
(defconstant single-float-negative-epsilon (%integer-as-single-float #x33000001))
(defconstant single-float-negative-infinity (%integer-as-single-float #xFF800000))
(defconstant single-float-positive-infinity (%integer-as-single-float #x7F800000))
(defconstant single-float-nan (%integer-as-single-float #x7FC00000)
  "A single-float quiet NaN value.")
(defconstant single-float-trapping-nan (%integer-as-single-float #x7F800001)
  "A single-float trapping NaN value.")
(defconstant most-positive-fixnum-single-float (%integer-as-single-float #x5E7FFFFF)
  "The largest fixnum that can be represented exactly by a single-float, as a single-float.")
(defconstant most-negative-fixnum-single-float (%integer-as-single-float #xDE800000)
  "The smallest fixnum that can be represented exactly by a single-float, as a single-float.")

(defconstant most-negative-double-float (%integer-as-double-float #xFFEFFFFFFFFFFFFF))
(defconstant least-negative-double-float (%integer-as-double-float #x8000000000000001))
(defconstant least-negative-normalized-double-float (%integer-as-double-float #x8010000000000000))
(defconstant most-positive-double-float (%integer-as-double-float #x7FEFFFFFFFFFFFFF))
(defconstant least-positive-double-float (%integer-as-double-float #x0000000000000001))
(defconstant least-positive-normalized-double-float (%integer-as-double-float #x0010000000000000))
(defconstant double-float-epsilon (%integer-as-double-float #x3CA0000000000001))
(defconstant double-float-negative-epsilon (%integer-as-double-float #x3C90000000000001))
(defconstant double-float-negative-infinity (%integer-as-double-float #xFFF0000000000000))
(defconstant double-float-positive-infinity (%integer-as-double-float #x7FF0000000000000))
(defconstant double-float-nan (%integer-as-double-float #x7FF8000000000000)
  "A double-float quiet NaN value.")
(defconstant double-float-trapping-nan (%integer-as-double-float #x7FF0000000000001)
  "A double-float trapping NaN value.")
(defconstant most-positive-fixnum-double-float (%integer-as-double-float #x43CFFFFFFFFFFFFF)
  "The largest fixnum that can be represented exactly by a double-float, as a double-float.")
(defconstant most-negative-fixnum-double-float (%integer-as-double-float #xC3D0000000000000)
  "The smallest fixnum that can be represented exactly by a double-float, as a double-float.")

(defconstant most-negative-short-float (%integer-as-short-float #xFBFF))
(defconstant least-negative-short-float (%integer-as-short-float #x8001))
(defconstant least-negative-normalized-short-float (%integer-as-short-float #x8400))
(defconstant most-positive-short-float (%integer-as-short-float #x7BFF))
(defconstant least-positive-short-float (%integer-as-short-float #x0001))
(defconstant least-positive-normalized-short-float (%integer-as-short-float #x0400))
(defconstant short-float-epsilon (%integer-as-short-float #x6801))
(defconstant short-float-negative-epsilon (%integer-as-short-float #x6001))
(defconstant short-float-negative-infinity (%integer-as-short-float #xFC00))
(defconstant short-float-positive-infinity (%integer-as-short-float #x7C00))
(defconstant short-float-nan (%integer-as-short-float #x7E00)
  "A short-float quiet NaN value.")
(defconstant short-float-trapping-nan (%integer-as-short-float #x7C01)
  "A short-float trapping NaN value.")
(defconstant most-positive-fixnum-short-float (%integer-as-short-float #x7BFF)
  "The largest fixnum that can be represented exactly by a short-float, as a short-float.")
(defconstant most-negative-fixnum-short-float (%integer-as-short-float #xFBFF)
  "The smallest fixnum that can be represented exactly by a short-float, as a short-float.")

(defconstant most-negative-long-float most-negative-double-float)
(defconstant least-negative-long-float least-negative-double-float)
(defconstant least-negative-normalized-long-float least-negative-normalized-double-float)
(defconstant most-positive-long-float most-positive-double-float)
(defconstant least-positive-long-float least-positive-double-float)
(defconstant least-positive-normalized-long-float least-positive-normalized-double-float)
(defconstant long-float-epsilon double-float-epsilon)
(defconstant long-float-negative-epsilon double-float-negative-epsilon)
(defconstant long-float-negative-infinity double-float-negative-infinity)
(defconstant long-float-positive-infinity double-float-positive-infinity)
(defconstant long-float-nan double-float-nan
  "A long-float quiet NaN value.")
(defconstant long-float-trapping-nan double-float-trapping-nan
  "A long-float trapping NaN value.")
(defconstant most-positive-fixnum-long-float most-positive-fixnum-double-float
  "The largest fixnum that can be represented exactly by a long-float, as a long-float.")
(defconstant most-negative-fixnum-long-float most-negative-fixnum-double-float
  "The smallest fixnum that can be represented exactly by a long-float, as a long-float.")

(defmacro define-commutative-arithmetic-operator (name base identity)
  `(progn (defun ,name (&rest numbers)
            (declare (dynamic-extent numbers))
            (let ((result ,identity))
              (dolist (n numbers)
                (setf result (,base result n)))
              result))
          (define-compiler-macro ,name (&rest numbers)
            (cond ((null numbers) ',identity)
                  ((null (rest numbers))
                   `(the number ,(first numbers)))
                  (t (let ((result (first numbers)))
                       (dolist (n (rest numbers))
                         (setf result (list ',base result n)))
                       result))))))

(define-commutative-arithmetic-operator + binary-+ 0)
(define-commutative-arithmetic-operator * binary-* 1)

;;; - and / do not fit into the previous template, so have to be
;;; explicitly defined.

(defun - (number &rest more-numbers)
  (declare (dynamic-extent more-numbers))
  (cond (more-numbers
         (let ((result number))
           (dolist (n more-numbers)
             (setf result (binary-- result n)))
           result))
        (t (binary-- 0 number))))

(define-compiler-macro - (number &rest more-numbers)
  (cond ((null more-numbers) `(binary-- 0 ,number))
        (t (let ((result number))
             (dolist (n more-numbers)
               (setf result `(binary-- ,result ,n)))
             result))))

(defun / (number &rest more-numbers)
  (declare (dynamic-extent more-numbers))
  (cond (more-numbers
         (let ((result number))
           (dolist (n more-numbers)
             (setf result (binary-/ result n)))
           result))
        (t (binary-/ 1 number))))

(define-compiler-macro / (number &rest more-numbers)
  (cond ((null more-numbers) `(binary-/ 1 ,number))
        (t (let ((result number))
             (dolist (n more-numbers)
               (setf result `(binary-/ ,result ,n)))
             result))))

(declaim (inline truncate))
(defun truncate (number &optional (divisor 1))
  (%truncate number divisor))

(declaim (inline round))
(defun round (number &optional (divisor 1))
  (%round number divisor))

;; Can't use DEFINE-COMMUTATIVE-ARITHMETIC-OPERATOR here because one-arg GCD is ABS.
;; Types are also wrong (integer vs number).
(defun gcd (&rest integers)
  (declare (dynamic-extent integers))
  (cond
    ((endp integers) 0)
    ((endp (rest integers))
     (check-type (first integers) integer)
     (abs (first integers)))
    (t (reduce #'two-arg-gcd integers))))

(define-compiler-macro gcd (&rest integers)
  (cond ((null integers) '0)
        ((null (rest integers))
         `(abs (the integer ,(first integers))))
        (t (let ((result (first integers)))
             (dolist (n (rest integers))
               (setf result (list 'two-arg-gcd result n)))
             result))))

(defun lcm (&rest integers)
  (cond
    ((endp integers) 1)
    ((endp (rest integers))
     (check-type (first integers) integer)
     (abs (first integers)))
    (t (reduce #'two-arg-lcm integers))))

(defun two-arg-lcm (a b)
  (check-type a integer)
  (check-type b integer)
  (cond ((zerop a) b)
        ((zerop b) a)
        (t (/ (abs (* a b)) (gcd a b)))))

(defmacro define-comparison-operator (name base type)
  `(progn (defun ,name (number &rest more-numbers)
            (declare (dynamic-extent more-numbers))
            (check-type number ,type)
            (dolist (n more-numbers t)
              (unless (,base number n)
                (return nil))
              (setf number n)))
          (define-compiler-macro ,name (number &rest more-numbers)
            (let ((n-numbers (1+ (length more-numbers))))
              (case n-numbers
                (1
                 (let ((the-number (gensym)))
                   `(let ((,the-number ,number))
                      (check-type ,the-number ,',type)
                      t)))
                (2 `(,',base ,number ,(first more-numbers)))
                (t (let* ((all-nums (list* number more-numbers))
                          (syms (loop for i below n-numbers
                                   collect (gensym))))
                     `(let ,(mapcar #'list syms all-nums)
                        (and ,@(let ((prev (first syms)))
                                    (mapcar (lambda (sym)
                                              (prog1 (list ',base prev sym)
                                                (setf prev sym)))
                                            (rest syms))))))))))))

(define-comparison-operator < binary-< real)
(define-comparison-operator <= binary-<= real)
(define-comparison-operator > binary-> real)
(define-comparison-operator >= binary->= real)
(define-comparison-operator = binary-= number)

(defun /= (number &rest more-numbers)
  "Returns true if no two numbers are the same in value; otherwise, returns false."
  (declare (dynamic-extent more-numbers))
  (check-type number number)
  (do ((lhs number (car n))
       (n more-numbers (cdr n)))
      ((endp n) t)
    (dolist (rhs n)
      (check-type rhs number)
      (when (= lhs rhs)
        (return-from /= nil)))))

(define-compiler-macro /= (&whole whole number &rest more-numbers)
  (case (length more-numbers)
    (0 `(the number ,number))
    (1 `(not (= ,number ,(first more-numbers))))
    (t whole)))

(defun min (number &rest more-numbers)
  (declare (dynamic-extent more-numbers))
  (check-type number number)
  (dolist (n more-numbers number)
    (when (< n number)
      (setf number n))))

(define-compiler-macro min (number &rest more-numbers)
  (cond
    ((null more-numbers)
     `(the number ,number))
    ((null (rest more-numbers))
     (let ((lhs (gensym))
           (rhs (gensym)))
       `(let ((,lhs ,number)
              (,rhs ,(first more-numbers)))
          (if (< ,lhs ,rhs)
              ,lhs
              ,rhs))))
    (t (let* ((n (gensym))
              (symbols (mapcar (lambda (x)
                                 (declare (ignore x))
                                 (gensym))
                               more-numbers)))
         `(let ,(cons (list n number)
                      (mapcar 'list symbols more-numbers))
            ,@(mapcar (lambda (sym)
                        `(when (< ,sym ,n)
                           (setf ,n ,sym)))
                      symbols)
            ,n)))))

(defun max (number &rest more-numbers)
  (declare (dynamic-extent more-numbers))
  (check-type number number)
  (dolist (n more-numbers number)
    (when (> n number)
      (setf number n))))

(define-compiler-macro max (number &rest more-numbers)
  (cond
    ((null more-numbers)
     `(the number ,number))
    ((null (rest more-numbers))
     (let ((lhs (gensym))
           (rhs (gensym)))
       `(let ((,lhs ,number)
              (,rhs ,(first more-numbers)))
          (if (> ,lhs ,rhs)
              ,lhs
              ,rhs))))
    (t (let* ((n (gensym))
              (symbols (mapcar (lambda (x)
                                 (declare (ignore x))
                                 (gensym))
                               more-numbers)))
         `(let ,(cons (list n number)
                      (mapcar 'list symbols more-numbers))
            ,@(mapcar (lambda (sym)
                        `(when (> ,sym ,n)
                           (setf ,n ,sym)))
                      symbols)
            ,n)))))

(declaim (inline 1+))
(defun 1+ (x)
  (+ x 1))

(declaim (inline 1-))
(defun 1- (x)
  (- x 1))

(declaim (inline plusp))
(defun plusp (number)
  (> number 0))

(declaim (inline minusp))
(defun minusp (number)
  (< number 0))

(declaim (inline zerop))
(defun zerop (number)
  (= number 0))

(declaim (inline evenp))
(defun evenp (integer)
  (check-type integer integer)
  (eql (logand integer 1) 0))

(declaim (inline oddp))
(defun oddp (integer)
  (check-type integer integer)
  (eql (logand integer 1) 1))

(defun parse-integer (string &key (start 0) end (radix 10) junk-allowed)
  (setf end (or end (length string)))
  (let ((negativep nil)
        (n 0)
        (whitespace '(#\Space #\Newline #\Tab #\Linefeed #\Page #\Return)))
    ;; Eat leading whitespace.
    (do () ((or (>= start end)
                (and (not (member (char string start) whitespace)))))
      (incf start))
    (when (>= start end)
      (if junk-allowed
          (return-from parse-integer (values nil start))
          (error 'simple-parse-error
                 :format-control "No non-whitespace characters in ~S."
                 :format-arguments (list string))))
    (cond ((eql (char string start) #\+)
           (incf start))
          ((eql (char string start) #\-)
           (setf negativep t)
           (incf start)))
    (when (>= start end)
      (if junk-allowed
          (return-from parse-integer (values nil start))
          (error 'simple-parse-error
                 :format-control "No numbers after sign in ~S."
                 :format-arguments (list string))))
    (do ((offset start (1+ offset)))
        ((or (>= offset end)
             (member (char string offset) whitespace))
         (when negativep
           (setf n (- n)))
         (cond (junk-allowed
                (values n offset))
               (t
                ;; All remaining characters must be whitespace.
                (do () ((>= offset end))
                  (when (not (member (char string offset) whitespace))
                    (error 'simple-parse-error
                           :format-control "Junk after trailing whitespace in ~S."
                           :format-arguments (list string)))
                  (incf offset))
                (values n end))))
      (let ((weight (digit-char-p (char string offset) radix)))
        (when (not weight)
          (if junk-allowed
              (return-from parse-integer
                (values (if (eql offset start)
                            nil
                            n)
                        offset))
              (error 'simple-parse-error
                     :format-control "Not a parseable integer ~S."
                     :format-arguments (list string))))
        (setf n (+ (* n radix) weight))))))
