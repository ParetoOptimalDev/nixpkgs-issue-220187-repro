(require 'tramp)
(message "")

(message "using the docker haskell image")
(message (concat "correct path is: " "/root/.cabal/bin:/root/.local/bin:/opt/ghc/9.4.2/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"))

(message "show what happens with tramp-own-remote-path at front")
(let ((docker-container-id (string-trim (shell-command-to-string "docker run -it --rm --detach haskell"))))
  (let ((default-directory (concat "/docker:" docker-container-id ":"))
	(tramp-remote-path '(tramp-own-remote-path)))
        (message docker-container-id)
	(message (concat "path is: " (truncate-string-to-width (eshell-command-result "echo $PATH") 100)))))

(message "simluate what nix does now and demonstrate bug")

(let ((docker-container-id (string-trim (shell-command-to-string "docker run -it --rm --detach haskell"))))
  (let ((default-directory (concat "/docker:" docker-container-id ":"))
	(tramp-remote-path '("/nix/something" tramp-own-remote-path)))
        (message docker-container-id)
	(message (concat "path is: " (truncate-string-to-width (eshell-command-result "echo $PATH") 100)))))


