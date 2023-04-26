;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el
(package! dotenv
  :recipe (:host github :repo "pkulev/dotenv.el"))

(package! elcord)

(package! prisma-mode :recipe (:host github :repo "pimeys/emacs-prisma-mode" :branch "main"))
(package! org-roam
  :recipe (:host github :repo "org-roam/org-roam" :branch "main"))
(package! citar-org-roam)
(package! org-roam-ui)
(package! emacsql-sqlite-builtin)
