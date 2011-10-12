
# default values
NAME=main
PDF_BUILDER=pdflatex
PDF_VIEWER=evince
WARNING_TEXT="Warning"

# use such a file to override these values for your platform/project...
-include userconfig.mk

TARGET=$(NAME).pdf
TEXFILE=$(NAME).tex
TEXPORT=$(NAME).portable

$(TARGET): $(TEXPORT)
	$(PDF_BUILDER) $(TEXPORT)
	$(PDF_BUILDER) $(TEXPORT)
	$(PDF_BUILDER) $(TEXPORT)

$(TEXPORT): $(TEXFILE)
	cat $(TEXFILE)|sed 's/ä/{\\"a}/g'|sed 's/ö/{\\"o}/g'|sed 's/ü/{\\"u}/g'|sed 's/ß/{\\ss}/g'|sed 's/Ä/{\\"A}/g'|sed 's/Ö/{\\"O}/g'|sed 's/Ü/{\\"U}/g' >$(TEXPORT)


all: $(TARGET)

.PHONY: clean more quick clean-lite port git-clean tidy warning once

git-clean:
	make clean
	rm -f *~

clean-lite:
	rm -f $(NAME).aux $(NAME).log $(NAME).toc $(NAME).out $(TEXPORT) $(NAME).lof

more: $(TEXPORT)
	$(PDF_BUILDER) $(TEXPORT)
	
clean:
	rm -f $(NAME).aux $(NAME).log $(NAME).toc $(NAME).out $(TARGET) $(TEXPORT) $(NAME).lof

tidy:
	make
	make clean-lite	

quick: $(TEXPORT)
	$(PDF_BUILDER) $(TEXPORT)
	$(PDF_VIEWER) $(TARGET) &

warning: $(TEXPORT)
	$(PDF_BUILDER) $(TEXPORT)|grep -i -E $(WARNING_TEXT)|cat
	@echo "checked"

once: $(TEXPORT)
	$(PDF_BUILDER) $(TEXPORT)

