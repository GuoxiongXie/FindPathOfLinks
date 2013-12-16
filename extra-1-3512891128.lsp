(defun find-URL-path (start goal)
  (with-open-file (stream "/Users/felixxie/Documents/class record/USC/Fall 13/AI/Project/extra/graph")
    (bfs (read stream) start goal)))


(defun bfs (graphList start goal)
  (setq expandedNodes '())
  (setq queue '())

  (setq queue (append queue (list (list start)))) ;(("start")) want (("s")("a" "s"))
  (loop while (eql (null queue) nil) do
	(setq curNode (caar queue)) ;get the current node being expanded
	(setq queue (cdr queue)) ;remove the path being expanded
	(cond
	 (
	
  


(defun populateTable (table graphlist)
  (cond
   ((eql nil graphlist) 
    (print (gethash "http://www.berkeley.edu/" table))) ;do i need to return the table?
   (t  ;not base case 
    (setf (gethash (caar graphlist) table) (cadar graphlist))
    (populateTable table (cdr graphlist)))))
