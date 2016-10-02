(defvar corpus-options
  (list
   "corpus/jeeves.txt"    ;Jeeves
   "corpus/pride.txt"     ;Pride and Prejudice
   "corpus/oanc.txt"      ;OANC spoken conversations
   )
  )

(defun parse-corpus (corpus)
  "Reads the corpus and returns the entire corpus as a string"
  (with-open-file (stream corpus)
    (let ((data (make-string (file-length stream))))
      (read-sequence data stream)
      (remove
       "/"
       (string-trim '(#\Space #\Tab #\Newline #\\ #\*) data)
       :key #'string
       :test #'equal))))

(defun split (seq)
  "Takes string corpus and splits it into individual words, separated by spaces"
  (loop for i = 0 then (1+ j)
     as j = (position #\Space seq :start i)
     collect (subseq seq i j)
     while j))

(defun get-quadruples (words)
  "Creates a list of all quadruples"
  (loop for i from 0 to (- (length words) 3)
     collect
       (list (nth i words)
	     (nth (+ 1 i) words)
	     (nth (+ 2 i) words)
	     (nth (+ 3 i) words))))

(defun get-corpus-words (corpus)
  "Gets the words of given corpus"
  (let ((parsed-corpus (parse-corpus corpus)))
    (split parsed-corpus)))

(defun get-word-associations (words)
  "Creates word associations"
  (let* ((key NIL)
	 (quadruples (get-quadruples words))
	 (hash (make-hash-table :test 'equal :rehash-size 100)))
    (loop for (w1 w2 w3 w4) in quadruples
       do (setf key (list w1 w2 w3))
	 (if (gethash key hash)
	     (push w4 (gethash key hash))
	     (setf (gethash key hash) (list w4))))
    hash))

(defun random-choice (options)
  "Taken from Norvig code, also can be found in CL library"
  (elt options (random (length options))))

(defun generate-text (words associations length)
  "Generates text based on word associations"
  (let* ((seed (random (- (length words) 4)))
	 (word-1 (nth seed words))
	 (word-2 (nth (+ 1 seed) words))
	 (word-3 (nth (+ 2 seed) words))
	 (generated-words (list))
	 (temp nil))
    (loop for i from 1 to length do
	 (push word-1 generated-words)
	 (setf temp word-1)
	 (setf word-1 word-2)
	 (setf word-2 word-3)
	 (setf word-3 (random-choice
		       (gethash
			(list temp word-1 word-2)
			associations))))
    (format t "~{ ~A ~}" (reverse generated-words))))

(defun run (corpus length)
  (let* ((words (get-corpus-words corpus))
	 (associations (get-word-associations words)))
    (generate-text words associations length)))
