PRINCE=prince
STYLES=`find styles`
PDFS=${RESUMES:%.html=files/%.pdf}
RESUMES=`ls resume*.html`
PDFS=${RESUMES:%.html=files/%.pdf}

files/%.pdf: %.html
	$PRINCE $prereq -o $target

all:V: $PDFS
