; dark theme
(defmethod customize-instance ((browser browser) &key)
  (setf (slot-value browser 'theme) theme:+dark-theme+))

(define-configuration buffer
  ((default-modes
    (pushnew 'nyxt/mode/vi:vi-normal-mode %slot-value%))))

; ; default vim
; (define-configuration (:modable-buffer)
;   ((default-modes `(:vi-normal-mode ,@%slot-value%))))

; prompt emacs keys
(define-configuration (:prompt-buffer)
  ((default-modes (pushnew :emacs-mode %slot-value%))))

; (define-configuration (:prompt-buffer :editor-buffer)
;   ((default-modes
;     (pushnew 'nyxt/mode/emacs-mode %slot-value%))))
