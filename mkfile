PRINCE=prince
RESUMES=`ls resume*.html`
PDFS=${RESUMES:%.html=files/%.pdf}

files/%.pdf: %.html
	$PRINCE $prereq -o $target

all:V: $PDFS
