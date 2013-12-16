(defun find-URL-path (start goal)
  (with-open-file (stream "/Users/felixxie/Documents/class record/USC/Fall 13/AI/Project/extra/graph")
    (cond
     ((equal start goal) (list start)) ;if start and goal are the same website just '(start)
     (t
      (bfs (read stream) start goal)))))


(defun bfs (graphList start goal)
  (setq expandedNodes '())
  (setq queue '())
  
  (setq queue (append queue (list (list start)))) ;(("start")) want (("s")("a" "s")) as queue
  ;note that within each inner (), the newer node comes first

  (loop while (eql (null queue) nil) do
	(setq curPath (car queue)) ;the curNode in this sequence
	(setq curNode (caar queue)) ;get the current node being expanded
	(setq queue (cdr queue)) ;remove the path being expanded
	(cond
	 ((notExpanded curNode expandedNodes)
	  (setq expandedNodes (append expandedNodes (list curNode))) ;add to expandedNode

	  (cond 
	   ;if goal, return curPath (need to format it tho)
	   ((equal curNode goal) (return-from bfs (genResult (reverse curPath) '())))
	   ;if not goal, get successor
	   (t ;not goal; want buildNewPart returns '((child parent) (child parent))
	    (setq queue (append queue (buildNewPart curNode curPath graphList)))))) 

	 (t ))) ;already expanded, go to next round of loop

  ;finish looping, no goal is hit
  '(Sorry but no path is found))

(defun buildNewPart (curNode curPath graphList) ;need to return '((child parent) (child parent))
  (mapcar (lambda (child) (cons child curPath)) (getSuccessors curNode graphList)))

;debug: need to handle the case when disconnected from graph
(defun getSuccessors (curNode graphList)
  (cond
   ((equal curNode (caar graphList)) (cadar graphList))
   (t  ;maybe need to handle when no match is found
    (getSuccessors curNode (cdr graphList)))))
 
  
(defun notExpanded (curNode expandedNodes)  ;tested
  (cond
   ((null expandedNodes) t) ;'() or nil
   ((equal curNode (car expandedNodes)) nil)
   (t (notExpanded curNode (cdr expandedNodes)))))

(defun genResult (path cum) ;cum is used for cummulating results; originally cum='(); tested
  (cond
   ((null (cdr path)) cum) ;there's only one element left
   (t
    (genResult (cdr path) (append cum (list (list (car path) (cadr path))))))))
