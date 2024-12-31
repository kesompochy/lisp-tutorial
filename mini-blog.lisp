(defvar *articles* (make-hash-table))
(defvar *next-id* 0)

(defstruct article
  id
  title
  content
  created-at)

(defun create-article (title content)
  (let ((article (make-article :id *next-id*
                               :title title
                               :content content
                               :created-at (get-universal-time))))
    (setf (gethash *next-id* *articles*) article)
    (incf *next-id*)
    article))

(defun get-article (id)
  (gethash id *articles*))

(defun list-article ()
  (loop for article being the hash-values of *articles*
        collect article))

(defun delete-article (id)
  (remhash id *articles*))

(create-article "First Post" "Hello, world!")
(create-article "Second Post" "Goodbye, world!")
(list-article)
