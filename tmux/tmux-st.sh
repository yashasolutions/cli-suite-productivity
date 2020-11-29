tmux new-session -s $1 \; \
	rename-window 'DASH' \;\
  split-window -v \; \
	new-window -c '' \; \
	rename-window 'CODE' \; \
  send-keys 'cd ~/code/ ; clear' C-m \; \
  split-window -h  \; \
  send-keys 'cd ~/code/ ; clear' C-m \; \
  select-pane -t 1 \; \
  split-window -v \; \
  send-keys 'cd ~/code/ ; clear' C-m \; 


