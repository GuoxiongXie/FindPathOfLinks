(defun find-URL-path (start goal)
  (with-open-file (stream "/Users/felixxie/Documents/class record/USC/Fall 13/AI/Project/extra/graph")
    (cond
     ((equalp (caar (read stream)) start) 888)
     (t 17))))
    ;(print (list-length (read stream)))))  ;use read will return a list, we can call car on it
