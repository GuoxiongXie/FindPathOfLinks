(defun readAFile ()
(with-open-file (stream "/Users/felixxie/Documents/class record/USC/Fall 13/AI/Project/extra/graph")
    (print (read stream))))  ;use read will return a list, we can call car on it