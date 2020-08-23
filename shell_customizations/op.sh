#Add 1password(op) completion to bash. Read 'op help completion' for changing to another shell.
source <(op completion bash)
#Allow rofi to run 1password
alias signin='op signin > /home/james/.op/session'
