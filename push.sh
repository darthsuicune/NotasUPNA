if [ $# -ne 1  ]; then
	echo "Wrong number of arguments used. Usage: push.sh <commit message>."
else
	rm -r bin;
	git add * &&
	git commit -m "$1" &&
	git push notasgithub
fi
