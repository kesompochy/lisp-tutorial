(ql:quickload :hunchentoot)

(defvar *server*
  (make-instance 'hunchentoot:easy-acceptor :port 8080))

(hunchentoot:define-easy-handler (hello :uri "/") ()
  (setf (hunchentoot:content-type*) "text/plain")
  "Hello, world!")

(hunchentoot:start *server*)
