PRINCE=prince

FILEDIR = files
RESUMES = $(wildcard resume*.html)
PDFS = $(patsubst %.html,$(FILEDIR)/%.pdf,$(RESUMES))

$(FILEDIR)/%.pdf: %.html
	$(PRINCE) $< -o $@

all: $(PDFS)
