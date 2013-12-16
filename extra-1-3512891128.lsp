(defun find-URL-path (start goal)
  (with-open-file (stream "/Users/felixxie/Documents/class record/USC/Fall 13/AI/Project/extra/graph")

    (defparameter table (make-hash-table))

    (mapcar (lambda (kvPair) (setf (gethash (car kvPair) table) (cadr kvPair))) (read stream))
    (gethash start table)
))
    ;(cond
     ;((equalp (caar graphList) start) 888)
     ;(t 17))))
    ;(print (list-length (read stream)))))  ;use read will return a list, we can call car on it


(defun populateTable (table graphlist)
  (cond
   ((eql nil graphlist) 
    (print (gethash "http://www.berkeley.edu/" table))) ;do i need to return the table?
   (t  ;not base case 
    (setf (gethash (caar graphlist) table) (cadar graphlist))
    (populateTable table (cdr graphlist)))))
