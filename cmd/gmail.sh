#!/bin/bash 

echostuff(){
	echo "TO: $TO"
	echo "BODY  : $BODY"
	echo "ATTACH: $ATTACH"
}

isendmail(){
	mailsend-go -smtp $SMTP_SERVER -port $SMTP_PORT \
	 auth  -user $USER -pass $PASS -from $USER \
	 -sub "$SUBJECT" \
	 $TO  \
	 $ATTACH \
	 body -msg "$imsg"
}
sendmail(){
	mailsend-go -smtp $SMTP_SERVER -port $SMTP_PORT \
	 auth  -user $USER -pass $PASS -from $USER \
	 -sub "$SUBJECT" \
	 $TO  \
	 $ATTACH \
	 body -msg "$BODY"
}
fsendmail(){
	mailsend-go -smtp $SMTP_SERVER -port $SMTP_PORT \
	 auth  -user $USER -pass $PASS -from $USER \
	 -sub "$SUBJECT" \
	 $TO  \
	 $ATTACH \
	 body -file $CONTENT 
}
 
 

SMTP_SERVER="smtp.gmail.com"
SMTP_PORT="587"
FROM="mail@from.com"
USER=$FROM 
PASS="storeyourpasssomewhereelse"
SUBJECT="test"
TO="johann.savalle@gmail.com"
BODY=""
ATTACH=""

# create .gmailrc at home and add FROM, USER and PASS (if user and FROM are similar, just assign FROM to USER) 
. $HOME/.gmailrc

while [[ "$#" -gt 0 ]]; do
    case $1 in
        -t|to) TO="-to $2"; shift ;;
        -f|file) CONTENT="$2";fsendmail;exit; shift;;
        -s|sub) SUBJECT="$2"; shift;;
        -cc|cc) CC="-cc $2"; shift;;
        -a|--attach) ATTACH="attach -file $2"; shift;;
        -m|msg)	BODY="$2"; sendmail; exit; shift;;
        -i|--interactive)	
					while IFS= read -r line; 
					do
						imsg=$imsg$line'\n'
					done 
					shift
					isendmail 
					exit 
					;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

