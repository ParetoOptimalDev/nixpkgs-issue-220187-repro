(require 'tramp)
(message "")

(message "using the docker haskell image")
(message (concat "path should be: " "/root/.cabal/bin:/root/.local/bin:/opt/ghc/9.4.2/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"))

(message "show that using tramp-own-remote-path isn't sufficient")
(let ((docker-container-id (string-trim (shell-command-to-string "docker run -it --rm --detach haskell"))))
  (let ((default-directory (concat "/docker:" docker-container-id ":"))
	(tramp-remote-path '(tramp-own-remote-path)))
        (message docker-container-id)
	(message (concat "path is: " (truncate-string-to-width (eshell-command-result "echo $PATH") 100)))))
