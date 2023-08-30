.PHONY: examples

CC = xelatex
BASE_DIR = documents
# sadly xetex doesn't like separate output dir
OUTPUT_DIR = $(BASE_DIR)
RESUME_DIR = $(BASE_DIR)/resume
CV_DIR = $(BASE_DIR)/cv
SHARED_DIR = $(BASE_DIR)/shared
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

examples: $(foreach x, coverletter cv resume, $x.pdf)

resume.pdf: $(BASE_DIR)/resume.tex $(RESUME_SRCS)
	mkdir -p "$(OUTPUT_DIR)"
	$(CC) -output-directory=$(OUTPUT_DIR) $<

cv.pdf: $(BASE_DIR)/cv.tex $(CV_SRCS)
	mkdir -p "$(OUTPUT_DIR)"
	$(CC) -output-directory=$(OUTPUT_DIR) $<

coverletter.pdf: $(BASE_DIR)/coverletter.tex
	mkdir -p "$(OUTPUT_DIR)"
	$(CC) -output-directory=$(OUTPUT_DIR) $<

clean:
	rm -rf $(OUTPUT_DIR)/*.pdf
