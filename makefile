
include userconfig.mk

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

.PHONY: clean more quick clean-lite port git-clean

git-clean:
	rm -f $(NAME).aux $(NAME).log $(NAME).toc $(NAME).out $(TARGET) $(TEXPORT)
	rm -f *~

clean-lite:
	rm -f $(NAME).aux $(NAME).log $(NAME).toc $(NAME).out $(TEXPORT)

more: $(TEXPORT)
	$(PDF_BUILDER) $(TEXPORT)
	
clean:
	rm -f $(NAME).aux $(NAME).log $(NAME).toc $(NAME).out $(TARGET) $(TEXPORT)

quick: $(TEXPORT)
	$(PDF_BUILDER) $(TEXPORT)
	$(PDF_VIEWER) $(TARGET) &

