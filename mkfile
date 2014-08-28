PRINCE=prince

FILEDIR=files
RESUMES=`ls resume*.html`
PDFS=${RESUMES:%.html=$FILEDIR/%.pdf}

$FILEDIR/%.pdf: %.html
	$PRINCE $prereq -o $target

all:V: $PDFS
