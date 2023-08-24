.PHONY: examples

CC = xelatex
EXAMPLES_DIR = examples
# sadly xetex doesn't like separate output dir
OUTPUT_DIR = $(EXAMPLES_DIR)
RESUME_DIR = $(EXAMPLES_DIR)/resume
CV_DIR = $(EXAMPLES_DIR)/cv
SHARED_DIR = $(EXAMPLES_DIR)/shared
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

examples: $(foreach x, coverletter cv resume, $x.pdf)

resume.pdf: $(EXAMPLES_DIR)/resume.tex $(RESUME_SRCS)
	mkdir -p "$(OUTPUT_DIR)"
	$(CC) -output-directory=$(OUTPUT_DIR) $<

cv.pdf: $(EXAMPLES_DIR)/cv.tex $(CV_SRCS)
	mkdir -p "$(OUTPUT_DIR)"
	$(CC) -output-directory=$(OUTPUT_DIR) $<

coverletter.pdf: $(EXAMPLES_DIR)/coverletter.tex
	mkdir -p "$(OUTPUT_DIR)"
	$(CC) -output-directory=$(OUTPUT_DIR) $<

clean:
	rm -rf $(OUTPUT_DIR)/*.pdf
