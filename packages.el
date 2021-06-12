;;; packages.el --- nutter layer packages file for Spacemacs.
;;
;; This file is not part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; The Commentary section is (c) 2012-2021 Sylvain Benner & Contributors

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `nutter-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `nutter/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `nutter/pre-init-PACKAGE' and/or
;;   `nutter/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst nutter-packages
  '(;; surprisingly, there don't seem to be other layers that depend on package f
    f
    ;; yes indeed, the files for Spacemacs, e.g. the current file, depend on the
    ;; package of which they are part
    (nutter :location (recipe :fetcher github :repo "swinkels/nutter"))
    yasnippet))

(defun nutter/init-f ())

(defun nutter/init-nutter ()
  (use-package nutter
    :commands (nutter-capture
               nutter-capture-select-directory
               nutter-rifle
               nutter-rifle-select-directories)
    :init
    (progn
      (spacemacs/declare-prefix "an" "nutter")
      (spacemacs/set-leader-keys "anc" 'nutter-capture)
      (spacemacs/set-leader-keys "anC" 'nutter-capture-select-directory)
      (spacemacs/set-leader-keys "anr" 'nutter-rifle)
      (spacemacs/set-leader-keys "anR" 'nutter-rifle-select-directories))))

(defun nutter/pre-init-yasnippet ())
