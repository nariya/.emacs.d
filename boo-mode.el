;; ;; --------
;; ;; BOO/UNITY SYNTAX HIGHLIGHTING
;; ;;
;; ;; Define faces
;; (defface boo-modifier-face
;;   '((t (:inherit font-lock-function-name-face)))
;;   "Face for Boo modifiers (public, static, etc.)")
;; (defvar boo-modifier-face 'boo-modifier-face)
 
;; (defface boo-type-face
;;   '((t (:inherit font-lock-constant-face)))
;;   "Face for Boo/CLI variable types (int, double, etc.)")
;; (defvar boo-type-face 'boo-type-face)
 
;; (defface unity-keyword-class-face
;;   '((t (:inherit font-lock-variable-name-face)))
;;   "Face for Unity-specific class keywords (MonoBehavior, Vector3, etc)")
;; (defvar unity-keyword-class-face 'unity-keyword-class-face)
 
;; (defface unity-idioms-face
;;   '((t (:underline t)))
;;   "Face for common Unity 'idioms' like 'gameObject.GetComponent'")
;; (defvar unity-idioms-face 'unity-idioms-face)
 
;; ;; Define regex expressions for highlighting
;; (defvar boo-font-lock-keywords
;;   (let ((kw1 (mapconcat 'identity
;;          '("public" "static" "private")
;;          "\\|"))
;;     (kw2 (mapconcat 'identity
;;          '("MonoBehavior" "Material" "PhysicMaterial"
;;            "GameObject" "MeshFilter" "MeshRenderer"
;;            "Vector2" "Vector3" "MeshCollider")
;;          "\\|"))
;;     (kw3 (mapconcat 'identity
;;          '("sbyte" "short" "int" "long" "byte" "ushort"
;;            "uint" "ulong" "single" "double" "decimal" "char"
;;            "bool")
;;          "\\|"))
;;     (kw4 (mapconcat 'identity
;;          '("transform.Translate" "gameObject.GetComponent"
;;            "Destroy" "gameObject.FindWithTag" "gameObject.Find")
;;          "\\|"))
;;     )
;;     (list
;;      ;; variable/class/function modifiers
;;      (list (concat "\\([^. \t]\\|^\\)[ \t]*\\b\\([" kw1 "\\| ]+\\)\\b[ \b\t]")
;;        2 boo-modifier-face)
;;      ;; Unity-specific classes and such
;;      (list (concat "[ ()\t]+\\(" kw2 "\\)[ )(\t\n]+")
;;        1 unity-keyword-class-face)
;;      ;; BOO/CLI variable types
;;      (list (concat "\\b\\(" kw3 "\\)\\b")
;;        1 boo-type-face)
;;      ;; Unity-specific commonly used "idioms"
;;      (list (concat "\\(" kw4 "\\)")
;;        1 unity-idioms-face)
;;      ))
;;   "Additional expression to highlight in Boo mode.")
 
;; ;; Define a new mode, boo-mode, derived from python-mode. This
;; ;; will currently just function as python-mode with some additional
;; ;; syntax highlighting.
;; (define-derived-mode boo-mode python-mode
;;   "boo-mode"
;;   "syntax highlighting for boo. derived from python-mode"
;;   (font-lock-add-keywords 'boo-mode boo-font-lock-keywords)
;;   ;;(font-lock-add-keywords 'python-mode boo-font-lock-keywords)
;; )
 
