;;; init-const.el --- constant might be used later
;;; Commentary:
;; some constants which might be used later

;;; Code:
(defconst sys/linuxp
  (eq system-type 'gnu/linux)
  "Are we running on a GNU/Linux system?")

(defconst sys/linux-x-p
  (and (display-graphic-p) sys/linuxp)
  "Are we running under X on a GNU/Linux system?")

(provide 'init-const)
;;; const.el ends here
