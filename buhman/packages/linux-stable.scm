(define-module (buhman packages linux-stable)
  #:use-module (srfi srfi-1)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages linux))

(define (linux-stable-url version)
  (string-append
   "https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-" version ".tar.xz"))

(define kernel-config
  (string-append (dirname (current-filename)) "/kernel.config"))

(define-public linux-stable
  (package
   (inherit linux-libre)
   (name "linux-stable")
   (version "5.2.5")
   (source (origin
            (method url-fetch)
            (uri (linux-stable-url version))
            (sha256
             (base32
              "15ndscsp3yqgas901g6inpmyvinz4cwr5y3md516j2pr8cl40if6"))))))
