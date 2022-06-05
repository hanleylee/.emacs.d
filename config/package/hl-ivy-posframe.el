(provide 'hl-ivy-posframe)

(use-package ivy-posframe
  ;; display at `ivy-posframe-style'
  :config
  ;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display)))
  (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-center)))
  ;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-window-center)))
  ;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-bottom-left)))
  ;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-window-bottom-left)))
  ;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-top-center)))
  ;; Different command can use different display function.
  (setq ivy-posframe-parameters
        '((left-fringe . 8)
          (right-fringe . 8)
          (alpha . 50)))

  (defun my-ivy-posframe-get-size ()
    "Set the ivy-posframe size according to the current frame."
    (let ((height (or ivy-posframe-height (or ivy-height 10)))
          (width (min (or ivy-posframe-width 200) (round (* .75 (frame-width))))))
      (list :height height :width width :min-height height :min-width width)))

  (setq ivy-posframe-size-function 'my-ivy-posframe-get-size)
  
  ;; (setq ivy-posframe-min-width 90
  ;;       ivy-posframe-width 110)
  (setq ivy-posframe-height-alist '((swiper . 50)
                                    (t      . 40)))

  ;; (setq ivy-posframe-display-functions-alist
  ;;       '((swiper          . ivy-display-function-fallback)
  ;;         (complete-symbol . ivy-posframe-display-at-point)
  ;;         (counsel-M-x     . ivy-posframe-display-at-window-bottom-left)
  ;;         (t               . ivy-posframe-display)))
  (ivy-posframe-mode 1))
