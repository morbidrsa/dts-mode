(defconst dts-version "0.0.1"
  "DTS Mode version number.")

(defgroup dts nil
  "Major mode for editing Device Tree files."
  :prefix "dts-"
  :group 'languages)

(defcustom dts-file-patterns (list "\\.dts" "\\.dtsi")
  "*List of file patterns for which to automatically invoke dts mode."
  :type '(repeat (regexp :tag "Pattern"))
  :group 'dts)

(defconst dts-keywords
  (eval-when-compile
    (regexp-opt '("compatible" "address-cells" "size-cells"
		  "reg" "ranges" "interrupts" "gpio-cells"
		  "pwm-cells" "device_type" "model"
		  "interrupt-parent" "include" "dts-v1")))
  "DTS types.")

(defconst dts-font-lock-keywords
  (list
   (cons
    (concat "\\<\\(" dts-keywords "\\)\\>")
    'font-lock-keyword-face)
   (cons
    (concat "<\\d+*>")
    'font-lock-constant-face)
   )
   "Subdued level highlighting for DTS mode.")


(define-derived-mode dts-mode c-mode "DTS"
  "Major mode for editing DTS code."
  (defvar dts-mode-syntax-table dts-mode-syntax-table)
  (setq font-lock-maximum-decoration t
	case-fold-search t)
  (setq font-lock-defaults
	'(dts-font-lock-keywords
	  nil
	  T
	  nil
	  nil)))

(provide 'dts-mode)
